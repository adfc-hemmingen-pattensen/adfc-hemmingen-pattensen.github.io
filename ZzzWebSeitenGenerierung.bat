
SET portpath=C:\DataProg\PortProg
IF %computername%==JENSDELL SET portpath=C:\DataProg\PortProg
SET PATH=%portpath%\pandoc213\;%PATH%
Set PATH=%portpath%\UnxUtil\usr\local\wbin\;%Path%

rem replace mermaid mit PanDoc Mermais
rem ==================================
sed "s/mermaid/\{.mermaid format=png width=1200 loc=mermaidimg}/" ZzzWebSeitenGenerierung.md >ZzzWebSeitenGenerierung.tmp


pandoc.exe ZzzWebSeitenGenerierung.tmp -o ZzzWebSeitenGenerierung.html -t html5 -s -F mermaid-filter.cmd -c github-pandoc-breit.css
start ZzzWebSeitenGenerierung.html
