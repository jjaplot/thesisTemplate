# LaTeX class for Miun Thesis

This is `miunthesis`, a modern class for writing a thesis at Mittuniversitetet. 

## Contributors

The class was built based on the template by Ola Leifler, ola.leifler@liu.se at Linköping University

## Package options

The following options are recognized by the miunthesis document class

- `phd` or `lic` - For doctoral and licentiate dissertations 
- `printerfriendly` - ensure chapters begin on recto pages
- `swedish` - use Swedish as the main language, English as the secondary language
- `english` - use English as the main language, Swedish as secondary

This class supports [memoir](https://www.ctan.org/pkg/memoir)

# Usage

### The main document is `master.tex`, here you will choose the class, tables, and add all of the required chapters and articles


The style file (`miunthesis.cls`) can be modified to change the style of the Thesis.

The file `settings.tex` contains a few settings regarding chapter style, it must at least include the lines

```
\usepackage{biblatex}
\addbibresource{<my bibliography file>}
```

All Figures should be in the directory `figures/`.
All references should be added to the `references.bib`

## `Abbreviations List`

If you want abbreviations, just enable the command '\makeglossaries' in master.tex, the abbreviations can be added to myAbbrev.tex and used with the gls{} command as shown in the example. 
```
    \item \gls{pzt}
    \item \gls{mppt}

```


## `How to add sections`

To add a section just create an individual Tex file with the name of the section and add it in the master.tex

```
\part{Introduction}
\include{intro}
\include{theory}
\include{method}
```

The TeX file can be formatted as follows:

```
\chapter{Conclusion}
\label{cha:conclusion}

\section{My Section}
\label{sec:My Section}
```

## `How to include articles`

### From PDF

 With the `\includearticle` command, you can include your articles in PDF format, they will be resized to the page size. The procedure is as follows

 ```
 \includearticle{<citekey>}{<name of the journal>}
 ```

 `<citekey>` is exactly the name of the PDF, articles should be in the root folder. To reference the article in the first part of your thesis you can use the `art:<citekey>`. 

### From a TeX file

 With the `\includearticletex` command you can include your articles with TeX. This will format the article with the same style as the first part of the Thesis. 

 ```
 \includearticletex{<citekey>}{<name of the journal>}
 ```

 Same as with `\includearticle`, specify the name of the TeX file in `<citekey>` and the name of the journal `<name of the journal>` so the copyright is assigned to it. All the articles you are adding must be in `references.bib` so they can be referenced properly. 

 EXAMPLE:

 ```
 # On master.tex 

 \includearticletex{scigenx}{Super Mega Watt Energy Harvester } 

 # On references.bib

 @article{scigenx, Author = {Javier Aranda},
 Title = {Super Article},
 Journal = {Super Mega Watt Energy Harvester },
 Year = {2020}}

 ```
Articles added with TeX files should be located in `\papers`





