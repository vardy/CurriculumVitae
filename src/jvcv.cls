\ProvidesClass{jvcv}[2019/03/24 CV Class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

% General shades
\definecolor{white}{RGB}{255,255,255}
\definecolor{grey}{HTML}{4D4D4D}
\definecolor{lightgrey}{HTML}{999999}
\definecolor{darkgrey}{HTML}{333333}

% Special colours
\definecolor{header_light_blue}{HTML}{346076}
\definecolor{header_dark_blue}{HTML}{0E2F44}
\definecolor{brand_orange}{HTML}{FF8001}

% Colourful colours
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

% Defining element colours
\ifdefined\@cv@print
  \colorlet{green}{grey}
  \colorlet{orange}{grey}
  \colorlet{purple}{grey}
  \colorlet{red}{grey}
  \colorlet{blue}{grey}
  \colorlet{fillheader}{white}
  \colorlet{header}{grey}
\else
  \colorlet{fillheader}{brand_orange}
  \colorlet{header}{white}
\fi

\colorlet{textcolor}{grey}
\colorlet{lightheadercolor}{header_light_blue}
\colorlet{headercolor}{header_dark_blue}
\colorlet{boldcolor}{grey}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX]{unicode-math}

\newfontfamily\bodyfont
[
Path=fonts/,
BoldFont=texgyreheros-bold.otf,
ItalicFont=texgyreheros-italic.otf,
BoldItalicFont=texgyreheros-bolditalic.otf]
{texgyreheros-regular.otf}
\newfontfamily\thinfont[Path=fonts/]{Lato-Light.ttf}
\newfontfamily\headingfont[Path=fonts/]{texgyreheros-bold.otf}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont
[
Path=fonts/,
Mapping=tex-text, Color=textcolor,
BoldFont=texgyreheros-bold.otf,
ItalicFont=texgyreheros-italic.otf,
BoldItalicFont=texgyreheros-bolditalic.otf
]
{texgyreheros-regular.otf}

\setmathfont[Path=fonts/]{texgyreheros-regular.otf}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}% Dictates main header font size.
      {\thinfont #1}{\bodyfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{10pt}{19pt}\color{header}% Dictates sub-heading font size.
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%

\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        blue\or%
        red\or%
        orange\or%
        green\or%
        purple\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}%
  {%
  \large\headingfont\color{headercolor} #1%
  }
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%%%%%%
% Jobs List environment %
%%%%%%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{jobslist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{boldcolor}}
\newcommand{\jobentry}[4]{%
  #1&\parbox[t]{10.2cm}{% Value dictates experience listing main paragraph width.
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgrey} #3}\\%
    #4\vspace{\parsep}%
  }\\}
  
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Projects List environment %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
\setlength{\tabcolsep}{0pt}
\newenvironment{projectslist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{boldcolor}}
\newcommand{\projectentry}[4]{%
  #1&\parbox[t]{11.8cm}{% Value dictates experience listing main paragraph width.
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgrey} #3}\\%
    #4\vspace{\parsep}%
  }\\}
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Education List environment %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{edulist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{boldcolor}}
\newcommand{\eduentry}[4]{%
  #1&\parbox[t]{10.2cm}{% Value dictates experience listing main paragraph width.
    \textbf{#2}%
    \hfill\vspace{0.1cm}%
    {\footnotesize\addfontfeature{Color=lightgrey} #3}\\%
    #4\vspace{\parsep}%
  }\\}


%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1.2cm} % Dictates distance of side-block from margin.
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{lightheadercolor} ##1}
  }
  \begin{textblock}{3.6}(1.5, 4.33)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.85cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry} % Margin for main page content defined here.
\RequirePackage{hyperref}