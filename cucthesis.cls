% Author: Runze Zhao
% Email: 884414918@qq.com
% License: LaTeX Project Public License v1.3c
% Date: May 27, 2023

\ProvidesClass{cucthesis}[2023/04/27 v0.22 This is Class of Communication University of China]
\NeedsTeXFormat{LaTeX2e}

\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\RequirePackage{calc}

\SetupKeyvalOptions{family=CUC, prefix=CUC@, setkeys=\kvsetkeys}
\newcommand{\ckv}[1]{\kvsetkeys{CUC}{#1}}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessKeyvalOptions*\relax
\LoadClass{article}


% 设置纸张格式
\RequirePackage[
  a4paper,
  left=2.5cm,right=2.3cm,top=2.3cm,bottom=2.74cm,
  headheight=10cm,
  headsep=0.3cm,footskip=0.65cm]{geometry}
\setlength{\headsep}{0.6cm}

\RequirePackage{amsthm,amsmath,amssymb,indentfirst,booktabs,multicol,multirow,xcolor,graphicx,fancyhdr,hologo}


% 设置目录与引用的超链接（需要编译多次）
\RequirePackage{hyperref}
\hypersetup{
  pdfborder={0 0 0},
  colorlinks=false,linkcolor={blue},urlcolor={blue},filecolor={blue},citecolor={blue},
  linktoc=all,
}

%%%%%%%%%%%%%%%%%%%%%% 字体与段落 %%%%%%%%%%%%%%%%%%%%%%

\PassOptionsToPackage{no-math}{fontspec}
\RequirePackage[UTF8,scheme=plain]{ctex}
\setmainfont{Times New Roman}

% 1.25倍行距
% https://github.com/TheNetAdmin/zjuthesis/issues/125
\linespread{1.50}\selectfont

% 段落缩进2字符
\setlength\parindent{2\ccwd}

%%%%%%%%%%%%%%%%%%%%%% 引用格式 %%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{gbt7714}
\bibliographystyle{gbt7714-numerical}
\setlength{\bibsep}{0.0pt}
\def\bibfont{\zihao{5}}
\renewcommand\refname{参考文献}

\renewcommand\figurename{图}
\renewcommand\tablename{表}

\RequirePackage{caption}
\DeclareCaptionLabelSeparator{onespace}{~~}
\captionsetup[table]{skip=8pt,labelsep=onespace}
\captionsetup[figure]{skip=8pt,labelsep=onespace}

\renewcommand{\captionfont}{\songti\zihao{5}}

% 图表与公式编号
\counterwithin{figure}{section}
\counterwithin{table}{section}
\counterwithin{equation}{section}
\renewcommand{\thefigure}{\arabic{section}-\arabic{figure}}
\renewcommand{\thetable}{\arabic{section}-\arabic{table}}
\renewcommand{\theequation}{\arabic{section}-\arabic{equation}}

\renewcommand{\appendix}{
  \renewcommand\figurename{附图}
  \renewcommand\tablename{附表}
  \renewcommand{\thefigure}{\arabic{figure}}
  \renewcommand{\thetable}{\arabic{table}}
}

%\setlength{\belowcaptionskip}{0.5\ccwd}
%\setlength{\abovecaptionskip}{0.5\ccwd}

%%%%%%%%%%%%%%%%%%%%%% code 样式 %%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{listings}

\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}

\lstdefinestyle{defaultstyle}{
    commentstyle=\color{codegreen},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breaklines=true,
    keepspaces=true,
    tabsize=2,
    frame=single,
}

\lstset{style=defaultstyle}

%%%%%%%%%%%%%%%%%%%%%% 摘要与关键词 %%%%%%%%%%%%%%%%%%%%%%

% 中文摘要命令
\renewenvironment{abstract}{
  \clearpage\phantomsection
  \begin{center}
    % \vspace*{-10pt}
    \vspace*{1.5cm}
    \zihao{3}\heiti{\myTitleCH}
    
    \vspace*{1cm}
    
    \zihao{-3}\textbf{\heiti{摘~~~要}}
    \vspace{8pt}
  \end{center}

\songti
\begin{spacing}{1.7}
  \addcontentsline{toc}{section}{摘~~~要}
  \zihao{-4}\ignorespaces
}{\end{spacing}}{\clearpage}

\newcommand{\keywords}[1]{\noindent\heiti{~\\[1\baselineskip]关键词：}\songti\zihao{-4} #1}

\newcommand{\maketitleEN}{
  \zihao{-2}\textbf{\heiti\thesisTitleEN}
  \vspace{2\ccwd}

  \zihao{4}\yourNameEN
  \vspace{1.5\ccwd}
}

\RequirePackage{setspace,titlesec,zhnumber,titletoc}

% 英文摘要命令
\newenvironment{abstractEN}{
  \clearpage\phantomsection
  \begin{center}
    \vspace*{2cm}
    % \maketitleEN    % Extra command
    \zihao{3}\textit{\myTitleEN}
    
    \vspace*{1.5cm}

    \zihao{4}\textbf{\heiti{ABSTRACT}}
    
    \vspace{8pt}
  \end{center}

  \addcontentsline{toc}{section}{ABSTRACT}

  \begin{spacing}{1.7}
  \zihao{-4}\ignorespaces
}{\end{spacing}}

\newcommand{\keywordsEN}[1]{\noindent{\textbf{~\\[0.5\baselineskip]Keywords:} }\textit{#1}}

%%%%%%%%%%%%%%%%%%%%%% 章节标题样式 %%%%%%%%%%%%%%%%%%%%%%

% 设置中文的标题样式
% \renewcommand{\thesection}{\zhnum{section}}
% \renewcommand{\thesubsection}{\zhnum{subsection}}
% \renewcommand{\thesection}{\section}
% \renewcommand{\thesubsection}{\subsection}

\renewcommand{\thesubsubsection}{\arabic{subsubsection}}

\newcommand{\sectionbreak}{\clearpage}

\titleformat{\section}[block]{\vspace*{-5pt} \zihao{3} \heiti}
{\thesection}{2pt}{\vspace{8pt}}

\titleformat{\subsection}{\vspace*{-5pt} \zihao{4} \heiti}
{\thesubsection}{3pt}{}

\titleformat{\subsubsection}{\zihao{-4} \heiti}
{\thesubsubsection.~~}{0pt}{}

%%%%%%%%%%%%%%%%%%%%%% 目录样式 %%%%%%%%%%%%%%%%%%%%%%

\renewcommand\contentsname{目~~~~录}

\titlecontents{section}[0pt]{\bfseries \songti \zihao{4}}
{\thecontentslabel }{}
{\titlerule*[0.7em]{.}\contentspage}

\titlecontents{subsection}[0\ccwd]{\heiti \zihao{-4}}
{\thecontentslabel}{}
{\titlerule*[0.9em]{.}\contentspage}

\titlecontents{subsubsection}[3\ccwd]{\songti \zihao{-4}}
{\thecontentslabel.~~}{}
{\titlerule*[0.7em]{.}\contentspage}


%%%%%%%%%%%%%%%%%%%%%% 命令封装 %%%%%%%%%%%%%%%%%%%%%%

\newenvironment{references}{\clearpage\phantomsection\addcontentsline{toc}{section}{参考文献}}{\clearpage}

\fancypagestyle{CUCThesisMain}{
    \fancyhf{}
    \cfoot{\songti\zihao{-5}{\thepage}}
    \renewcommand{\headrulewidth}{0pt}
}

\titleformat{\section}[block]{\vspace*{-24pt} \centering \zihao{3} \heiti}
{\thesection、}{0pt}{\vspace{1pt}}

% 设置一下页眉取样的格式
\renewcommand{\sectionmark}[1]{\markboth{#1}{}} 

\newcommand{\contentpage}{
  \begin{spacing}{1.5}
    \tableofcontents
  \end{spacing}

  % 内容标题样式
  \titleformat{\section}[block]{\vspace*{-5pt}  \zihao{3} \heiti}
    {\thesection }{4pt}{\vspace{8pt}}

  \clearpage
  
  % 设置页眉
  \fancyhead{}
  \fancyhf[EHR]{\zihao{5}\ziju{0.08}\songti{\leftmark}}
  \fancyhf[OHL]{\zihao{5}\ziju{0.08}\songti{中国传媒大学本科毕业论文}}
  
  
  \renewcommand{\headrulewidth}{1.0pt}
  \pagenumbering{arabic}
  \setcounter{page}{1}
  
}

\newcommand{\nonumsection}[1]{
  \clearpage\phantomsection
  \section*{#1}
  \stepcounter{section}
  \addcontentsline{toc}{section}{#1}
}



%%%%%%%%%%%%%%%%%%%%%% 封面 %%%%%%%%%%%%%%%%%%%%%%

\newcommand{\dunderline}[3][-6pt]{{
  \setbox0=\hbox{#3}
  \ooalign{\copy0\cr\rule[\dimexpr#1-#2\relax]{\wd0}{#2}}
}}

\newcommand{\infobox}[2]{
    \hspace{2.3cm}\songti\zihao{4}\selectfont{#1~\textbf{\dunderline{1pt}{\makebox[7cm][c]{#2}}}}
}


\newcommand{\coverpage}{
  \begin{titlepage}
    \vspace*{-3pt}
  
    \noindent
    \zihao{4}\kaishu{
      分类号：\dunderline{0.6pt}{\makebox[4cm][c]{\hphantom{空白}}}\hfill \hfill
      单位代码：\dunderline{0.6pt}{\makebox[4.5cm][c]{10033}}
    }
    
    \vspace*{0.5cm}
    
    \noindent
    \zihao{4}\kaishu{
      密\hphantom{空}级：\dunderline{0.6pt}{\makebox[4cm][c]{\hphantom{空白}}}\hfill \hfill
      学\hphantom{空}\hphantom{空}号：\dunderline{0.6pt}{\makebox[4.5cm][c]{\studentID}}
    }
  
    \vspace*{2\ccwd}

    \begin{figure}[h]
        \centering
        \includegraphics[width=10cm]{imgs/title.png}
        % \caption{}
        % \label{fig:title}
    \end{figure}
  
    \centering
        \zihao{2}\songti{本科毕业论文}
    \vspace{0.2cm}

    \begin{figure}[h]
        \centering
        \includegraphics[width=2.8cm]{imgs/logo2.png}
        % \caption{}
        % \label{fig:title}
    \end{figure}
  
    % \vspace{0.5cm}
  
    \flushleft
    \noindent
        \zihao{3}\songti{
        \textbf{中文论文题目：\dunderline{1pt}{\makebox[11cm][c]{\myTitleCH}}}
        }
    \flushleft
    \vspace{0.5cm}
    
    \noindent
        \zihao{3}\songti{
        \textbf{英文论文题目：}\dunderline{1pt}{\makebox[11cm][c]{\myTitleEN}}}
        
    \vspace{0.5cm}
  
    \begin{spacing}{2}

        \infobox{申请人姓名：}{\myName}

        \infobox{指导教师\hphantom{空}：}{\myMentor}

        \infobox{专业名称\hphantom{空}：}{\myMajor}

        \infobox{研究方向\hphantom{空}：}{}

        \infobox{所在学院\hphantom{空}：}{\myDept}
    \end{spacing}
  
    \vspace{0.9cm}

    % \centering
    % \zihao{-2}\ziju{0.5}\textbf{\songti{中国传媒大学}}
  
    % \zihao{-2}\ziju{0.5}\textbf{\songti{\zhtoday}}
    \centering
        \zihao{-3}\textbf{\songti{论文提交日期\dunderline{1pt}\disdate}}

  \end{titlepage}
  
  \pagestyle{CUCThesisMain}
  \pagenumbering{Roman}
  \setcounter{page}{1}
}
%%%%%%%%%%%%%%%%%%%%%% 独创性声明 %%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\statement}{

  \clearpage\phantomsection

    % \vspace*{-10pt}
    % \vspace*{0cm}
    \centerline{
        \zihao{-2}\songti{中国传媒大学本科生毕业论文独创性声明}
    }
    
    \vspace*{1.5cm}
    % \noindent
    \zihao{-4}
    \songti{
        本人声明所呈交的毕业论文是本人在导师指导下进行的研究工作及取得的研究成果。除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得\textbf{\dunderline{1pt}{中国传媒大学}}或其他教育机构的学位或证书而使用过的材料。与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示谢意。
    }

    
    \vspace{2cm}
    \noindent
    \zihao{-4}
    \songti{
    毕业论文作者签名：\makebox[3cm][c]{} 签字日期： \makebox[2cm][c]{}年 \makebox[1cm][c]{}月 \makebox[1cm][c]{}日
    }
    
    \vspace{2.2cm}

    \centerline{
        \zihao{-2}\songti{毕业论文版权使用授权书}
    }
    \vspace*{2cm}

    
    \zihao{-4}
    \songti{
    本毕业论文作者完全了解 \textbf{\dunderline{1pt}{中国传媒大学}}有权保留并向国家有关部门或机构送交本论文的复印件和磁盘，允许论文被查阅和借阅。本人授权\textbf{\dunderline{1pt}{中国传媒大学}} 可以将毕业论文的全部或部分内容编入有关数据库进行检索和传播，可以采用影印、缩印或扫描等复制手段保存、汇编毕业论文。
    }
    
    \zihao{-4}
        \songti{
        （保密的毕业论文在解密后适用本授权书）
    }

    \vspace{1.5cm}
    \noindent
    \zihao{-4}
    \songti{
    毕业论文作者签名：\makebox[4cm][c]{} 指导教师签名： \makebox[3cm][c]{}
    }

    
    \vspace{1cm}
    \noindent
    \zihao{-4}
    \songti{
    签字日期： \makebox[1.3cm][c]{}年 \makebox[0.7cm][c]{}月 \makebox[0.7cm][c]{}日
     \makebox[1.6cm][c]{}
    签字日期： \makebox[1.3cm][c]{}年 \makebox[0.7cm][c]{}月 \makebox[0.7cm][c]{}日
    }
    
  \zihao{-4}\ignorespaces
{\clearpage}

}