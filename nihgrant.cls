\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nihgrant}[2021/0/14 addapted from https://github.com/aarmey/grant-template]

\PassOptionsToClass{11pt}{article}
\LoadClassWithOptions{article}

\RequirePackage{enumitem, wrapfig, array, adjustbox, color, setspace, textgreek, fancyhdr, microtype, multicol, caption, csquotes}

% Change bar for change marks
\RequirePackage[pdftex, leftbars, xcolor]{changebar}

% Provides line around figures so their spacing can be reduced
\RequirePackage[innerleftmargin=2pt, innerrightmargin=2pt, innertopmargin=2pt, innerbottommargin=2pt]{mdframed}

\RequirePackage{helvet}
\RequirePackage[T1]{fontenc}
\RequirePackage[labelfont=bf,justification=centering,font=small,skip=0pt]{caption}
\RequirePackage[compact]{titlesec}
\RequirePackage[acronym, style=index]{glossaries}

% Allows links to be included for references optionally
\RequirePackage[colorlinks=false, pdfborder={0 0 0}]{hyperref}

\RequirePackage[margin=0.5in,footskip=0.1cm,bottom=0.7in]{geometry}
\setcounter{secnumdepth}{0}
\renewcommand{\glossarysection}[2][]{}

\renewcommand\familydefault{\sfdefault} 

% Basic bibliography settings % old = numeric-comp
\RequirePackage[backend=biber,url=false,sortcites=true,sorting=none,style=nature,maxbibnames=99]{biblatex}
\setlength\bibitemsep{0pt}

% Changebar settings
\setlength{\changebarsep}{5pt}
\setlength{\changebarwidth}{1pt}
\cbcolor{black}

\pagestyle{empty}
\renewcommand{\headrulewidth}{0pt}

% Override cite command to get supercite
\renewcommand{\cite}{\supercite}

\setlength\tabcolsep{2pt}

%\setlength{\columnsep}{5pt}
\setlength{\columnsep}{0.5cm}

\newenvironment{Figure}
  {\par\medskip\noindent\minipage{\linewidth}\centering}
  {\endminipage\par\medskip}

\DeclareFieldFormat{eprint:pmcid}{%
  PMCID\addcolon\space
  \ifhyperref
    {\href{http://www.ncbi.nlm.nih.gov/pmc/articles/#1}{\nolinkurl{#1}}}
    {\nolinkurl{#1}}}
\DeclareFieldAlias{eprint:PMCID}{eprint:pmcid}
\DeclareFieldAlias{eprint:pmc}{eprint:pmcid}
