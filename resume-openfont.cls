% Intro Options
\ProvidesClass{resume-openfont}[2014/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

% Package Imports
\usepackage[hmargin=1.25cm, vmargin=0.5cm]{geometry}
\usepackage[hidelinks]{hyperref}
\usepackage{tcolorbox}

% Publications
\usepackage{cite}
\renewcommand\refname{\vskip -1.5cm}

% Color definitions
%\usepackage[usenames,dvipsnames]{xcolor} 
%\definecolor{date}{HTML}{666666} 
\definecolor{primary}{HTML}{2b2b2b} 
\definecolor{headings}{HTML}{0092c3}
\definecolor{subheadings}{HTML}{004263}
\definecolor{subsubheadings}{HTML}{6A6A6A} % The color of the large sections

% Set main fonts
\usepackage{fontspec}
\setmainfont[Color=primary, Path = fonts/lato/,BoldItalicFont=Lato-RegIta,BoldFont=Lato-Reg,ItalicFont=Lato-LigIta]{Lato-Lig}
\setsansfont[Scale=MatchLowercase,Mapping=tex-text, Path = fonts/raleway/]{Raleway-ExtraLight}

% Date command
\usepackage[absolute]{textpos}
\usepackage[UKenglish]{isodate}
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}
\newcommand{\lastupdated}{\begin{textblock}{60}(155,295)
\color{date}\fontspec[Path = fonts/raleway/]{Raleway-ExtraLight}\fontsize{8pt}{10pt}\selectfont 
Last Updated on \today
\end{textblock}}



% Header
\newcommand{\namesection}[9]{ % Defines the command for the main heading
    \begin{minipage}[c]{.38\textwidth}
        \raggedright{% Center the name
            \color{subheadings}
            \fontsize{30pt}{60pt} % Font size
            \fontspec[Path = fonts/lato/]{Lato-Lig}\selectfont #1 % First name font
            \color{headings}
            \fontspec[Path = fonts/lato/]{Lato-Lig}\selectfont #2 % Last name font
            \\
            \color{subsubheadings}
            \fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{10pt}{10pt}\selectfont  #3
        }
    \end{minipage}
    \begin{minipage}[c][1.8cm]{.2\textwidth}
        \centering{ % Center the contact information
            \color{subsubheadings} % Use the headings color
            \fontspec[Path = fonts/raleway/]{Raleway-Medium}
            \fontsize{20}{16}\
            #4 % email
            \fontsize{20}{16}\
            #5 % linkedin
            \vspace{10 pt} \\
            \fontsize{20}{16}\
            #6 % scholar
            \fontsize{20}{16}\
            #7 % telegram
        }
    \end{minipage}
    \begin{minipage}[c][1.8cm]{.41\textwidth}
        \vspace{-3 pt}
        \fontspec[Path = fonts/raleway/]{Raleway-Medium}
        \fontsize{10}{10}
        \color{subsubheadings} Main languages: \color{subheadings}{#8}\\
        \color{subsubheadings} Frameworks: \color{subheadings}{#9}\\
        \color{subsubheadings} Familiar: \color{subheadings}{Golang, TS, JS, CSS, HTML}
    \end{minipage}
    \noindent\makebox[\linewidth]{\color{subsubheadings}\rule{\paperwidth}{0.5pt}} % Horizontal rule
    \vspace{-8pt} % Reduce whitespace after the rule slightly
}




% Section seperators 
\usepackage{titlesec}
\titlespacing{\section}{0pt}{0pt}{0pt} 
\titlespacing{\subsection}{0pt}{0pt}{0pt}
\newcommand{\sectionsep}{\vspace{8pt}}

% Headings command
\titleformat{\section}{\color{headings}
\scshape\fontspec[Path = fonts/lato/]{Lato-Lig}\fontsize{14pt}{24pt}\selectfont \raggedright\uppercase}{}{0em}{}

% Subeadings command
\titleformat{\subsection}{
\color{subheadings}\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{12pt}{12pt}\selectfont\bfseries}{}{0em}{}

\newcommand{\runsubsection}[1]{
\color{subheadings}\fontspec[Path = fonts/raleway/]{Raleway-Semibold}\fontsize{12pt}{12pt}\selectfont\bfseries {#1} \normalfont}

% Descriptors command
\newcommand{\descript}[1]{
\color{subheadings}\raggedright\scshape\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{12pt}{12pt}\selectfont {#1 \\} \normalfont}

% Location command
\newcommand{\location}[1]{
\color{headings}\raggedright\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{10pt}{12pt}\selectfont {#1\\} \normalfont}

% Location command
\newcommand{\interest}[1]{
\color{subheadings}\raggedright\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{10pt}{12pt}\selectfont {#1\\} \normalfont}

% Project command
\newcommand{\project}[1]{
\color{subheadings}\raggedright\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{10pt}{12pt}\selectfont {#1\\} \normalfont}

% Tech command
\newcommand{\tech}[1]{
\color{subheadings}\fontspec[Path = fonts/raleway/]{Raleway-Light}\fontsize{10pt}{12pt}\selectfont {#1} \color{subsubheadings}\normalfont}

% Bullet Lists with fewer gaps command
\newenvironment{tightemize}{
\vspace{-\topsep}\begin{itemize}\itemsep1pt \parskip0pt \parsep0pt \parfillskip=0pt}
{\end{itemize}\vspace{-\topsep}}

% Keyword Box
\newtcbox\keywordbox{
    on line,
    %colback=subheading,
    %colframe = heading,
    left = 0.2em,
    right = 0.2em,
    top = 0.2ex,
    bottom = 0ex,
    boxsep = 0pt,
    boxrule = 0.5pt,
    arc = 1pt,
}
\newcommand\keywords[1]{%
    %\par
    \foreach \kw in {#1} {
        \keywordbox{\strut\textcolor{headings}{\kw}}
    }
    \par
}

