%%% miunthesis.cls ---
%%
%% Filename: miunthesis.cls
%% Description:
%% Author: Javier Aranda
%% Maintainer:
%% Created: May 2020
%% Version: v1.0
%% Notes: Based on Ola Leifler's Linköping Thesis Template

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% This program is free software; you can redistribute it and/or
%% modify it under the terms of the GNU General Public License as
%% published by the Free Software Foundation; either version 3, or
%% (at your option) any later version.
%%
%% This program is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
%% General Public License for more details.
%%
%% You should have received a copy of the GNU General Public License
%% along with this program; see the file COPYING.  If not, write to
%% the Free Software Foundation, Inc., 51 Franklin Street, Fifth
%% Floor, Boston, MA 02110-1301, USA.

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%% Code:
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{miunthesis} [Thesis class for Miun]
\typeout{Such Thesis}
\def\createvariable#1{%
  \expandafter\def\csname #1\endcsname{\expandafter\gdef\csname @#1\endcsname}
  \csname #1\endcsname{\texttt{\textbackslash #1}}
}

% \def\createconditionalvariable#1{
%   \expandafter\newif\csname if#1\endcsname
%   \csname #1 false\endcsname
%   \def\csname#1\endcsname
% }

\RequirePackage{xkeyval}
\RequirePackage{ifxetex}




\ifxetex
\else
\RequirePackage[utf8]{inputenc}
\fi

\RequirePackage[absolute]{textpos}

% For conditionally including lists of tables and figures
\RequirePackage[figure,table]{totalcount}


\createvariable{edition}
\createvariable{presentationroom}
\createvariable{degreetypeSV}
\createvariable{presentationbuilding}
\createvariable{presentationcampus}
\createvariable{presentationdate}
\createvariable{presentationdateenglish}
\createvariable{presentationtime}
\createvariable{campus}


\createvariable{thesislanguage}
\createvariable{faculty}
\createvariable{issn}
\createvariable{degreeprefix}
\createvariable{degreesuffix}
\createvariable{exhibittext}
\createvariable{exhibittextswedish}
\createvariable{opponenttitle}
\createvariable{opponentname}
\createvariable{opponentuniversity}
\createvariable{opponentcountry}
\createvariable{thesisnumber}

\createvariable{subseries}
\createvariable{subseriesnumber}

\newif\ifsubseries
\subseriesfalse

\createvariable{currentyearthesisnumber}
\createvariable{supportedby}
\createvariable{publicationyear}
\createvariable{publicationmonth}
\createvariable{isbn}
\createvariable{supervisor}
\createvariable{cosupervisor}
\createvariable{examiner}
\createvariable{titleenglish}
\createvariable{titleswedish}
\createvariable{keywords}
\createvariable{keywordsswedish}
\createvariable{department}
\createvariable{departmentenglish}
\createvariable{degreetypeM}
\createvariable{departmentshort}
\createvariable{division}
\createvariable{divisionshort}
\createvariable{dateofpublication}
\createvariable{publicationseries}
% Undergrad specific
\createvariable{area}
\createvariable{level}
\createvariable{thesistypenameswedish}
\createvariable{thesistypenameenglish}
\createvariable{thesiscredits}
\createvariable{thesissubject}
\createvariable{thesissubjectenglish}

\newif\ifsubtitleswedish
\subtitleswedishfalse
\def\subtitleswedish#1{\subtitleswedishtrue\gdef\@subtitleswedish{#1}}

\newif\ifsubtitleenglish
\subtitleenglishfalse
\def\subtitleenglish#1{\subtitleenglishtrue\gdef\@subtitleenglish{#1}}

\newif\ifdedication
\dedicationfalse
\def\dedication#1{\dedicationtrue\gdef\@dedication{#1}}

\newif\ifexternalsupervisor
\externalsupervisorfalse
\def\externalsupervisor#1{\externalsupervisortrue\gdef\@externalsupervisor{#1}}

\newif\ifcosupervisor
\cosupervisorfalse
\def\cosupervisor#1{\cosupervisortrue\gdef\@cosupervisor{#1}}

\createvariable{divanumber}
% Include the abstract
\gdef\@abstract{\input{abstract.tex}}
\gdef\@sammanfattning{\input{sammanfattning.tex}}
\gdef\@acknowledgments{\input{acknowledgments.tex}}

\newif\ifmiun
\miuntrue

\newif\ifhu
\newif\iffilfak
\newif\ifphd
% \phdtrue
\newif\iflic
\licfalse
\newif\ifstudent
\studenttrue
\newif\ifprinterfriendly
\printerfriendlyfalse



\DeclareOption{miun}{%
  \miuntrue
  \hufalse
  \filfakfalse
  \faculty{Faculty of Science, Technology and Media}
  \publicationseries{}
  \degreeprefix{teknologie}
  \gdef\@facultyshort{STC}
  \gdef\@facultyshortlogo{miun}
  \gdef\@area{miun}
}

\DeclareOption{eks}{%
  \filfaktrue
  \miunfalse
  \hufalse
  \faculty{Another faculty}
  \gdef\@facultyshort{MT}
  \gdef\@facultyshortlogo{MT}
  \publicationseries{Materials}
  \degreeprefix{chemestry}
%  \gdef\@area{FFK-UP}
}


\DeclareOption{lic}{%
  \lictrue
  \phdfalse
  \studentfalse
}

\DeclareOption{phd}{%
  \licfalse
  \studentfalse
  \phdtrue
}

\DeclareOption{printerfriendly}{%
  \printerfriendlytrue
}

\DeclareOption{swedish}{%
  \thesislanguage{swedish}
}

\DeclareOption{english}{%
  \thesislanguage{english}
}

\newif\ifexhibitpage
\exhibitpagefalse

\DeclareOption{exhibitpage}{%
  \exhibitpagetrue
  \PassOptionsToClass{oneside}{memoir}
}

% % % Add the necessary biblatex options to the class options

% \DeclareOptionX{biblatexoptions}{%
%  \gdef\@biblatexoptions{#1}
% \PassOptionsToPackage{\@biblatexoptions}{biblatex}
% }

% \DeclareOptionX{memoiroptions}{%
% \PassOptionsToClass{#1}{memoir}
% }

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}

\ExecuteOptions{english,phd,miun,a4paper}

\ProcessOptions*

\iflic
\iffilfak
\publicationseries{Faculty of Science, Technology and Media}
\fi
\fi

\LoadClass{memoir}

\RequirePackage{color}
\RequirePackage[svgnames]{xcolor}
\RequirePackage{pdfpages}
\RequirePackage{tikz}
\RequirePackage{pbox}
\RequirePackage{ifthen}
\RequirePackage{geometry}
\RequirePackage[pdfusetitle]{hyperref}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{etoolbox}

% Set up input encoding and font handling
\ifxetex
\RequirePackage[MnSymbol]{mathspec}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Some versions of latex have issues with mathspec, see
% https://tex.stackexchange.com/questions/85696/what-causes-this-strange-interaction-between-glossaries-and-amsmath
\let\RequirePackage\original@RequirePackage
\let\usepackage\RequirePackage
% End workaround
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{siunitx}
\usepackage{booktabs} 
\usepackage{tocbibind}
\usepackage{hyperref}
\usepackage{multirow}
\usepackage{dirtytalk}
\RequirePackage{lipsum}
\RequirePackage{xltxtra}
\RequirePackage{babel}
\defaultfontfeatures{Mapping=tex-text}
\else
\RequirePackage{graphicx}
\RequirePackage{palatino}
\RequirePackage{mathabx}
\RequirePackage{mathpazo}
\RequirePackage[T1]{fontenc}
\fi


\ifphd
\gdef\@degreetype{\@degreeprefix {} doktorsexamen}
\gdef\@degreetypeenglish{Doctor of \@degreesuffix}
\else
\iflic
\gdef\@degreetype{\@degreeprefix {} licentiatexamen}
\gdef\@degreetypeenglish{Licentiate degree in \@degreesuffix}
\fi
\fi

\ifmiun
\iflic
\issn{1652-8948}
\fi
\ifphd
\issn{1652-893X}
\fi
\fi

% We use the same series for lic and PhD


\newcommand{\swedishenglish}[2]{
\ifthenelse{\equal{\@thesislanguage}{swedish}}{#1}{#2}
}
\RequirePackage{csquotes}
\ifxetex
\RequirePackage{polyglossia}
\swedishenglish{
  \setmainlanguage{swedish}
  \setotherlanguages{english}
}{
  \setmainlanguage{english}
  \setotherlanguages{swedish}
}
\else
\swedishenglish{
  \RequirePackage[swedish]{babel}
}{
  \RequirePackage[english]{babel}
}
\fi
%% Include articles
\RequirePackage{calc}
\RequirePackage{ragged2e}


\definecolor{nicered}{rgb}{0,0,0}
\newsavebox{\feline@article}
\newcommand\feline@article@marker[1][5cm]{%

\colorbox{nicered}{\fboxsep=1pt%
\parbox[t][1.0cm]{3.50cm}{
\addvspace{0.25cm} \centering 
\LARGE{
     \color{white}  \bfseries PAPER \thearticle\phantom{.}
} } }
}



\newcommand\feline@chm[1][4cm]{%
  \sbox\feline@article{\feline@article@marker[#1]}%
  \vspace{2cm}
  \makebox[0pt][l]{% aka \rlap
    \makebox[\spinemargin][r]{
      \usebox\feline@article
    }
  }
}


%%%%%%% Papers %%%%%%
%%%%
% custom page styles



\newcounter{article}
\setcounter{article}{0}
\renewcommand{\thearticle}{\Roman{article}}
\includepdfset{pages=-}
\setlength{\TPVertModule}{2cm}
\setlength{\TPHorizModule}{\paperwidth - 4.3cm}
\newcommand{\papermark}{Paper \thearticle}

%% dotted line for List of Papers


\newcommand{\includearticle}[3][pages=-]{%
  %%\@twosidetrue
  \refstepcounter{article}%
  \cleartorecto%
  \thispagestyle{empty}
  \mbox{}%
  \vspace*{\fill}
   \begin{center}%
     {\hfill \feline@chm[2.5cm]\\[2\baselineskip]}
     {\large{\bfseries{\citefield{#2}{title}}}} \\
     \vspace*{\fill}
     \copyright{} \footnotesize{\citeyear{#2}, #3}
  \end{center}%
  \vspace*{\fill}%
  \cleartorecto%
  \label{art:#2}%
  \cftaddtitleline{toc}{chapter}{\papermark}{}%
  \addcontentsline{toc}{section}{\texorpdfstring{ \indent \fullcite{#2} }{Lg} }%
  \includepdf[#1]{#2}%
}
\newenvironment{papers}{
  \makeevenhead{ruled}{\papermark}{}{}
  \renewcommand*{\thechapter}{\thearticle}
  \newlength{\numberheight}
 \makechapterstyle{paperstyle}{%
    \setlength{\afterchapskip}{4pt}
    \setlength{\numberheight}{1mm}
  \renewcommand*{\chapterheadstart}{\vspace*{4pt}}
    \renewcommand*{\afterchapternum}{\par\nobreak\vskip 2pt}
    \renewcommand*{\chapnamefont}{\normalfont\large\flushright}
    \renewcommand*{\chapnumfont}{\normalfont\large}
    \renewcommand*{\chaptitlefont}{\normalfont\Huge\bfseries\flushright}
    \renewcommand*{\printchaptername}{%
    }
    \renewcommand*{\chapternamenum}{}

    \renewcommand*{\printchapternum}{%
    }%
    \makeoddfoot{plain}{}{}{\thepage}}
    \renewcommand{\@chapapp}{\papermark}
    \chapterstyle{paperstyle}
}{}

\newcommand{\includearticletex}[2]{%
 \stepcounter{article}%
  %\cleartorecto%
  \cftaddtitleline{toc}{chapter}{\papermark}{}%
   \addcontentsline{toc}{section}{\texorpdfstring{ \indent \fullcite{#1} }{Lg} }%
  \thispagestyle{empty}
  \mbox{}%
  \vspace*{\fill}
   \begin{center}%
     {\hfill \feline@chm[1.7cm]\\[2\baselineskip]}
     {\large{\bfseries{\citefield{#1}{title}}}} \\
     \vspace*{\fill}
     \copyright{} \footnotesize{\citeyear{#1}, #2}
  \end{center}%
  \vspace*{\fill}%
  \clearpage{}
      \chapter*{}
  \label{art:#1}
  \pagestyle{empty}
 \input{papers/#1}%
}

\ifx\pdfoutput\undefined
\else
\pdfoutput=1
\DeclareGraphicsExtensions{.pdf,.jpg,.png}
\fi

\graphicspath{{figures/}}


%%%%%% Abbreviations %%%%%

\usepackage[nopostdot,toc,acronym,nomain,nonumberlist, noredefwarn]{glossaries}

\setacronymstyle{long-short}

\loadglsentries[acronym]{myAbbrev}


\newif\ifabbrev% Default is \glossaries
\let\oldabbrev\makeglossaries% Store \glossaries
\renewcommand{\makeglossaries}{% Update \glossaries
  \oldabbrev% Default \glossaries
  \abbrevtrue% Set switch to true
}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                    %
%               font selection, based on availability                %
%                                                                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                    %
%                     The exhibit page                               %
%                                                                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\exhibitpagemiun}{%


  }



\newcommand{\gettitle}{\swedishenglish{\@titleswedish}{\@titleenglish}}

\iflic
\newcommand{\isrn}{MIUN-\@facultyshort{}-Lic-{}-\@publicationyear:\@currentyearthesisnumber}
\fi

\ifstudent
\newcommand{\isrn}{MIUN-\@departmentshort{}/\@area{}-EX-\@level{}-{}-\@publicationyear/\@currentyearthesisnumber-{}-SE}
\fi

\newcommand\makeundergraduatetitle{%
  {\@calibri
      {\raggedleft%
      \sffamily%
      \swedishenglish{%
      \begin{large}%
        Mid Sweden University | \@department\par
        Examensarbete på \@thesistypenameswedish, \@thesiscredits hp | \@thesissubject\par%
        20\@publicationyear\ | \isrn\par%
      \end{large}%
      }{%
      \begin{large}%
        Mid Sweden University | \@departmentenglish\par
        \@thesistypenameenglish{} thesis, \@thesiscredits{} ECTS | \@thesissubject\par%
        20\@publicationyear\ | \isrn\par%
      \end{large}%
      }%
      }%
      \vspace*{50mm}%
      \swedishenglish{%
        \hspace*{36mm}%
      }{%
        \hspace*{38mm}%
      }%
      \newlength{\thesiswidth}%
      \swedishenglish{%
        \setlength{\thesiswidth}{\paperwidth-86mm}%
      }{%
        \setlength{\thesiswidth}{\paperwidth-88mm}%
      }%
      
\begin{minipage}[t]{\thesiswidth}
      {\fontsize{25pt}{30pt}\selectfont\swedishenglish{\@titleswedish}{\@titleenglish}\par}%
      \swedishenglish{\ifsubtitleswedish}{\ifsubtitleenglish} -- {\fontsize{13pt}{15pt}\selectfont\swedishenglish{\@subtitleswedish}{\@subtitleenglish}\par}\fi%
      \hrulefill{}
      \\{}
      {\@calibri{%
          \fontsize{13pt}{15pt}\selectfont%
          \textit{\swedishenglish{\@titleenglish}{\@titleswedish}}\par}%
        \swedishenglish{\ifsubtitleenglish}{\ifsubtitleswedish}--
        {\fontsize{13pt}{15pt}\textit{\selectfont\swedishenglish{\@subtitleenglish}{\@subtitleswedish}}\par}
      \fi}%
      \vspace*{10mm}%
      {\@calibri\fontsize{12pt}{13pt}\selectfont\textbf{\@author}\par
      }%
      \vspace*{10mm}%
      {\@calibri\fontsize{10pt}{11pt}\selectfont
        \parbox{\textwidth}{\swedishenglish{Handledare}{Supervisor}: \@supervisor\\
          \swedishenglish{Examinator}{Examiner}: \@examiner\\[2\baselineskip]
        \ifexternalsupervisor \swedishenglish{Extern
          handledare}{External supervisor}: \@externalsupervisor\fi}}%
 \end{minipage}
\vfill{}
\begin{textblock*}{\textwidth}(2cm,\paperheight-4cm)
  \swedishenglish{\gdef\@langlogo{sv}}{\gdef\@langlogo{en}}
  \parbox{0.4\textwidth}{\includegraphics[width=85mm]{liu_primary_black_\@langlogo}}%
  \hspace*{32mm}
  \parbox{0.5\textwidth}{\raggedleft%
    \vspace*{4mm}
    Mid Sweden universitet\\
    SE--581 83 Sundsvall\\
    \swedishenglish{}{}, \href{http://www.miun.se}{www.miun.se}}
\end{textblock*}
    }
  }

\newcommand{\makegraduatetitle}{

\begin{flushleft}
   

   \vspace*{2.77cm}
     {\LARGE\bfseries\gettitle}\\[20mm]
     {\Large\bfseries\@author}\\ [7 mm]
     {\fontsize{10pt}{11pt}\selectfont
        \parbox{\textwidth}{\swedishenglish{Handledare}{Main supervisor}: \@supervisor\\
        \ifcosupervisor \swedishenglish{Extern
          handledare}{Co-supervisor}: \@cosupervisor\fi}}%
     \vfill
     {\footnotesize
     \swedishenglish{%

     
     \@department \\
     Mittuniversitet\\
     }{
    \noindent    Faculty of Science, Technology and Media\\
       \@departmentenglish\\
       Thesis for the \@degreetypeM \\
       Mid Sweden University, SE-851 70 Sundsvall, Sweden\\
     }
    \vspace*{1mm}
    \noindent Sundsvall  \bfseries  \@publicationyear\\
   }
 \end{flushleft}  
}

\ifstudent
\renewcommand{\maketitle}{\makeundergraduatetitle}
\else
\renewcommand{\maketitle}{\makegraduatetitle}
\fi

\newcommand{\abstractpages}{%

\@abstract
}


\newcommand{\sammanfattningpages}{%

\@sammanfattning

}



\newcommand{\makepermissionpage}{

  \begin{flushleft}
    {
    Akademisk avhandling som med tillstånd av Mittuniversitetet i Sundsvall
    framläggs till offentlig för avläggande av \@degreetypeSV den
    \textbf{ \@presentationdate{} kl. \@presentationtime \hspace{0.2mm} i sal \@presentationroom,         Mittuniversitetet  \@campus.}  
    Seminariet kommer att hållas på engelska.}
  
  
  \vspace{8cm}
  
  {\Large\bfseries\gettitle}\\

  \vfill

    \copyright{} \@author, \@publicationyear\\
    Printed by Mid Sweden University, Sundsvall \@publicationyear \\
    ISBN \@isbn\\
    ISSN \@issn\\ \vspace{5mm}
    Faculty of Science, Technology and Media \\
    Mid Sweden University, SE-851 70 Sundsvall \\
    Phone: +46 (0)10 142 80 00 \\
    Mid Sweden University \ifphd Doctoral \else Licentiate \fi Thesis \@thesisnumber

    
  \end{flushleft}
  \clearpage}

% Intro page for MSC theses
\newcommand{\makeinsidepage}{

}


\newcommand{\makededicationpage}{
\mbox{}
\vfill
\begin{center}
\@dedication\\
\end{center}
\vfill
}


%%%%%%%%%%%%%%%%%%%%
%
% List of Papers
%
%
%%%%%%%%%%%%%%%%%%

\usepackage{kantlipsum}




%%%%%%%%%%%%%%%%%
%
% Page size and layout
%
%%%%%%%%%%%%%%%%%
\clubpenalty=10000
\widowpenalty=10000
\raggedbottom
\midsloppy

\newlength{\mylen}  % a length
\newcommand{\alphabet}{abcdefghijklmnopqrstuvwxyzåäö} % the lowercase
                                % alphabet
\begingroup
% keep font change local
% font specification e.g.,
% \Large\sffamily
\settowidth{\mylen}{\alphabet}
% The length of this alphabet is
% \the\mylen.
\typeout{The length of the alphabet is \the\mylen}
% put in log file
% end the grouping
\endgroup

% Tryckmaterialets storlek
\setstocksize{240mm}{165mm}
%
\ifstudent
\settrimmedsize{240mm}{165mm}{*}
\settypeblocksize{*}{34pc}{1.618} % golden ratio
\else
% Miun-specific definition of the S5 format
\settrimmedsize {240mm}{165mm}{*}
\settypeblocksize{*}{28pc}{1.618}
\fi

\newcommand{\resetlayout}{
  \setlength{\trimtop}{\stockheight} % \trimtop = \stockheight  - \paperheight
  \addtolength{\trimtop}{-\paperheight} %
  \setlength{\trimedge}{\stockwidth} % \trimedge = \stockwidth - \paperwidth
  \addtolength{\trimedge}{-\paperwidth} %
  % Beskär endast höger- och nederkanten på respektive papper
  % \settrims{0pt}{0pt}
  % Beskär runt om: Centrera tryckytan på pappret
  \settrims{0.5\trimtop}{0.5\trimedge}
  % Inner margin 2cm
  \ifprinterfriendly
  \renewcommand{\clearforchapter}{\cleartooddpage}
  \fi
  \ifstudent
  \setlrmargins{*}{*}{1}
  \else
  \setlrmargins{*}{*}{0.8}
  \fi
  % Övre marginal 2cm, den undre automatiskt beräknad
  \setulmargins{2cm}{*}{*}
}
%
% Common layout settings




%%%%% custom list of papers %%%%

\makeatletter

\renewcommand\appendixtocname{Papers}
\renewcommand\appendixpagename{Papers}
\g@addto@macro{\appendices}{%
  \appendix
  \appendixpage
  \write\@auxout{%
    \string\let\string\latex@tf@toc\string\tf@toc% Store the original `\tf@lof` file handle
    \string\let\string\tf@toc\string\tf@app% 
  }%
}


\g@addto@macro{\endappendices}{%
  \write\@auxout{%
    \string\let\string\tf@toc\string\latex@tf@toc% Rename the file handle
  }%
}

\newcommand{\appendicesname}{Papers}

\newcommand{\listofappendices}{\bgroup%
  \renewcommand\contentsname{List of Papers}
  \let\@startoc@temp\@starttoc%
  \def\@starttoc##1{\@startoc@temp{app}}%
  \clearpage
  \tableofcontents* \egroup
}

\makeatother
\makeindex

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





% Variables and page layout
\linespread{1.05}

\typeout{******** Miun thesis layout ********}
\typeoutlayout
\typeout{******** Standard memoir layout ********}
\typeoutstandardlayout

%% Load user settings from the file settings.tex

\AtBeginDocument{%
  \resetlayout
  \checkandfixthelayout

   










  
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% miunthesis.cls ends here
