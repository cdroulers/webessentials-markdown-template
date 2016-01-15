PARAM(
    [string]
    [Parameter(Mandatory = $True)]
    $MarkdownPath,
    [string]
    $Title
)

$MarkdownPath = Resolve-Path $MarkdownPath;

if (-not $Title)
{
    $Title = $MarkdownPath;
}

# Adjust this to your solution. There might be a better way to find WE-Markdown.html
$solutionPath = Resolve-Path $PSScriptRoot;

# Same for packages path
$cmarkExe = (Get-ChildItem (Join-Path $solutionPath .\packages\**\cmark.exe) -Recurse)[0].FullName;
$out = $MarkdownPath.Replace(".md", ".html");

$compiled = & $cmarkExe $MarkdownPath | Out-String;

$template = Get-Content (Join-Path $solutionPath WE-Markdown.html) -Encoding UTF8 -Raw;

$result = $template -replace "{##TITLE##}", $Title `
    -replace "{##SOLUTION_PATH_PLACEHOLDER##}", $solutionPath `
    -replace "{##PROJECT_PATH_PLACEHOLDER##}", "" `
    -replace "{##DOCUMENT_PATH_PLACEHOLDER##}", $MarkdownPath `
    -replace "{##MARKDOWN_HTML_PLACEHOLDER##}", $compiled `
    -replace "language-C#", "csharp"; # Replace any other thing that is relevant to your project

Set-Content -Path $out -Value $result -Encoding UTF8;