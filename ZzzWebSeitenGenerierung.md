# SW-Programme und Ablauf der Web-Seiten Generierung
Outdated - 2020-05- JSp

Übersicht

~~~mermaid
graph TB

subgraph HackMD
  Termin>Terminübersicht<br>mit Mermaid Graphik]
  Berichte>Berichte]
end

subgraph uMap
  Map>Mangelkarte]
end

subgraph FiiNote
  FiiNote>Mängel]
end

subgraph github
  Repository(Github Ablage <br> alle Versionen)
  WebServer(Github Web)
  Repository ==automatisch==> WebServer
end


subgraph MeinPC
  subgraph Dokumente
    Seiten>Markdown]
    HTML>statische HTML Seiten]
    Bilder>Bilder]

    Termin --Kopie--> Seiten
    Berichte --Kopie--> Seiten
    Map --eingebunden--> HTML
    FiiNote --verlinkt--> Map

  end

  subgraph Tools
    Browser1(z.B. Firefox mit <br>GitLabMarkdown Viewer)
    Editor(Text Editor, z.B. Atom <br>mit Markdown Preview)
    Pandoc(Pandoc Markdown2HTML<br> mit Mermaid-Filter)
    Browser2(Browser)
    Git(Versionsverwaltung Git)
    Editor --> Seiten
    Seiten -.-> Browser1
    Seiten ==> Pandoc
    Pandoc ==> HTML
    Bilder --Commit--> Git
    HTML --> Browser2
    Seiten --Commit--> Git
    Git ==Push==>Repository
    HTML ==Commit==> Git
    WebServer ==> Browser2
  end
end

style Seiten fill:#8f8,stroke:#080,stroke-width:5px
style HTML fill:#88f,stroke:#0f0,stroke-dasharray: 5, 5
style Bilder fill:#c88,stroke:#0f0,stroke-dasharray: 5, 5
style WebServer fill:#f44

Repository -.-> Seiten
~~~

## Web-Seiten Generierung für https://adfc-hemmingen-pattensen.github.io/

Der Dreh- und Angelpunkt sind unformatierte Textseiten die im der [Markdown](https://daringfireball.net/projects/markdown/) Sprache geschrieben sind. Präziser im Dialekt *["GitLab Flavored Markdown" (GFM)](https://docs.gitlab.com/ee/user/markdown.html)*.

Ein Markdown Beipiel:
```
#Markdown Überschrift
Der *schräge* Fuchs springt über den **fetten** Hund.
> Das ist kein Zitat

Eine Liste
* Punkt A
* Punkt B
* ![Ein Bild](https://www.adfc.de/static/images/logo_adfc.gif)

--------------------------------------------------------------
```
sieht dann später so aus:

### Markdown Überschrift

Der *schräge* Fuchs springt über den **fetten** Hund.

> Das ist kein Zitat

Eine Liste

* Punkt A
* Punkt B
* ![Ein Bild](https://adfc-hannover.de/wp-content/themes/scivi-wp-adfc2010-26b06da/gfx/logo_adfc.gif)

----

Diese Seiten mit der Dateiendung **.md** werden mit dem Software Programm [PanDoc](https://pandoc.org/) in HTML Seiten konvertiert. Dieses geschieht auf der Kommando Zeile mit dem Befehl

    pandoc seite.md -o seite.html #-o steht für Output

Zusammen mit den gespeicherten Bildern wird das ganze Verzeichnis mit dem Software Programm [Git](https://git-scm.com/) zuerst auf dem PC in eine Versionsablage kopiert (commit) und anschließend auf den [Github Server](https://github.com/adfc-hemmingen-pattensen/adfc-hemmingen-pattensen.github.io) geschoben (push). Hier befindet sich also eine komplette Kopie aller Versionen.

Der Github Server stellt anschließend die HTML und Bilder Dateien auf seinen [Webserver](https://adfc-hemmingen-pattensen.github.io/) unter der URL [https://adfc-hemmingen-pattensen.github.io/](https://adfc-hemmingen-pattensen.github.io/) als Webseiten öffentlich zur Verfügung.

### Nicht ohne Netz und doppelten Boden.
Das gute daran, die Dateien von dem [Github Server](https://github.com/adfc-hemmingen-pattensen/adfc-hemmingen-pattensen.github.io) kann jeder "klonen", er hat dann die gleichen Dateien auf seinen Rechner. Er kann auch Änderungen wieder "pushen", aber nur der Besitzer des Passwortes 😁 kann die Änderungen für die Öffentlichkeit freigeben. Oder anders gesagt, auch ich kann die Dateien, im Notfall, wieder bekommen.

### Extras

#### Mängelkarte
Für unsere [Mängelkarte](https://adfc-hemmingen-pattensen.github.io/MaengelHemPat.html) benutze ich den [umap](https://umap.openstreetmap.fr/de/) Service. Die Karten werden direkt mithilfe des Browser auf den [umap](https://umap.openstreetmap.fr/de/) Server erstellt und bleiben dort liegen. Mithilfe des HTML *iFrame* Befehls wird [unsere umap](http://umap.openstreetmap.fr/de/map/untitled-map_84202?scaleControl=false&miniMap=false&scrollWheelZoom=false&zoomControl=true&allowEdit=false&moreControl=true&datalayersControl=true&onLoadPanel=undefined&captionBar=false#12/52.25/9.77) WebSeite im Browser des Betrachter eingebunden.

Die Mängelbeschreibungen selbst sind teilweise mit dem [FiiNote Service](https://www.fiinote.com/#/) erstellt worden. Fiinote ermöglicht es Notizen mit Bildern und Zeichnungen zu erstellen und diese dann als Web-Seite zu veröffentlichen. Dieses geht einfach, sieht nicht besonders hübsch aus und die URLs sind sehr kryptisch. FiiNote selber gibt es als Android, Windows und HTML5 Editor.

#### Terminübersicht und Tourenbeschreibungen
Für die [Terminübersicht](https://hackmd.io/U-6kWHTpRAyp9glY_QNyKg?both#) und [Tourenbeschreibungen](https://hackmd.io/7JqXva29Si2VjOouL6VJxQ?both#) benutzen wir den [HackMD](https://hackmd.io/) Service. Dieses ist ein Online Markdown Editor mit einem eingebauten Markdown Betrachter (Pre-view). Jeder der die Links besitzt kann die Seiten ändern und erweitern. Die Inhalte dieser Seiten kopiere ich bei Bedarf manuell in unsere Markdown Seiten.

> An eine teilweise automatische Einbindung von Inhalten, wie z.B. Toureneinladungen, ähnlich wie bei [umap](https://umap.openstreetmap.fr/de/) wird noch gearbeitet. (Stand 2018-04-20-Fri)

##### Grafiken
Sowohl [HackMD](https://hackmd.io/) als auch [PanDoc](https://pandoc.org/), zusammen mit einem  [mermaid-filter](https://github.com/raghur/mermaid-filter), unterstützen die Grafiksprache [mermaid](https://mermaidjs.github.io/). Ähnlich wie bei der Markdown Sprache besteht auch hier die Beschreibung und Formatierung rein aus unformatierten Texten.

Aus:

    ```mermaid
    graph LR;
        A-->B;
        A-->C;
        B-->D;
    ```
wird:

```{.mermaid format=svg loc=mermaidimg width=400}
graph LR;
    A -->B
    A -->C;
    B -.->D;
    D ==> A
```

### Werkzeuge
[Markdown](https://daringfireball.net/projects/markdown/) lässt sich mit jedem Text Editor schreiben. Aber ähnlich wie bei [HackMD](https://hackmd.io/), ist der [Atom](https://atom.io/) Editor, mit den Zusatzpaketen [markdown-preview-enhanced](https://atom.io/packages/markdown-preview-enhanced) und [atom-mermaid](https://atom.io/packages/atom-mermaid) der Editor meiner Wahl.

Für das schnelle Prüfen den `nackten` Markdown Seiten gibt es das [Firefox](https://www.mozilla.org/en-US/firefox/new/) Add-on  [GitLab Markdown Viewer](https://github.com/painyeph/GitLabMarkdownViewer). Dann kann man sich \*.md  Dateien direkt im Browser ansehen.

-----
