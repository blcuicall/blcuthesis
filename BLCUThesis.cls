% Identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{BLCUThesis}[2022/08/09 Unofficial LaTeX Document Class for BLCU Thesis]

% Preliminary declarations
%% 基本文档类及引入的宏包 %%
\LoadClass{report}
\RequirePackage[UTF8,zihao=-4,heading=true,linespread=1.5]{ctex}
\RequirePackage[a4paper,top=25mm,bottom=20mm,left=30mm,right=20mm]{geometry}
\RequirePackage[colorlinks, linkcolor=black, anchorcolor=yellow, citecolor=blue]{hyperref}
\RequirePackage{amssymb, amsfonts, amsmath, amsthm, mathtools, mathrsfs, bm, calc} %% 和数学相关的一些宏包
\RequirePackage{bookmark}
\RequirePackage{graphicx}
\RequirePackage{setspace}
\RequirePackage{needspace}
\RequirePackage{lastpage}
\RequirePackage{chngcntr}  % 图标按章节编号
\RequirePackage{placeins}  % 图片仅限本章浮动
\RequirePackage{float}  % 浮动体的 H 选项
\RequirePackage{caption,subcaption}  % 标题控制
\RequirePackage{listings}  % 代码环境
\RequirePackage{xcolor}  % 颜色支持
\RequirePackage{tcolorbox}  % 文本框
\RequirePackage{longtable}  % 长表格
\RequirePackage{makecell}  % 表格线宽支持
\RequirePackage{booktabs}  % 三线表支持
\RequirePackage{bigstrut} %% 该宏包提供 \bigstrut 命令，可以增大表格的行间距
\RequirePackage{gbt7714}
\RequirePackage{emptypage} %% 此宏包负责的任务是当每一章最后一页是偶数页时，设置空白
\RequirePackage{tikz}
\RequirePackage{indentfirst}
\RequirePackage[final]{pdfpages}
\RequirePackage{titlesec}  % titlespacing
\RequirePackage[titles]{tocloft}  % 用于设置目录条目
\RequirePackage{suffix}  % 定义 * 命令
\RequirePackage{varwidth}  
\RequirePackage{ulem}  % 删除线  
\RequirePackage{ wasysym}
\RequirePackage{kvoptions}

% Options
\SetupKeyvalOptions{family=blcu, prefix=blcu@}
\DeclareBoolOption{final}
\DeclareBoolOption{master}
\DeclareBoolOption{doctor}
\DeclareBoolOption{continuousNum}
\ProcessKeyvalOptions*

% More declarations
%% 全局设置 %%
%% 字体：宋体 %%
\setCJKmainfont [AutoFakeBold={2.17}, Path=fonts/] {simsun.ttc}  % 中文默认字体
\setCJKfamilyfont{SimSun}[AutoFakeBold={2.17}, Path=fonts/] {simsun.ttc}
\renewcommand\songti{\CJKfamily{SimSun}}

%% 字体：黑体 %%
\setCJKfamilyfont{SimHei}[AutoFakeBold={2.17}, Path=fonts/] {simhei.ttf}
\renewcommand\heiti{\CJKfamily{SimHei}}

%% 字体：楷体 %%
\setCJKfamilyfont{SimKai}[AutoFakeBold={2.17}, Path=fonts/] {simkai.ttf}
\newcommand\kaiti{\CJKfamily{SimKai}}

%% 字体：仿宋 %%
\setCJKfamilyfont{SimFang}[AutoFakeBold={2.17}, Path=fonts/] {simfang.ttf}
\renewcommand\fangsong{\CJKfamily{SimFang}}

%% 字体：方正简明小标宋 %%
\setCJKfamilyfont{FZSong}[AutoFakeBold={2.17}, Path=fonts/] {fzxbs.ttf}
\newcommand\fzsong{\CJKfamily{FZSong}}

\setmainfont{Times New Roman}  % 西文默认字体

% 章节标题
\ctexset{
    chapter = { % 一级标题
        format = \centering\heiti\zihao{3},  % 黑体三号居中
        number=\chinese{chapter},
        name={第,章},
        break=\cleardoublepage,
    },
    section = {  % 二级标题
        format = \heiti\zihao{-3}, % 黑体小三号
        number=\thechapter.\arabic{section},
    },
    subsection = {  % 三级标题
        format = \heiti\zihao{4},  % 黑体四号
        number=\thechapter.\arabic{section}.\arabic{subsection}
    },
    subsubsection = {  % 四级标题
        format = \heiti\zihao{-4},  % 黑体小四号
        indent = 2\ccwd,  % 缩进两字符
        number=\arabic{subsubsection},
        name = {（,）},
    },
    tocdepth=1,
    secnumdepth=4,
}

%% 页眉页脚预设置
%\pagestyle{fancy}
%\fancyhf{}

%% 页眉设置
%\fancyhead[L]{  % 设置页眉左侧
    %\raisebox{-.1cm}{
        %\includegraphics[height=1cm]{figures/BLCULogo.png}
        %\includegraphics[height=1cm]{figures/BLCULogoText.png}
        %}
    %}
%\fancyhead[R]{\let\\=\relax\heiti\zihao{5}\BLCUThesis@title}  % 设置页眉右侧

% 长度变量，定义各种封面时使用
\newlength{\maxwidth}
\newcommand{\titleBoxLen}{10.5cm}
\newcommand{\len}{8cm}
\newcommand{\llen}{6cm}

% 图表名格式设置
\captionsetup{font={small},labelsep=space}  % 图表标题设为五号字体、序号与图表名之间以空格分隔
\captionsetup[table]{font={small},labelsep=space}  % 表标题设为五号加粗、表序与表名之间以空格分隔

\ifblcu@continuousNum
    \counterwithout{figure}{chapter}  % 图按章节编号
    \counterwithout{table}{chapter}  % 表按章节编号
    \renewcommand{\thefigure}{\arabic{figure}}  % 图几.几
    \renewcommand{\thetable}{\arabic{table}}  % 表几-几
\else
    \counterwithin{figure}{chapter}  % 图按章节编号
    \counterwithin{table}{chapter}  % 表按章节编号
    \renewcommand{\thefigure}{\thechapter.\arabic{figure}}  % 图几.几
    \renewcommand{\thetable}{\thechapter-\arabic{table}}  % 表几-几
\fi

\numberwithin{equation}{chapter}
\renewcommand\theequation{\arabic{chapter}-\arabic{equation}}
\newtagform{leaderText}{式（}{）}
\usetagform{leaderText}

% 增大表格间距
% \renewcommand{\arraystretch}{1.2}

% 代码抄录的一系列设置
\lstset{
    basicstyle=\footnotesize\ttfamily, 
    flexiblecolumns, 
    numbers=left, 
    numbersep=5pt, 
    numberstyle=\tiny, 
    backgroundcolor=\color{white}, 
    frame=single, 
    breaklines=true, 
    showtabs=false, 
    showspaces=false, 
    showstringspaces=false, 
    keywordstyle=\color{teal}, 
    commentstyle=\color{blue}, 
    stringstyle=\color{red}, 
    numberstyle=\color{gray}, 
    tabsize=8, 
    breakatwhitespace=false, 
    postbreak=\mbox{\textcolor{violet}{$\hookrightarrow$}\space}
} %% 代码抄录的一系列设置

% 填写基本信息的命令
% 论文题目
\newcommand{\BLCUThesis@title}{题目}
\newcommand{\BLCUThesis@entitle}{Title}
\newcommand{\thesisTitle}[2]{
    \def\BLCUThesis@title{#1}
    \def\BLCUThesis@entitle{#2}
}

% 论文完成时间
\newcommand{\BLCUThesis@completeYear}{}
\newcommand{\BLCUThesis@completeMonth}{}
\newcommand{\BLCUThesis@completeDay}{}
\newcommand{\thesisCompleteTime}[3]{
    \def\BLCUThesis@completeYear{#1}
    \def\BLCUThesis@completeMonth{#2}
    \def\BLCUThesis@completeDay{#3}
}

% 学生姓名
\newcommand{\BLCUThesis@stuName}{}
\newcommand{\stuName}[1]{\def\BLCUThesis@stuName{#1}}

% 学生国籍
\newcommand{\BLCUThesis@stuCountry}{}
\newcommand{\stuCountry}[1]{\def\BLCUThesis@stuCountry{#1}}

% 学生学号
\newcommand{\BLCUThesis@stuID}{}
\newcommand{\stuID}[1]{
    \def\BLCUThesis@stuID{#1}
}

% 学生班级
\newcommand{\BLCUThesis@stuClass}{}
\newcommand{\BLCUThesis@stuShortClass}{}
\newcommand{\stuClass}[2]{
    \def\BLCUThesis@stuClass{#1}
    \def\BLCUThesis@stuShortClass{#2}
}

% 学生专业
\newcommand{\BLCUThesis@stuMajor}{}
\newcommand{\stuMajor}[1]{
    \def\BLCUThesis@stuMajor{#1}
}

% 学生研究方向
\newcommand{\BLCUThesis@stuDirection}{}
\newcommand{\stuDirection}[1]{
    \def\BLCUThesis@stuDirection{#1}
}

% 指导老师姓名
\newcommand{\BLCUThesis@supervisorName}{}
\newcommand{\supervisorName}[1]{
    \def\BLCUThesis@supervisorName{#1}
}

% 学生所在学院
\newcommand{\BLCUThesis@stuCollege}{}
\newcommand{\stuCollege}[1]{
    \def\BLCUThesis@stuCollege{#1}
}

% 诚信声明作者签名
\newcommand{\BLCUThesis@integrityStatement@author}{}
\newcommand{\integrityStatementAuthor}[1]{
    \def\BLCUThesis@integrityStatement@author{#1}
}

% 诚信声明导师签名
\newcommand{\BLCUThesis@integrityStatement@supervisor}{}
\newcommand{\integrityStatementSupervisor}[1]{
    \def\BLCUThesis@integrityStatement@supervisor{#1}
}

% 诚信声明年月日
\newcommand{\BLCUThesis@integrityStatement@year}{}
\newcommand{\BLCUThesis@integrityStatement@month}{}
\newcommand{\BLCUThesis@integrityStatement@day}{}
\newcommand{\integrityStatementDate}[3]{
    \def\BLCUThesis@integrityStatement@year{#1}
    \def\BLCUThesis@integrityStatement@month{#2}
    \def\BLCUThesis@integrityStatement@day{#3}
}

% 定义中英文摘要的命令
\newcommand{\BLCUThesis@abstract@title}{\BLCUThesis@title}
\newcommand{\BLCUThesis@abstract@entitle}{\MakeUppercase{\BLCUThesis@entitle}}
\newcommand{\abstractZhtitle}[1]{
    \def\BLCUThesis@abstract@title{#1}
}
\newcommand{\abstractEntitle}[1]{
    \def\BLCUThesis@abstract@entitle{#1}
}

% 制作匿名评审封面
\def\makeReviewCover{
    \begin{titlepage}

        论文编号：\underline{\makebox[3cm][l]{}}

        \begin{center}
            \vspace*{1.5\baselineskip}
            \includegraphics[width=2cm]{figures/BLCULogo.png}
            \hspace*{1cm}
            \includegraphics[width=9.8cm]{figures/BLCULogoText.png}
        \end{center}
        
        \begin{center}
            \bfseries\heiti
            \vspace*{1\baselineskip}
            \makebox{\fontsize{34bp}{2\hsize} 研究生学位论文} 
            
            \makebox{\zihao{3}（匿名评阅用）}
        \end{center}
        
        \vspace*{0.5cm}

        \makebox[0.85\linewidth][r]{
            \bfseries\zihao{3}\heiti \ifblcu@master \CheckedBox \else \Square \fi 硕士
            \bfseries\zihao{3}\heiti \ifblcu@doctor \CheckedBox \else \Square \fi 博士
        }
        
        \begin{center}
            \vspace*{1cm}
            \begin{spacing}{1.8}
                \zihao{-2}
                \settowidth{\maxwidth}{English Title：}
                \makebox[\maxwidth][s]{题目：}\underline{\makebox[\titleBoxLen][l]{}}
                
                \hspace*{\maxwidth}
                \underline{\makebox[\titleBoxLen][l]{}}
                
                \vspace*{-2\baselineskip}  % 2.78cm
                \hspace*{\maxwidth}
                \begin{minipage}[t][2\baselineskip][t]{\titleBoxLen}
                    \begin{center}\BLCUThesis@title\end{center}
                \end{minipage}
                
                \makebox[\maxwidth][s]{English Title：}\underline{\makebox[\titleBoxLen][l]{}}
                
                \hspace*{\maxwidth}\underline{\makebox[\titleBoxLen][l]{}}
                
                \vspace*{-2\baselineskip}  % 2.78cm
                \hspace*{\maxwidth}
                \begin{minipage}[t][2\baselineskip][t]{\titleBoxLen}
                	\zihao{3}
                    \begin{center}\BLCUThesis@entitle\end{center}
                \end{minipage}
                
                \makebox[\maxwidth][s]{专业：} \underline{\makebox[\titleBoxLen][c]{\BLCUThesis@stuMajor}}
                
                \makebox[\maxwidth][s]{研究方向：} \underline{\makebox[\titleBoxLen][c]{\BLCUThesis@stuDirection}}
                
            \end{spacing}
        \end{center}
        
        \begin{center}
            \vspace*{1cm}
            \zihao{-2}
            \makebox[\linewidth][c]{北京语言大学研究生院制} 
            \makebox[4em][r]{\BLCUThesis@completeYear} 年
            \makebox[2em][r]{\BLCUThesis@completeMonth} 月
        \end{center}
        
    \end{titlepage}
    
    \cleardoublepage
}

% 制作最终版封面
\def\makeFinalCover{
    \begin{titlepage}
        
        \begin{center}
            %\vspace*{1.2\baselineskip}
            \includegraphics[width=2cm]{figures/BLCULogo.png}
            \hspace*{1cm}
            \includegraphics[width=9.8cm]{figures/BLCULogoText.png}
        \end{center}
        
        \begin{center}
            \bfseries\fzsong\zihao{-0}
            %\vspace*{1cm}
            \makebox{\ifblcu@doctor{博士}\else{硕士}\fi{研究生学位论文}}
        \end{center}
        
        \begin{center}
            \vspace*{2cm}
            \begin{spacing}{1.8}
                \bfseries\heiti\zihao{-2}
                \settowidth{\maxwidth}{题~~目：}
                \makebox[\maxwidth][s]{题目：}\underline{\makebox[\titleBoxLen][l]{}}
                
                \hspace*{\maxwidth}
                \underline{\makebox[\titleBoxLen][l]{}}
                
                \vspace*{-2\baselineskip}  % 2.78cm
                \hspace*{\maxwidth}
                \begin{minipage}[t][2\baselineskip][t]{\titleBoxLen}
                    \begin{center}\BLCUThesis@title\end{center}
                \end{minipage}
            \end{spacing}
        \end{center}
        
        \begin{center}
            \vspace*{-2\baselineskip+2cm}
            \begin{spacing}{2}
                \bfseries\zihao{3}
                \makebox[2em][s]{姓名}：\underline{\makebox[\len][c]{\BLCUThesis@stuName}}
                
                \makebox[2em][s]{国籍}：\underline{\makebox[\len][c]{\BLCUThesis@stuCountry}}
                
                \makebox[2em][s]{学号}：\underline{\makebox[\len][c]{\BLCUThesis@stuID}}
                
                \makebox[2em][s]{院系}：\underline{\makebox[\len][c]{\BLCUThesis@stuCollege}}
                
                \makebox[2em][s]{专业}：\underline{\makebox[\len][c]{\BLCUThesis@stuMajor}}
                
                \makebox[2em][s]{导师}：\underline{\makebox[\len][c]{\BLCUThesis@supervisorName}}
            \end{spacing}
        \end{center}
        
        \begin{center}
            \vspace*{1cm}
            \bfseries\zihao{4}
            \makebox[4em][r]{\BLCUThesis@completeYear} 年
            \makebox[2em][r]{\BLCUThesis@completeMonth} 月
        \end{center}
        
    \end{titlepage}
    \cleardoublepage
}

\newcommand{\makecover}{\makeReviewCover}
\ifblcu@final
    \renewcommand{\makecover}{\makeFinalCover}
\fi

\def \makeIntegrityStatement {
    \begin{titlepage}
        \setlength{\leftskip}{1.6em}
        \setlength{\rightskip}{1.6em}
        \zihao{-3}
        \begin{center}
            %\vspace*{1.2\baselineskip}
            \includegraphics[width=2cm]{figures/BLCULogo.png}
            \includegraphics[width=9.5cm]{figures/BLCULogoTextZhEn.png}
        \end{center}
        
        \begin{center}
            \zihao{-2}
            论文原创性声明
        \end{center}
        
        本人郑重声明：所呈交的论文，是本人在导师指导下，独立进行的研究工作及取得的研究成果。尽我所知，除了文中已经注明引用和致谢的地方外，论文中不包含其他人或集体已经发表或撰写的研究成果，也不包含为获得北京语言大学或其他教育机构的学位或证书所使用过的材料。对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。本人完全意识到本声明的法律结果由本人承担。
        
        \begin{spacing}{2}
            \zihao{-3}
            \makebox[0.85\linewidth][r]{\makebox[4em][s]{签名}：\underline{\makebox[3cm][c]{
                        \includegraphics[height=1cm]{\BLCUThesis@integrityStatement@author}
            }}}
            
            \makebox[0.85\linewidth][r]{\makebox[4em][s]{日期}：\underline{\makebox[3cm][c]{
                        \BLCUThesis@integrityStatement@year{.}\BLCUThesis@integrityStatement@month{.}\BLCUThesis@integrityStatement@day
            }}}
        \end{spacing}
        
        \vspace*{0.5cm}
        
        \begin{center}
            \zihao{-2}
            学位论文知识产权权属声明
        \end{center}
        
        本人郑重声明：本人所呈交论文，是在导师指导下所完成的，论文知识产权归属北京语言大学。学校有权保留并向国家有关部门或机构送交论文的复印件和电子版本，允许论文被查询和借阅，将论文编入有关数据库进行检索等。本人离校后发表或使用学位论文或与该论文直接相关的学术论文获成果时，署名仍为北京语言大学。
        
        \begin{spacing}{2}
            \zihao{-3}
            \makebox[0.85\linewidth][r]{\makebox[4em][s]{签名}：\underline{\makebox[3cm][c]{
                        \includegraphics[height=1cm]{\BLCUThesis@integrityStatement@author}
            }}}
            
            \makebox[0.85\linewidth][r]{\makebox[4em][s]{导师签名}：\underline{\makebox[3cm][c]{
                        \includegraphics[height=1cm]{\BLCUThesis@integrityStatement@supervisor}
            }}}
            
            \makebox[0.85\linewidth][r]{\makebox[4em][s]{日期}：\underline{\makebox[3cm][c]{
                        \BLCUThesis@integrityStatement@year{.}\BLCUThesis@integrityStatement@month{.}\BLCUThesis@integrityStatement@day
            }}}
        \end{spacing}
        
    \end{titlepage}
    \cleardoublepage
}

% 制作中英文摘要的环境及命令 
\newcommand\keywords[1]{\ \\{\heiti\zihao{4}关键词：}{#1}}  % 黑体四号
\WithSuffix\newcommand\keywords*[1]{\ \\{\bfseries\zihao{4}Key words: }{#1}}  % 四号加粗
\renewenvironment{abstract}{%
    \begin{center}
        \heiti
        \vspace*{\baselineskip}
        
        \zihao{3} \BLCUThesis@abstract@title		
        
        \vspace*{\baselineskip}
        
        \makebox[4em]{摘\quad 要}
        
        \vspace*{\baselineskip}
    \end{center}
    \par
}{%
    \cleardoublepage
}

\newenvironment{abstract*}{%
    \begin{center}
        \vspace*{\baselineskip}
        
        \bfseries\heiti\zihao{3} \BLCUThesis@abstract@entitle
        
        \vspace*{\baselineskip}
        
        \bfseries\zihao{-3}ABSTRACT \\\ \\
    \end{center}
}{%
    \cleardoublepage
}

% 制作目录的命令
\newcommand{\makecontents}{%
    \pdfbookmark[1]{目录}{contents}  % 将目录添加到pdf书签
    \renewcommand\contentsname{\heiti\zihao{3}目\hspace{2em}录}  % 设置目录字样
    %%	\renewcommand\cftsecfont{\heiti}
    \renewcommand\cftchapleader{\cftdotfill{\cftdotsep}}  % 
    \tableofcontents
    \cleardoublepage
}