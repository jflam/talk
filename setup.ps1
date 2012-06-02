# This is a set of Powershell commands that I will use for this demo
# jflam@microsoft.com

function demo {
  cd "c:\talk\demo"
}

function clean { 
  demo
  rm -recurse *
}

function part1 {
  demo
  md "1. html"
  cd "1. html"
  cp -recurse "c:\talk\solutions\1. html\css"
  cp -recurse "c:\talk\solutions\1. html\js"
  echo '' > default.html
}
 
function part2 {
  demo
  md "2. wwa"
  cd "2. wwa"
  cp -recurse "c:\talk\solutions\2. wwa\Editor2"
}

clean
part1
part2