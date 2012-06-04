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

        private static async Task<string> OpenInternal(StorageFile file)
        {
            var extension = Path.GetExtension(file.Name);
            if (extension == ".zip")
            {
                try
                {
                    // Copy the input stream to a MemoryStream to workaround bug 669923
                    using (var memoryStream = new MemoryStream())
                    {
                        using (var stream = await file.OpenStreamForReadAsync())
                        {
                            stream.CopyTo(memoryStream);
                            memoryStream.Seek(0, SeekOrigin.Begin);
                            using (var archive = new ZipArchive(memoryStream))
                            {
                                // Return the first opened file
                                if (archive.Entries.Count > 0)
                                {
                                    return CopyStreamToString(archive.Entries[0].Open());
                                }
                                else
                                {
                                    // Poor man's error handling
                                    return "nothing in the archive";
                                }
                            }
                        }
                    }
                }
                catch (Exception e)
                {
                    // Poor man's error handling
                    return e.Message;
                }
            }
            else
            {
                return CopyStreamToString(await file.OpenStreamForReadAsync());
            }
        }

        // Public exposed function that maps an IAsyncOperation<string> to Task<string>
        public static IAsyncOperation<string> Open(StorageFile file)
        {
            return AsyncInfo.Run(token => Zip.OpenInternal(file));
        }
    }
}