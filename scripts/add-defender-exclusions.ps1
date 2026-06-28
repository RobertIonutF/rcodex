#Requires -RunAsAdministrator
$ErrorActionPreference = 'Stop'

$paths = @(
    'D:\Programare\Personal\2026\06-June\Utility\rcodex\codex-rs\target',
    "$env:LOCALAPPDATA\codex-rs-target"
)

foreach ($path in $paths) {
    $existing = (Get-MpPreference).ExclusionPath
    if ($existing -contains $path) {
        Write-Host "Already excluded: $path"
    } else {
        Add-MpPreference -ExclusionPath $path
        Write-Host "Added exclusion: $path"
    }
}

Write-Host ""
Write-Host "Done. Defender exclusions are active."
