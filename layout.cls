\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{layout}[2025/04/10 Simple resume layout class]

% Base class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% Define xetexorluatex condition before it's used
\RequirePackage{ifxetex,ifluatex}
\newif\ifxetexorluatex
\ifxetex
  \xetexorluatextrue
\else
  \ifluatex
    \xetexorluatextrue
  \else
    \xetexorluatexfalse
  \fi
\fi

% Packages - load necessary packages before geometry
\RequirePackage{paracol}
\RequirePackage{fontawesome}

\ifxetexorluatex
  \RequirePackage{fontspec}
\else
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[T1]{fontenc}
  \RequirePackage[default]{lato}
\fi

% Essential packages
\RequirePackage{xcolor}
\RequirePackage{tikz}
\RequirePackage[skins]{tcolorbox}
\RequirePackage{enumitem}
\RequirePackage{graphicx}
\RequirePackage{etoolbox}
\RequirePackage{dashrule}
\RequirePackage{multirow,tabularx}
\RequirePackage{changepage}
\RequirePackage{afterpage}

% Colors
\colorlet{accent}{blue!70!black}
\colorlet{heading}{black}
\colorlet{emphasis}{black}
\colorlet{body}{black!80!white}

% Layout tweaks
\setlength{\parindent}{0pt}
\setlist{leftmargin=*,labelsep=0.5em,nosep,itemsep=0.25\baselineskip,after=\vskip0.25\baselineskip}
\setlist[itemize]{label={\normalsize\textbullet}}

% Custom symbols
\newcommand{\itemmarker}{{\normalsize\textbullet}}
\newcommand{\ratingmarker}{\faCircle}
\newcommand{\divider}{\textcolor{body!30}{\hdashrule{\linewidth}{0.6pt}{0.5ex}}\medskip}

% Wide content blocks
\newenvironment{fullwidth}{%
  \begin{adjustwidth}{}{\dimexpr -\marginparwidth - \marginparsep\relax}}%
  {\end{adjustwidth}}

% Contact Info
\newcommand{\printinfo}[2]{\mbox{\textcolor{accent}{\normalfont #1}\hspace{0.5em}#2\hspace{2em}}}
\newcommand{\email}[1]{\printinfo{\faAt}{#1}}
\newcommand{\phone}[1]{\printinfo{\faPhone}{#1}}
\newcommand{\homepage}[1]{\printinfo{\faChain}{#1}}
\newcommand{\location}[1]{\printinfo{\faMapMarker}{#1}}
\newcommand{\linkedin}[1]{\printinfo{\faLinkedin}{#1}}
\newcommand{\twitter}[1]{\printinfo{\faTwitter}{#1}}
% \newcommand{\xicon}[1]{\printinfo{\faX}{#1}}
\newcommand{\github}[1]{\printinfo{\faGithub}{#1}}

% Name & Header
\newcommand{\name}[1]{\def\@name{#1}}
\newcommand{\tagline}[1]{\def\@tagline{#1}}
\newcommand{\personalinfo}[1]{\def\@personalinfo{#1}}

\newcommand{\makecvheader}{%
  \begingroup
    \raggedright\color{emphasis}%
    {\Huge\bfseries\MakeUppercase{\@name}\par}
    \medskip
    {\large\bfseries\color{accent}\@tagline\par}
    \medskip
    {\fontsize{9.5pt}{11pt}\selectfont\bfseries\@personalinfo\par}
  \endgroup
  \bigskip
}

% Quotes
\renewenvironment{quote}{\color{accent}\itshape\large}{\par}

% Sections
\newcommand{\cvsection}[1]{%
  \bigskip
  {\color{heading}\LARGE\bfseries\MakeUppercase{#1}}\\[-1ex]
  {\color{heading}\rule{\linewidth}{2pt}\par}
  \medskip
}

\newcommand{\cvsubsection}[1]{\smallskip{\color{emphasis}\large\bfseries#1\par}\medskip}

% Event
\newcommand{\cvevent}[4]{%
  {\large\text{#1}}\par
  \smallskip
  {\textbf{#2}}\par
  \medskip
  {\small\faCalendar\hspace{0.5em}#3 \hspace{2em} \faMapMarker\hspace{0.5em}#4}\par
  \medskip
}

\newcommand{\cvachievement}[3]{%
  \begin{tabularx}{\linewidth}{@{}p{2em} @{\hspace{1ex}} >{\raggedright\arraybackslash}X@{}}
  \multirow{4}{*}{\Large\color{accent}#1} & \bfseries\textcolor{emphasis}{#2}\\
  & #3
  \end{tabularx}%
}

\newcommand{\cvproject}[1]{\textbf{\color{accent}#1}\par\smallskip\normalsize}

\newcommand{\cvtag}[1]{%
  \tikz[baseline]\node[anchor=base,draw=body!30,rounded corners,inner xsep=1ex,inner ysep=0.75ex,text height=1.5ex,text depth=.25ex]{#1};
}

\newcommand{\cvskill}[2]{%
  \textcolor{emphasis}{\textbf{#1}}\hfill
  \foreach \x in {1,...,5}{\space{\ifnumgreater{\x}{#2}{\color{body!30}}{\color{accent}}\ratingmarker}}\par%
}

\newcommand{\cvref}[3]{%
  \smallskip
  \textcolor{emphasis}{\bfseries#1}\par
  \begin{description}[font=\color{accent},style=multiline,leftmargin=1.35em]
    \item[\normalfont\faAt] #2
    \item[\normalfont\faEnvelope] #3
  \end{description}
}

\newenvironment{cvcolumn}[1]{\begin{minipage}[t]{#1}\raggedright}{\end{minipage}}

% Bibliography (optional)
\RequirePackage[backend=biber,style=authoryear,sorting=ydnt]{biblatex}
\defbibheading{pubtype}{\cvsubsection{#1}}
\renewcommand{\bibsetup}{\vspace*{-\baselineskip}}
\AtEveryBibitem{\makebox[\bibhang][l]{\itemmarker}}
\setlength{\bibitemsep}{0.25\baselineskip}

% Sidebar helpers (optional)
\newcommand{\addsidebar}[2][]{\marginpar{\ifstrequal{#1}{}{}{\vspace*{#1}}\input{#2}}}
\newcommand{\addnextpagesidebar}[2][]{\afterpage{\addsidebar[#1]{#2}}}

% Setup
\AtBeginDocument{%
  \pagestyle{empty}
  \color{body}
  \raggedright
}