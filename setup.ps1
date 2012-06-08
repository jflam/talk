# This is a set of Powershell commands that I will use for this demo
# jflam@microsoft.com

$demo_path = "c:\demo"
if (-not (Test-Path $demo_path)) {
  mkdir c:\demo
}

set github_talk=pwd
set talk=c:\demo
