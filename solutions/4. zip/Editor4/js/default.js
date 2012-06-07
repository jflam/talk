// For an introduction to the Blank template, see the following documentation:
// http://go.microsoft.com/fwlink/?LinkId=232509
(function () {
    "use strict";

    var app = WinJS.Application;
    var activation = Windows.ApplicationModel.Activation;
    WinJS.strictProcessing();

    app.onactivated = function (args) {
        if (args.detail.kind === activation.ActivationKind.launch) {
            if (args.detail.previousExecutionState !== activation.ApplicationExecutionState.terminated) {
                // TODO: This application has been newly launched. Initialize
                // your application here.
            } else {
                // TODO: This application has been reactivated from suspension.
                // Restore application state here.
            }
            args.setPromise(WinJS.UI.processAll());
        }
    };

    // Some aliases to make the code easier to read
    var Pickers = Windows.Storage.Pickers;
    var FileIO = Windows.Storage.FileIO;
    var AccessCache = Windows.Storage.AccessCache;

    app.file_token = null;

    app.open_file = function (args) {
        var openPicker = new Pickers.FileOpenPicker();
        openPicker.viewMode = Pickers.PickerViewMode.list;
        openPicker.suggestedStartLocation = Pickers.PickerLocationId.documentsLibrary;
        openPicker.fileTypeFilter.replaceAll([".htm", ".zip"]);

        openPicker.pickSingleFileAsync().done(function (file) {
            // Squirrel away a token for future access
            app.file_token = AccessCache.StorageApplicationPermissions.futureAccessList.add(file);
            if (file.fileType == ".zip") {
                ZipHelper.Zip.readFirstFile(file).done(function (html) {
                    var clean_html = window.toStaticHTML(html);
                    app.editor.setValue(clean_html);
                });
            } else {
                FileIO.readTextAsync(function (html) {
                    var clean_html = window.toStaticHTML(html);
                    app.editor.setValue(clean_html);
                });
            }
        });
    };

    app.save_file = function (args) {
        var text = app.editor.getValue();
        if (app.file_token == null) {
            var savePicker = new Pickers.FileSavePicker();
            savePicker.suggestedStartLocation = Pickers.PickerLocationId.documentsLibrary;
            savePicker.defaultFileExtension = ".htm";
            savePicker.suggestedFileName = "my_html";
            savePicker.fileTypeChoices.insert("HTML", [".htm"]);

            savePicker.pickSaveFileAsync().done(function (file) {
                if (file) {
                    // Squirrel away a token for future access
                    app.file_token = AccessCache.StorageApplicationPermissions.futureAccessList.add(file);
                    FileIO.writeTextAsync(file, text);
                }
            });
        } else {
            AccessCache.StorageApplicationPermissions.futureAccessList.getFileAsync(app.file_token).done(function (file) {
                if (file) {
                    FileIO.writeTextAsync(file, text);
                }
            });
        }
    };

    app.onloaded = function (args) {
        document.getElementById("cmdOpen").addEventListener("click", app.open_file);
        document.getElementById("cmdSave").addEventListener("click", app.save_file);
    };

    app.oncheckpoint = function (args) {
        // TODO: This application is about to be suspended. Save any state
        // that needs to persist across suspensions here. You might use the
        // WinJS.Application.sessionState object, which is automatically
        // saved and restored across suspension. If you need to complete an
        // asynchronous operation before your application is suspended, call
        // args.setPromise().
    };

    app.start();
})();
