function Prompt {
  $currentTime = Get-Date -Format "HH:mm:ss"
  $cleanUserProfile = ($env:USERPROFILE).Replace('\', '\\')
  $currentDirectory = $($(Get-Location) -replace $cleanUserProfile, "~")
  $currentBranch = git rev-parse --abbrev-ref HEAD

  Write-Host ""
  Write-Host "[" -NoNewline -ForegroundColor DarkGray
  Write-Host "$currentTime" -NoNewline -ForegroundColor Yellow
  Write-Host "]~[" -NoNewline -ForegroundColor DarkGray
  Write-Host $currentDirectory -NoNewline -ForegroundColor Cyan

  if ($null -ne $currentBranch) {
    Write-Host "]~[" -NoNewline -ForegroundColor DarkGray
    Write-Host $currentBranch -NoNewline -ForegroundColor Magenta
  }

  Write-Host "]" -ForegroundColor DarkGray

  return "> "
}

Clear-Host
# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
. C:\Users\hgebk\AppData\Local\sf\autocomplete\functions\powershell\sf.ps1
