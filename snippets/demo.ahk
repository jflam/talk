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
md ${env:talk}
cd ${env:talk}
rd -Force -Recurse css
rd -Force -Recurse js
$null | Set-Content default.html
ls
)
;*********************************************************************
; Commands for HTML editors
;*********************************************************************
#IfWinActive
::cat1::
(
<h1>Hello, World!</h1>

<img src="http://www.hotimg.com/direct/dATedwu.gif">
<img src="http://www.hotimg.com/direct/dATedwu.gif">
<img src="http://www.hotimg.com/direct/dATedwu.gif">
<img src="http://www.hotimg.com/direct/dATedwu.gif">
)
::r1::
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
::r2::
(
  <head>
    <style>
      body { font-family: "Segoe UI"; font-size: 18px; background-color: black; color: white; }
      #editor { height: 90vh; width: 50vw; border: 0px; position: absolute; background-color: black; color: white; font-size: 18px; }
      #output { left: 50vw; width: 50vw; top: 0px; position: absolute; margin-left: 20px; }
    </style>
  </head>
)
::r3::
(
    <!-- CodeMirror JS References -->
    <script src="js/codemirror.js"></script>
    <script src="js/htmlmixed.js"></script>
    <script src="js/css.js"></script>
    <script src="js/xml.js"></script>
    <script src="js/javascript.js"></script>
    
)
::r4::
(
    <!-- CSS References -->
    <link rel="stylesheet" href="css/codemirror.css" />
    <link rel="stylesheet" href="css/lesser-dark.css" />
    
)
::r5::
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
          width: 50%;
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
::r6::
(
     <div id="editor"></div>
)
::r7::
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
::r8::
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
::r9::
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
          width: 50%;
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
::r10::
(
     <div id="editor"></div>
)
::r11::
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
