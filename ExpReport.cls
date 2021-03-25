\LoadClass{ctexart}
\usepackage{geometry}
\geometry{left=3.18cm,right=3.18cm,top=4.04cm,bottom=2.54cm,headsep=1cm,headheight=35pt}
\usepackage{fontspec}
\usepackage{amsmath}
\usepackage{makecell}
\usepackage{fancyhdr}
\usepackage{adjustbox}
\usepackage{anyfontsize}

\usepackage[normalem]{ulem}
\useunder{\uline}{\ul}{}

\usepackage{graphicx}

% Suppress FandolSong warning
\usepackage{xpatch}
\ExplSyntaxOn
\xpatchcmd \fontspec_new_script:nn
  { \__fontspec_warning:nxx }
  { \__fontspec_info:nxx }
  {}{\fail}
% redeclare
\newfontscript{CJK}{hani}
% \newfontscript{CJK~Ideographic}{hani}
\ExplSyntaxOff

\usepackage{xcolor}
\definecolor{deepblue}{rgb}{0,0,0.5}
\definecolor{deepred}{rgb}{0.6,0,0}
\definecolor{deepgreen}{rgb}{0,0.5,0}

\usepackage{graphics, listings}
\lstset{%frame=single,
	basicstyle=\small\ttfamily,
	keywordstyle=\color{deepblue}\textbf,
    stringstyle=\color{deepred},
    breaklines=true,
    commentstyle=\color{deepgreen},
}

\newlength\widest
\makeatletter
\makeatother

\NewDocumentCommand{\kai}{}{\CJKfontspec{楷体}[
        AutoFakeBold,
        AutoFakeSlant,
      ] \selectfont}

\makeatletter

\def\course#1{\gdef\@course{#1}}
\def\@course{\@latex@warning@no@line{No \noexpand\course given}}

\def\expno#1{\gdef\@expno{#1}}
\def\@expno{\@latex@warning@no@line{No \noexpand\expno given}}

\def\exptype#1{\gdef\@exptype{#1}}

\def\authorno#1{\gdef\@authorno{#1}}
\def\@authorno{\@latex@warning@no@line{No \noexpand\authorno given}}

\def\director#1{\gdef\@director{#1}}
\def\@director{\@latex@warning@no@line{No \noexpand\director given}}

\def\classroom#1{\gdef\@classroom{#1}}
\def\@classroom{\@latex@warning@no@line{No \noexpand\classroom given}}

\def\college#1{\gdef\@college{#1}}
\def\@college{\@latex@warning@no@line{No \noexpand\college given}}

\def\department#1{\gdef\@department{#1}}
\def\@department{\@latex@warning@no@line{No \noexpand\department given}}

\def\major#1{\gdef\@major{#1}}
\def\@major{\@latex@warning@no@line{No \noexpand\major given}}

\def\temp#1{\gdef\@temp{#1}}
\def\humid#1{\gdef\@humid{#1}}

% 设置section左对齐，默认是居中
\ctexset{section={format={\Large\textbf}}}
% 设置章节编号
\renewcommand\thesection{\chinese{section}、}
\renewcommand\thesubsection{\arabic{subsection}.}
\renewcommand\thesubsubsection{\alph{subsubsection})}

% 设置章节编号与章节标题的距离
\makeatletter
\renewcommand\@seccntformat[1]{%
    {\csname the#1\endcsname}
}

\makeatother

\pagestyle{fancy}
\fancyhead{}

\fancyhead[C]{{\kai  \fontsize{22pt}{\baselineskip}\selectfont  \bfseries 暨南大学本科实验报告专用纸 }(附页) \\  }
\fancyfoot[C]{\thepage}

\makeatletter
\renewcommand\maketitle{
    \thispagestyle{empty}
    \vspace*{-2cm}
    {\raggedright % Note the extra {
        \begin{center}
            \fontsize{22pt}{\baselineskip}\selectfont \kai \bfseries 暨南大学本科实验报告专用纸
        \end{center}
        \vspace*{-0.3cm}
        \begin{table}[htbp]
            \kai
            \renewcommand\arraystretch{0.8}
            \fontsize{14pt}{\baselineskip}\selectfont
            \adjustbox{center}{
                \begin{tabular}{l p{7cm}<{\centering} l p{3.6cm}}
                    课程名称& \@course & 成绩评定 &              \\ \cline{2-2} \cline{4-4}
                \end{tabular}
            }
            \adjustbox{center}{
                \begin{tabular}{l p{6cm}<{\centering} l p{3.6cm}<{\centering}}
                    实验项目名称 & \@title & 指导老师 & \@director  \\ \cline{2-2} \cline{4-4}
                \end{tabular}
            }
            \adjustbox{center}{
                \begin{tabular}{l p{3cm}<{\centering} l p{1.2cm}<{\centering} l p{1.6cm}<{\centering}}
                    实验项目编号 &  \@expno & 实验项目类型 & \@exptype  & 实验地点 & \@classroom \\ \cline{2-2} \cline{4-4} \cline{6-6}
                \end{tabular}
            }
            \adjustbox{center}{
                \begin{tabular}{l p{4cm}<{\centering} l p{7.6cm}<{\centering}}
                    学生姓名    &  \@author        & 学号     &  \@authorno  \\ \cline{2-2} \cline{4-4}
                \end{tabular}
            }
            
            \adjustbox{center}{
                \begin{tabular}{l p{4.2cm}<{\centering} l p{2.6cm}<{\centering} l p{4.4cm}<{\centering}}
                学院     &{\@college}& 系      & \@department & 专业   & \@major \\
                \cline{2-2} \cline{4-4} \cline{6-6} 
                \end{tabular}
            }

            \adjustbox{center}{
                \begin{tabular}{l p{8.4cm}<{\centering} l p{0.3cm}<{\centering} l p{0.3cm}<{\centering}}
                    实验日期     & \@date & 温度 & \@temp & $^{\circ}$C 湿度 & \@humid \\ \cline{2-2} \cline{4-4} \cline{6-6}
                \end{tabular}
            }

        \end{table}

    }
}

\makeatother