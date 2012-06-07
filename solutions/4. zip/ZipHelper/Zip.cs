using System;
using System.IO;
using System.IO.Compression;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Threading.Tasks;
using Windows.Foundation;
using Windows.Storage;

namespace ZipHelper
{
    public sealed class Zip
    {
        // Inefficient copy 
        private static string CopyStreamToString(Stream stream)
        {
            using (var reader = new StreamReader(stream))
            {
                return reader.ReadToEnd();
            }
        }

        // Helper method to workaround bug 669923
        private async static Task<MemoryStream> CopyToMemoryStream(StorageFile file) {
            var memoryStream = new MemoryStream();
            using (var stream = await file.OpenStreamForReadAsync())
            {
                stream.CopyTo(memoryStream);
                memoryStream.Seek(0, SeekOrigin.Begin);
            }
            return memoryStream;
        }

        // Private awaitable async function
        private static async Task<string> ReadFirstFileInternal(StorageFile file)
        {
            using (var memoryStream = await CopyToMemoryStream(file)) 
            {
                using (var archive = new ZipArchive(memoryStream))
                {
                    // Return the first opened file
                    if (archive.Entries.Count > 0)
                    {
                        return CopyStreamToString(archive.Entries[0].Open());
                    }
                    else
                    {
                        return String.Empty; // default case where there aren't any files
                    }
                }
            }
        }

        // Public exposed function that maps an IAsyncOperation<string> to Task<string>
        public static IAsyncOperation<string> ReadFirstFile(StorageFile file)
        {
            return AsyncInfo.Run(token => Zip.ReadFirstFileInternal(file));
        }
    }
}