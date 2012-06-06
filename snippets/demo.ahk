;*********************************************************************
; Console commands for Powershell
;*********************************************************************
; Copy files to the right places
#IfWinActive, ahk_class ConsoleWindowClass
::c1::
(
mkdir css
mkdir js
copy ${env:github_talk}\libs\css\* css
copy ${env:github_talk}\libs\js\* js
)
; Copy files to the right places for the Metro style app
::c2::
(
copy ${env:github_talk}\libs\css\* ${env:talk}\Editor\css
copy ${env:github_talk}\libs\js\* ${env:talk}\Editor\js
)
; Cleanup the demo directory -- assumes %TALK% env variable is set
#IfWinActive, ahk_class ConsoleWindowClass
::clean1::
(
cd \
rd -Force -Recurse ${env:talk}
md ${env:talk}
cd ${env:talk}
rd -Force -Recurse css
rd -Force -Recurse js
$null | Set-Content default.html
ls
)
;*********************************************************************
; Commands for Part 1
;*********************************************************************
#IfWinActive
::cat1::
clipboard =
(
<h1>Hello, World!</h1>

<img src="http://www.hotimg.com/direct/dATedwu.gif">
<img src="http://www.hotimg.com/direct/dATedwu.gif">
<img src="http://www.hotimg.com/direct/dATedwu.gif">
<img src="http://www.hotimg.com/direct/dATedwu.gif">
)
send ^v
return
#IfWinActive, ahk_class Notepad2
::r1::
clipboard =
(
<html> 
  <body>
    <textarea id="editor" cols="80" rows="10">&lt;h1&gt;hello, world&lt;/h1&gt;</textarea>
    <div id="output"></div>
    <script>
    window.onload = function() {
      editor.onkeyup = function(args) {
        if (args.ctrlKey && args.key == "Enter") {
          output.innerHTML = editor.innerText;
        }
      };
    };
    </script>
  </body>
</html>
)
send ^v
return
#IfWinActive, ahk_class Notepad2
::r2::
clipboard =
(
  <head>
    <style>
      body { font-family: "Segoe UI"; font-size: 18px; background-color: black; color: white; }
      #editor { height: 90vh; width: 50vw; border: 0px; position: absolute; background-color: black; color: white; font-size: 18px; }
      #output { left: 50vw; width: 50vw; top: 0px; position: absolute; margin-left: 20px; }
    </style>
  </head>
)
send ^v
return
#IfWinActive, ahk_class Notepad2
::r3::
clipboard =
(
    <!-- CodeMirror JS References -->
    <script src="js/codemirror.js"></script>
    <script src="js/htmlmixed.js"></script>
    <script src="js/css.js"></script>
    <script src="js/xml.js"></script>
    <script src="js/javascript.js"></script>
    
)
send ^v
return
#IfWinActive, ahk_class Notepad2
::r4::
clipboard =
(
    <!-- CSS References -->
    <link rel="stylesheet" href="css/codemirror.css" />
    <link rel="stylesheet" href="css/lesser-dark.css" />
    
)
send ^v
return
#IfWinActive, ahk_class Notepad2
::r5::
clipboard =
(
    <style>
      body {
          color: white;
          background-color: black;
          font-family: "Segoe UI";
          font-size: 18px;
      }

      .CodeMirror {
          font-size: 18px;
          width: 50`%;
      }

      .CodeMirror-scroll {
          height: 100vh;
      }    

      #output {
          position: absolute;
          top: 0px;
          width: 50vw;
          left: 50vw;
          height: 100vh;
          margin-left: 20px;
      }
    </style>
)
send ^v
return
#IfWinActive, ahk_class Notepad2
::r6::
clipboard =
(
     <div id="editor"></div>
)
send ^v
return
#IfWinActive, ahk_class Notepad2
::r7::
clipboard =
(
    <script>
      var editor = CodeMirror.fromTextArea(document.getElementById("editor"), {
          lineNumbers: true,
          indentUnit: 2,
          theme: "lesser-dark",
          keyMap: "html_editor"
      });
          
      CodeMirror.keyMap.html_editor = {
          'Ctrl-Enter': function (cm) {
              var html = editor.getValue();
              output.innerHTML = window.toStaticHTML(html);
          },
          fallthrough: ["default"]
      };
    </script>
)
send ^v
return
;*********************************************************************
; Commands for Part 2 
;*********************************************************************
#IfWinNotActive, ahk_class Notepad2
::r8::
clipboard =
(
    <textarea id="editor" cols="80" rows="10">&lt;h1&gt;hello, world&lt;/h1&gt;</textarea>
    <div id="output"></div>
    <script>
    window.onload = function() {
      editor.onkeyup = function(args) {
        if (args.ctrlKey && args.key == "Enter") {
          output.innerHTML = editor.innerText;
        }
      };
    };
    </script>
)
send ^v
return
#IfWinNotActive, ahk_class Notepad2
::r9::
clipboard =
(
    <!-- CodeMirror JS References -->
    <script src="js/codemirror.js"></script>
    <script src="js/htmlmixed.js"></script>
    <script src="js/css.js"></script>
    <script src="js/xml.js"></script>
    <script src="js/javascript.js"></script>

    <!-- CSS References -->
    <link rel="stylesheet" href="css/codemirror.css" />
    <link rel="stylesheet" href="css/lesser-dark.css" />
    
    <style>
      body {
          color: white;
          background-color: black;
          font-family: "Segoe UI";
          font-size: 18px;
      }

      .CodeMirror {
          font-size: 18px;
          width: 50`%;
      }

      .CodeMirror-scroll {
          height: 100vh;
      }    

      #output {
          position: absolute;
          top: 0px;
          width: 50vw;
          left: 50vw;
          height: 100vh;
          margin-left: 20px;
      }
    </style>
)
send ^v
return
#IfWinNotActive, ahk_class Notepad2
::r10::
clipboard =
(
     <div id="editor"></div>
)
send ^v
return
#IfWinNotActive, ahk_class Notepad2
::r11::
clipboard =
(
    <script>
      WinJS.Application.editor  = CodeMirror.fromTextArea(document.getElementById("editor"), {
          lineNumbers: true,
          indentUnit: 2,
          theme: "lesser-dark",
          keyMap: "html_editor"
      });
          
      CodeMirror.keyMap.html_editor = {
          'Ctrl-Enter': function (cm) {
              var html = WinJS.Application.editor.getValue();
              output.innerHTML = window.toStaticHTML(html);
          },
          fallthrough: ["default"]
      };
    </script>
)
send ^v
return
;*********************************************************************
; Commands for Part 3
;*********************************************************************
::r12::
clipboard =
(
    app.onloaded = function (args) {
        document.getElementById("cmdOpen").addEventListener("click", app.open_file);
    }
)
send ^v
return
::r13::
clipboard =
(
    app.open_file = function (args) {
        var file = Windows.Storage.KnownFolders.documentsLibrary.getFileAsync("hello.html")
        var text = Windows.Storage.FileIO.readTextAsync(file);
    }
)
send ^v
return
::r14::
clipboard =
(
    app.open_file = function (args) {
        var openPicker = new Windows.Storage.Pickers.FileOpenPicker();
        openPicker.viewMode = Windows.Storage.Pickers.PickerViewMode.list;
        openPicker.suggestedStartLocation = Windows.Storage.Pickers.PickerLocationId.documentsLibrary;
        openPicker.fileTypeFilter.replaceAll([".htm"]);

        openPicker.pickSingleFileAsync().done(function (file) {
            Windows.Storage.FileIO.readTextAsync(file).done(function (html) {
                var clean_html = window.toStaticHTML(html);
                app.editor.setValue(clean_html);
            });
        });
    };
)
send ^v
return
::r15::
clipboard =
(
        <button id="cmdSave" data-win-control="WinJS.UI.AppBarCommand" data-win-options="{icon:'save', label:'Save', section:'global', tooltip:'Save', type:'button'}"></button>
)
send ^v
return
::r16::
clipboard =
(
        document.getElementById("cmdSave").addEventListener("click", app.save_file);
)
send ^v
return
::r17::
clipboard =
(
    app.save_file = function (args) {
        var text = app.editor.getValue();
        var savePicker = new Windows.Storage.Pickers.FileSavePicker();
        savePicker.suggestedStartLocation = Windows.Storage.Pickers.PickerLocationId.documentsLibrary;
        savePicker.defaultFileExtension = ".htm";
        savePicker.suggestedFileName = "my_html";
        savePicker.fileTypeChoices.insert("HTML", [".htm"]);

        savePicker.pickSaveFileAsync().done(function (file) {
            if (file) {
                Windows.Storage.FileIO.writeTextAsync(file, text);
            }
        });
    };
)
send ^v
return
::r18::
clipboard =
(
    app.open_file = function (args) {
        var openPicker = new Windows.Storage.Pickers.FileOpenPicker();
        openPicker.viewMode = Windows.Storage.Pickers.PickerViewMode.list;
        openPicker.suggestedStartLocation = Windows.Storage.Pickers.PickerLocationId.documentsLibrary;
        openPicker.fileTypeFilter.replaceAll([".htm"]);

        openPicker.pickSingleFileAsync().done(function (file) {
            // Squirrel away a token for future access
            app.file_token = Windows.Storage.AccessCache.StorageApplicationPermissions.futureAccessList.add(file);
            Windows.Storage.FileIO.readTextAsync(file).done(function (html) {
                var clean_html = window.toStaticHTML(html);
                app.editor.setValue(clean_html);
            });
        });
    };
)
send ^v
return
::r19::
clipboard =
(
    app.file_token = null;

    app.save_file = function (args) {
        var text = app.editor.getValue();
        if (app.file_token == null) {
            var savePicker = new Windows.Storage.Pickers.FileSavePicker();
            savePicker.suggestedStartLocation = Windows.Storage.Pickers.PickerLocationId.documentsLibrary;
            savePicker.defaultFileExtension = ".htm";
            savePicker.suggestedFileName = "my_html";
            savePicker.fileTypeChoices.insert("HTML", [".htm"]);

            savePicker.pickSaveFileAsync().done(function (file) {
                if (file) {
                    // Squirrel away a token for future access
                    app.file_token = Windows.Storage.AccessCache.StorageApplicationPermissions.futureAccessList.add(file);
                    Windows.Storage.FileIO.writeTextAsync(file, text);
                }
            });
        } else {
            Windows.Storage.AccessCache.StorageApplicationPermissions.futureAccessList.getFileAsync(app.file_token).done(function (file) {
                if (file) {
                    Windows.Storage.FileIO.writeTextAsync(file, text);
                }
            });
        }
    };
)
send ^v
return
