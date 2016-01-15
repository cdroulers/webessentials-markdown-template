# webessentials-markdown-template
Example project to open with Web Essentials 2013 to compile Markdown to a full HTML page.

## How it works

The script `Generate-Documentation.ps1` takes your Markdown file and generates it with `CommonMark.NET`.

Then, it finds your `WE-Markdown.html` template and replaces the content with what you generated as well
as a few other important variables.

In this example project, the POST-BUILD event of the project containing the markdown calls the PowerShell
script.

Feel free to contribute!

# Links

This sample created for Stack Overflow question
[Can Web Essentials 2013 compile markdown to HTML with a template?](https://stackoverflow.com/questions/31704176/can-web-essentials-2013-compile-markdown-to-html-with-a-template)