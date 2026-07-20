# tvthesis — LaTeX class for theses at Università degli Studi di Roma Tor Vergata

- **Author:** Alessandro Pellegrini
- **License:** LaTeX Project Public License, version 1.3c or later
- **CTAN:** https://ctan.org/pkg/tvthesis
- **Repository:** https://github.com/alessandropellegrini/tvthesis

## Description

The `tvthesis` class provides a complete LaTeX template for typesetting
Master's and PhD theses at the Università degli Studi di Roma Tor Vergata.
It handles title-page layout, front matter, chapter formatting, and all the
stylistic requirements of the university.

For more information about the university, visit:
<https://web.uniroma2.it>

## Installation

To extract the class file from the documented source, run:

    latex tvthesis.ins

This will generate `tvthesis.cls`.

Move `tvthesis.cls` to a directory searched by TeX (e.g.,
`texmf-local/tex/latex/tvthesis/`) and update the filename database:

    mktexlsr

Alternatively, place `tvthesis.cls` in the same directory as your thesis
source files.

## Usage

Load the class in your document preamble:

```latex
% For a Master's thesis:
\documentclass[master]{tvthesis}

% For a PhD thesis:
\documentclass[phd]{tvthesis}
```

See the provided example files and the package documentation (`tvthesis.pdf`)
for a complete description of available options, commands, and environments.

## Building the Documentation

To build the full documentation from source:

    pdflatex tvthesis.dtx
    makeindex -s gind.ist -o tvthesis.ind tvthesis.idx
    pdflatex tvthesis.dtx
    pdflatex tvthesis.dtx

Or simply run `make doc` if you have GNU Make installed.

## License

Copyright (C) 2026 Alessandro Pellegrini

This work may be distributed and/or modified under the conditions of the
LaTeX Project Public License, either version 1.3c of this license or (at
your option) any later version.

The latest version of this license is in:

  http://www.latex-project.org/lppl.txt

and version 1.3c or later is part of all distributions of LaTeX version
2008-05-04 or later.
