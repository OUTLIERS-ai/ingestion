# Outliers Ingestion — installer (Windows / PowerShell)
#
#   .\install.ps1 "C:\Users\you\Documents\My Vault"
#
# Copies the six agents into the vault, creates the folders they expect, and drops in a
# starter operating manual if there is not one already. Safe to run twice: it never
# overwrites an existing _CLAUDE.md and never touches your notes.

param([Parameter(Mandatory = $true)][string]$VaultPath)

if (-not (Test-Path $VaultPath)) {
    Write-Host "That folder does not exist: $VaultPath" -ForegroundColor Red
    exit 1
}

$here = Split-Path -Parent $MyInvocation.MyCommand.Path

# 1. the agents
$agentDir = Join-Path $VaultPath ".claude\agents"
New-Item -ItemType Directory -Force -Path $agentDir | Out-Null
Copy-Item (Join-Path $here ".claude\agents\*.md") $agentDir -Force
Write-Host "Installed 6 agents to $agentDir" -ForegroundColor Green

# 2. the folders they expect
foreach ($f in @("Projects", "Areas", "People", "Meetings", "Resources", "Ideas", "Wiki", "Archive", "AI")) {
    $p = Join-Path $VaultPath $f
    if (-not (Test-Path $p)) {
        New-Item -ItemType Directory -Force -Path $p | Out-Null
        Write-Host "  created $f\"
    }
}

# 3. the operating manual, only if absent
$manual = Join-Path $VaultPath "_CLAUDE.md"
if (Test-Path $manual) {
    Write-Host "_CLAUDE.md already exists, left untouched" -ForegroundColor Yellow
} else {
    Copy-Item (Join-Path $here "_CLAUDE.md") $manual
    Write-Host "Added a starter _CLAUDE.md — edit it, it is yours" -ForegroundColor Green
}

Write-Host ""
Write-Host "Done. Open Claude Code in your vault and try:" -ForegroundColor Cyan
Write-Host '  run the-connector - who have I not spoken to?'
