{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}


module Template.Thesis where

import Text.RawString.QQ
import qualified Data.Text as T

templateLatex = [r|
%%%% Template Thesis
\PassOptionsToPackage{unicode=true}{hyperref}
\PassOptionsToPackage{hyphens}{url}
$if(colorlinks)$
  \PassOptionsToPackage{dvipsnames,svgnames*,x11names*}{xcolor}
$endif$
\documentclass[oneside,$if(fontsize)$$fontsize$,$endif$$if(lang)$$babel-lang$,$endif$$if(papersize)$$papersize$paper,$endif$$if(beamer)$ignorenonframetext,$if(handout)$handout,$endif$$if(aspectratio)$aspectratio=$aspectratio$,$endif$$endif$$for(classoption)$$classoption$$sep$,$endfor$]{Thesis}
$if(beamer)$
  \setbeamertemplate{caption}[numbered]
  \setbeamertemplate{caption label separator}{: }
  \setbeamercolor{caption name}{fg=normal text.fg}
  \beamertemplatenavigationsymbols$if(navigation)$$navigation$$else$empty$endif$
$endif$
$if(beamerarticle)$
  \usepackage{beamerarticle}
$endif$
$if(fontfamily)$
  \usepackage[$for(fontfamilyoptions)$$fontfamilyoptions$$sep$,$endfor$]{$fontfamily$}
$else$
  \usepackage{lmodern}
$endif$
\hypersetup{
  $if(title-meta)$
              pdftitle={$title-meta$},
  $endif$
  $if(author-meta)$
              pdfauthor={$author-meta$},
  $endif$
  $if(keywords)$
              pdfkeywords={$for(keywords)$$keywords$$sep$, $endfor$},
  $endif$
  $if(colorlinks)$
              colorlinks=true,
              linkcolor=$if(linkcolor)$$linkcolor$$else$Maroon$endif$,
              citecolor=$if(citecolor)$$citecolor$$else$Blue$endif$,
              urlcolor=$if(urlcolor)$$urlcolor$$else$Blue$endif$,
  $else$
              pdfborder={0 0 0},
  $endif$
            breaklinks=true}
          \urlstyle{same}
$if(verbatim-in-note)$
  \VerbatimFootnotes
$endif$
$if(geometry)$
  \usepackage[$for(geometry)$$geometry$$sep$,$endfor$]{geometry}
$endif$
$if(beamer)$
  \newif\ifbibliography
$endif$
$if(listings)$
  \usepackage{listings}
  \newcommand{\passthrough}[1]{#1}
$endif$
$if(lhs)$
  \lstnewenvironment{code}{\lstset{language=Haskell,basicstyle=\small\ttfamily}}{}
$endif$
$if(highlighting-macros)$
  $highlighting-macros$
$endif$
$if(tables)$
  \usepackage{longtable,booktabs}
  $if(beamer)$
    \usepackage{caption}

    \makeatletter
    \def\fnum@table{\tablename~\thetable}
    \makeatother
  $else$

    \IfFileExists{footnote.sty}{\usepackage{footnote}\makesavenoteenv{longtable}}{}
  $endif$
$endif$
$if(graphics)$
  \usepackage{graphicx,grffile}
  \makeatletter
  \def\maxwidth{\ifdim\Gin@nat@width>\linewidth\linewidth\else\Gin@nat@width\fi}
  \def\maxheight{\ifdim\Gin@nat@height>\textheight\textheight\else\Gin@nat@height\fi}
  \makeatother



  \setkeys{Gin}{width=\maxwidth,height=\maxheight,keepaspectratio}
$endif$
$if(beamer)$

  \widowpenalties 1 10000
  \raggedbottom
  $if(section-titles)$
  \setbeamertemplate{part page}{
    \centering
  \begin{beamercolorbox}[sep=16pt,center]{part title}
    \usebeamerfont{part title}\insertpart\par
  \end{beamercolorbox}
  }
  \setbeamertemplate{section page}{
    \centering
  \begin{beamercolorbox}[sep=12pt,center]{part title}
    \usebeamerfont{section title}\insertsection\par
  \end{beamercolorbox}
  }
  \setbeamertemplate{subsection page}{
    \centering
  \begin{beamercolorbox}[sep=8pt,center]{part title}
    \usebeamerfont{subsection title}\insertsubsection\par
  \end{beamercolorbox}
  }
  \AtBeginPart{
    \frame{\partpage}
  }
  \AtBeginSection{
    \ifbibliography
    \else
      \frame{\sectionpage}
    \fi
  }
  \AtBeginSubsection{
    \frame{\subsectionpage}
  }
  $endif$
$endif$
$if(links-as-notes)$

  \DeclareRobustCommand{\href}[2]{#2\footnote{\url{#1}}}
$endif$
$if(strikeout)$
  \usepackage[normalem]{ulem}

  \pdfstringdefDisableCommands{\renewcommand{\sout}{}}
$endif$


\makeatletter
\def\fps@figure{htbp}
\makeatother

$for(header-includes)$
  $header-includes$
$endfor$
$if(natbib)$
  \usepackage[$natbiboptions$,sort&compress]{natbib}
$endif$
$if(biblatex)$
  \usepackage[$if(biblio-style)$style=$biblio-style$,$endif$$for(biblatexoptions)$$biblatexoptions$$sep$,$endfor$]{biblatex}
  $for(bibliography)$
    \addbibresource{$bibliography$}
  $endfor$
$endif$

$if(title)$
  \title{$title$$if(thanks)$\thanks{$thanks$}$endif$}
$endif$

$if(subtitle)$
  \providecommand{\subtitle}[1]{}
  \subtitle{$subtitle$}
$endif$

$if(author)$
  \author{$for(author)$$author$$sep$ \and $endfor$}
$endif$
$if(institute)$
  \providecommand{\institute}[1]{}
  \institute{$for(institute)$$institute$$sep$ \and $endfor$}
$endif$
\date{$date$}
$if(beamer)$
  $if(titlegraphic)$
    \titlegraphic{\includegraphics{$titlegraphic$}}
  $endif$
  $if(logo)$
    \logo{\includegraphics{$logo$}}
  $endif$
$endif$



\thesistitle{$title$}
\authors{$author$}
\thesistitlejapanese{$titlejap$}
\authorsid{$authoridnum$}
\degree{$degree$}
\title{\ttitle}

\usepackage{subfig}
\usepackage{multirow}
\usepackage{CJK}
\usepackage[utf8]{inputenc}

\usepackage[pscoord]{eso-pic}% The zero point of the coordinate systemis the lower left corner of the page (the default).

\newcommand{\placetextbox}[3]{% \placetextbox{<horizontal pos>}{<vertical pos>}{<stuff>}
  \AddToShipoutPictureFG*{% Add <stuff> to current page foreground
    \put(\LenToUnit{#1\paperwidth},\LenToUnit{#2\paperheight}){\vtop{{\null}
      \parbox{\textwidth}{\centering #3}}}%
  }%
}%

\newcommand{note}[1]{#1}

\begin{document}
$for(include-before)$
  $include-before$
$endfor$


$if(title)$
  $if(beamer)$

  $else$

\frontmatter

\setstretch{1.3}

\fancyhead{}
\rhead{\thepage}
\lhead{}

\pagestyle{fancy}

\newcommand{\HRule}{\rule{\linewidth}{0.5mm}}







\begin{titlepage}
\begin{center}

\textsc{\Large $thesistype$}\\[6.2cm]

  \placetextbox{0.3}{0.775}{
    {\LARGE \bfseries $title$}\\[0.4cm]
    {\LARGE \bfseries $titlejap$}\\[0.4cm]
    {\large \textit{A thesis submitted in fulfilment of the requirements}\\
    \textit{for the degree of \degreename}}
  }

\begin{minipage}{0.4\textwidth}
\begin{flushleft} \large
\emph{Author:}\\
\href{mailto:$authormail$}{\authornames}\\
\authoridnums
\end{flushleft}
\end{minipage}
\begin{minipage}{0.4\textwidth}
\begin{flushright} \large
\emph{Supervisor:} \\
\href{mailto:$supervisormail$}{\supname}\\
 \ \
\end{flushright}
\end{minipage}\\[5cm]

  \includegraphics[width=.45\textwidth]{logo}\\[1cm]

\facname\\\deptname\\\univname\\[1cm]

{\large \today}\\

\vfill
\end{center}

\end{titlepage}

  $endif$

\pagestyle{empty}

\null\vfill

  $if(auto-quote)$
    $auto-quote$
\vfill\vfill\vfill\vfill\vfill\vfill\null
\clearpage
  $endif$

  $if(abstract)$
\addtotoc{Abstract}

\abstract{\addtocontents{toc}{\vspace{1em}}
      $abstract$
}

\clearpage
  $endif$
$endif$

$if(auto-acknowledgements)$
\setstretch{1.3}

\acknowledgements{\addtocontents{toc}{\vspace{1em}}
$auto-acknowledgements$
}
\clearpage
$endif$

\pagestyle{fancy}
$if(toc)$
\lhead{\emph{Contents}}
\tableofcontents
$endif$

$if(lof)$
\lhead{\emph{List of Figures}}
  \listoffigures
$endif$
$if(lot)$
\lhead{\emph{List of Tables}}
  \listoftables
$endif$

$if(dedicatory)$
\setstretch{1.3}

\pagestyle{empty}

\dedicatory{$dedicatory$}

\addtocontents{toc}{\vspace{2em}}
$endif$

\mainmatter

\fancyhf{}
\fancyhead[LO]{\leftmark}
\fancyhead[RE]{\rightmark}
\fancyhead[LE,RO]{\thepage}
\pagestyle{fancy}

$body$
\addtocontents{toc}{\vspace{2em}}

$if(auto-appendix)$
\appendix
  $auto-appendix$
\addtocontents{toc}{\vspace{2em}}
$endif$

\backmatter

\label{Bibliography}

\lhead{\emph{Bibliography}}

$if(natbib)$
  \bibliographystyle{$if(biblio-style)$$biblio-style$$else$plainnat$endif$}
$endif$

\bibliography{$bibliography$}


$for(include-after)$
  $include-after$
$endfor$
\end{document}
  |]

templateYaml :: T.Text
templateYaml = [r|
---
documentclass: book
fontsize: 11pt
colorlinks: true
lang: en-UK
polyglossia-lang:
  name: english
  options: variant=uk
natbib: true
toc: true
lot: true
lof: true
natbiboptions: |
            square,
            numbers,
            comma
bibliography: draft.bib
biblio-style: unsrtnat
biblio-title: Reference
papersize: a4
header-includes: |
  \usepackage{appendix}
  \usepackage{chemfig}
  \usepackage[version=4]{mhchem}
  \mhchemoptions{layout=stacked}
  \usepackage{longtable}
  \usepackage{siunitx}
  \usepackage{booktabs}
include-before: |
  \input{hasanHyp}
  \sisetup{table-format=-3.4}
---
  |]
