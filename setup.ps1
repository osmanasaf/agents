<#
.SYNOPSIS
    Setup script for AI Workflow Agents repository.
.DESCRIPTION
    Copies workflow templates to target project and optionally installs global rules.
.PARAMETER TargetProject
    Path to the target project where workflows will be installed.
.PARAMETER Template
    Template to use (e.g., 'java-ddd'). Default: 'java-ddd'
.PARAMETER InstallGlobal
    Install global GEMINI.md rules. Default: $true
.EXAMPLE
    .\setup.ps1 -TargetProject "C:\Projects\myapp" -Template "java-ddd"
#>

param(
    [Parameter(Mandatory = $true)]
    [string]$TargetProject,
    
    [Parameter(Mandatory = $false)]
    [string]$Template = "java-ddd",
    
    [Parameter(Mandatory = $false)]
    [bool]$InstallGlobal = $true
)

$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  AI Workflow Agents Setup" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Validate target project exists
if (-not (Test-Path $TargetProject)) {
    Write-Host "[ERROR] Target project not found: $TargetProject" -ForegroundColor Red
    exit 1
}

# Validate template exists
$TemplatePath = Join-Path $ScriptDir "templates\$Template"
if (-not (Test-Path $TemplatePath)) {
    Write-Host "[ERROR] Template not found: $Template" -ForegroundColor Red
    Write-Host "Available templates:" -ForegroundColor Yellow
    Get-ChildItem "$ScriptDir\templates" -Directory | ForEach-Object { Write-Host "  - $($_.Name)" }
    exit 1
}

# Copy template files
Write-Host "[1/4] Copying workflow template '$Template'..." -ForegroundColor Green
$AgentDir = Join-Path $TargetProject ".agent"
if (Test-Path $AgentDir) {
    Write-Host "  [WARN] .agent directory already exists. Merging..." -ForegroundColor Yellow
}

Copy-Item -Path "$TemplatePath\.agent\*" -Destination $AgentDir -Recurse -Force
Write-Host "  [OK] Workflows copied to $AgentDir" -ForegroundColor Green

# Copy rules library
Write-Host "[2/4] Copying rules library..." -ForegroundColor Green
$RulesDir = Join-Path $TargetProject "rules"
Copy-Item -Path "$ScriptDir\rules" -Destination $TargetProject -Recurse -Force
Write-Host "  [OK] Rules library copied to $RulesDir" -ForegroundColor Green

# Install global rules
if ($InstallGlobal) {
    Write-Host "[3/4] Installing global rules..." -ForegroundColor Green
    
    $GeminiDir = Join-Path $env:USERPROFILE ".gemini"
    if (-not (Test-Path $GeminiDir)) {
        New-Item -ItemType Directory -Path $GeminiDir | Out-Null
    }
    
    $GlobalRulesSource = Join-Path $ScriptDir "global\GEMINI.md"
    $GlobalRulesTarget = Join-Path $GeminiDir "GEMINI.md"
    
    if (Test-Path $GlobalRulesTarget) {
        Write-Host "  [WARN] Global GEMINI.md exists. Creating backup..." -ForegroundColor Yellow
        Copy-Item $GlobalRulesTarget "$GlobalRulesTarget.backup"
    }
    
    Copy-Item $GlobalRulesSource $GlobalRulesTarget -Force
    Write-Host "  [OK] Global rules installed to $GlobalRulesTarget" -ForegroundColor Green
} else {
    Write-Host "[3/4] Skipping global rules installation" -ForegroundColor Yellow
}

# Create .cursorrules if needed
Write-Host "[4/4] Creating Cursor compatibility files..." -ForegroundColor Green
$CursorRulesSource = Join-Path $ScriptDir "global\.cursorrules"
$CursorRulesTarget = Join-Path $TargetProject ".cursorrules"
if (-not (Test-Path $CursorRulesTarget)) {
    Copy-Item $CursorRulesSource $CursorRulesTarget
    Write-Host "  [OK] .cursorrules created" -ForegroundColor Green
} else {
    Write-Host "  [SKIP] .cursorrules already exists" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Setup Complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Available workflows:" -ForegroundColor White
Write-Host "  /context-agent      - Collect project context"
Write-Host "  /requirement-agent  - Structure requirements"
Write-Host "  /rule-agent         - Aggregate rules"
Write-Host "  /planner-agent      - Create implementation plan"
Write-Host "  /task-generator     - Generate tasks"
Write-Host "  /validation-agent   - Validate artifacts"
Write-Host "  /review-agent       - Code review"
Write-Host "  /master-pipeline    - Run full pipeline"
Write-Host ""
Write-Host "Run '/master-pipeline' to start the full workflow!" -ForegroundColor Cyan
