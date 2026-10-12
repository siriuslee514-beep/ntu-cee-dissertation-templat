[CmdletBinding()]
param([switch]$OpenPdf, [string]$TexBin = $env:TEXBIN)
$ErrorActionPreference = 'Stop'
if ($TexBin) {
    $taskXeLaTeX = Join-Path $TexBin 'xelatex.exe'
    $taskBiber = Join-Path $TexBin 'biber.exe'
} else {
    $taskXeLaTeX = (Get-Command xelatex -ErrorAction Stop).Source
    $taskBiber = (Get-Command biber -ErrorAction Stop).Source
}
Push-Location -LiteralPath $PSScriptRoot
try {
    & $taskXeLaTeX -synctex=1 -interaction=nonstopmode -halt-on-error -file-line-error main.tex
    if ($LASTEXITCODE -ne 0) { throw 'XeLaTeX pass 1 failed; see main.log.' }
    & $taskBiber main
    if ($LASTEXITCODE -ne 0) { throw 'Biber failed; see main.blg.' }
    foreach ($taskPass in 2,3) {
        & $taskXeLaTeX -synctex=1 -interaction=nonstopmode -halt-on-error -file-line-error main.tex
        if ($LASTEXITCODE -ne 0) { throw "XeLaTeX pass $taskPass failed; see main.log." }
    }
    Write-Host "Built: $(Join-Path $PSScriptRoot 'main.pdf')"
    if ($OpenPdf) { Invoke-Item -LiteralPath (Join-Path $PSScriptRoot 'main.pdf') }
}
finally { Pop-Location }

