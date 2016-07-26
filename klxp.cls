%% This is file 'klxp.cls',
%% Used for klx latex render. Typically for math paper render

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{klxp}[2016/06/28 v0.1 test]
\LoadClass{article}
\RequirePackage[paperwidth=195mm,paperheight=270mm,left=8mm,right=12mm,top=16mm,bottom=4mm,includefoot]{geometry}

\RequirePackage[CJKmath=true]{xeCJK}
\RequirePackage{varwidth,calc}
\RequirePackage{amsmath, amssymb, yhmath}
\RequirePackage{graphicx,ulem}
\RequirePackage{mathrsfs}
\RequirePackage[version=4]{mhchem}
\RequirePackage{pifont, picinpar, picins, fancyhdr,lastpage}
\pagestyle{fancy}
\RequirePackage{ifthen,CJKnumb,mdwlist,enumerate,wrapfig}
\RequirePackage{newunicodechar}
\graphicspath{{/Users/zhangyingjie/var/data/img/}}
\setCJKmainfont{STSong}
\catcode`\^^M=10 % treat return as space
\linespread{1.2}
\setlength{\fboxsep}{0pt}
\setlength{\fboxrule}{0pt}
\newlength{\imglength}
\newlength{\imgwidth}
\newlength{\imgheight}
\newlength{\imgdepth}
\newlength{\optwidth}
\newlength{\optheight}
\newlength{\descheight}
\newlength{\restheight}
\newlength{\optdepth}
\newlength{\descdepth}
\newlength{\opttotalheight}
\newlength{\desctotalheight}
\newlength{\heightdiff}
\newlength{\comlength}
\newlength{\itemtotalheight}
\newlength{\idxcorheight}
\newlength{\idxsep}
\newlength{\imgsep}
\newlength{\twidth}
\newsavebox{\descbox}
\newsavebox{\optbox}
\newsavebox{\combox}
\setlength{\comlength}{0pt}
\setlength{\heightdiff}{0pt}
\setlength{\idxsep}{.3em} % sep between idx and content
\setlength{\imgsep}{.4em} % sep between content and img
\setlength{\optwidth}{\textwidth}
\newcommand{\dq}{\mbox{(\qquad)}}
\newcommand{\dd}{\mbox{\ \rule[-.25ex]{4em}{.5pt}}}
\newcommand{\fourch}[4]% 四个选项一行
{\par \begin{tabular}{*{4} {@{} p{0.23\optwidth}}} A. #1 & B. #2 & C. #3 & D. #4 \end{tabular}}
\newcommand{\twoch}[4]% 两个选项一行
{\par \begin{tabular}{*{2} {@{} p{0.46\optwidth}}} A. #1 & B. #2 \end{tabular}
\begin{tabular}{*{2} {@{} p{0.46\optwidth}}}C. #3 & D. #4 \end{tabular}}
\newcommand{\onech}[4]{\par A. #1 \\ B. #2 \\ C. #3 \\ D. #4}
%\newcommand{\imgch}[4]{
% \begin{tabular}{cccc}  \fbox{#1} &  \fbox{#2} & \fbox{#3} &  \fbox{#4} \\ A & B & C & D \end{tabular}}
\newlength{\cha}
\newlength{\chb}
\newlength{\chc}
\newlength{\chd}
\newlength{\che}
\newlength{\maxw}
\newcommand{\imgch}[8]{
    \par
    \settowidth{\cha}{#1}
    \settowidth{\chb}{#3}
    \settowidth{\chc}{#5}
    \settowidth{\chd}{#7}
    \addtolength{\cha}{\chb}
    \addtolength{\cha}{\chd}
    \addtolength{\cha}{\chc}
    \ifthenelse{\lengthtest{\cha = 0mm}}
    {%then no text in img_opts 

    \hspace*{-5pt}\begin{tabular}{cccc}  
    \fbox{#2} &  \fbox{#4} & \fbox{#6} &  \fbox{#8} \\
    A & B & C & D 
    \end{tabular}
    }
    {%else some text in img_opts

    \hspace*{-0.5em}\begin{tabular}{*{4} {@{} p{0.23\optwidth}}c}
    \centering #2 & \centering #4 & \centering #6 & \centering #8 &\\
    \parbox{0.23\optwidth}{ \centering #1} & \parbox{0.23\optwidth}{\centering #3} & \parbox{0.23\optwidth}{\centering #5} &  \parbox{0.23\optwidth}{\centering #7} & \\
    \centering A & \centering B & \centering C & \centering D   &\\
    \end{tabular}
    }
}
\setlength{\parindent}{0em}
\setlength{\parskip}{5pt}
\newcommand{\ch}[8]{
    \settowidth{\cha}{A. #1}
    \settowidth{\chb}{B. #3}
    \settowidth{\chc}{C. #5}
    \settowidth{\chd}{D. #7}\setlength{\maxw}{\cha}
    \ifthenelse{\lengthtest{\chb > \maxw}}{\setlength{\maxw}{\chb}}{}
    \ifthenelse{\lengthtest{\chc > \maxw}}{\setlength{\maxw}{\chc}}{}
    \ifthenelse{\lengthtest{\chd > \maxw}}{\setlength{\maxw}{\chd}}{}
    \ifthenelse{\lengthtest{\maxw > 0.46\optwidth}}
    {\onech{#1}{#3}{#5}{#7}}
    {\ifthenelse{\lengthtest{\maxw >0.23\optwidth}}{\twoch{#1}{#3}{#5}{#7}}{\fourch{#1}{#3}{#5}{#7}}}
}
\newcommand{\trech}[6]{% 三个选项的选择题
    \par
    \settowidth{\cha}{A. #1}
    \settowidth{\chb}{B. #3}
    \settowidth{\chc}{C. #5}
    \setlength{\maxw}{\cha}
    \ifthenelse{\lengthtest{\chb > \maxw}}{\setlength{\maxw}{\chb}}{}
    \ifthenelse{\lengthtest{\chc > \maxw}}{\setlength{\maxw}{\chc}}{}
    \ifthenelse{\lengthtest{\maxw > 0.31\optwidth}}{% then 
           A. #1 \\ B. #3 \\ C. #5 }{% else three opts in one line
         \begin{tabular}{*{3} {@{} p{0.33\optwidth}}}A. #1 & B. #3 & C. #5 \end{tabular}
        }
}
\newcommand{\fivch}[9]{% 五个选项的选择题
    \par
    \settowidth{\cha}{A. #1}
    \settowidth{\chb}{B. #3}
    \settowidth{\chc}{C. #5}
    \settowidth{\chd}{D. #7}
    \settowidth{\che}{E. #9}
    \setlength{\maxw}{\cha}
    \ifthenelse{\lengthtest{\chb > \maxw}}{\setlength{\maxw}{\chb}}{}
    \ifthenelse{\lengthtest{\chc > \maxw}}{\setlength{\maxw}{\chc}}{}
    \ifthenelse{\lengthtest{\chd > \maxw}}{\setlength{\maxw}{\chd}}{}
    \ifthenelse{\lengthtest{\che > \maxw}}{\setlength{\maxw}{\che}}{}
    \ifthenelse{\lengthtest{\maxw > 0.19\optwidth}}{% then 
         A. #1 \\ B. #3 \\ C. #5 \\ D. #7 \\ E. #9}{% else 
         \begin{tabular}{*{5} {@{} p{0.19\optwidth}}} A. #1 & B. #3 & C. #5 & D. #7 & E. #9 \end{tabular}
        }
}

\newcounter{ns}
\newcounter{nq}
\newcounter{nqq}[nq]
\newcounter{nqqq}[nqq]
\newcommand{\wq}{ 
    %\stepcounter{nq}
    \thenq.\hspace{.6em}}
%\newcommand{\wqq}{\stepcounter{nqq}\item[(\thenqq)]}
\newcommand{\wqq}{
    \stepcounter{nqq}
    \item[(\thenqq)]%
}
\newcommand{\wqqq}{\stepcounter{nqqq}\item[(\roman{nqqq})]}
\newcommand{\wns}[1]{\stepcounter{ns}{\bf \CJKnumber{\thens}、#1}}
\newcommand{\ws}[2]{\begin{minipage}[t]{\textwidth} {\heiti \wns #1 } #2 \end{minipage} }
\newlength{\indexlength}
\newlength{\contl}
\newlength{\sbcontl}
\newlength{\ssbcontl}
\setlength{\indexlength}{1.5em}
\setlength{\contl}{\textwidth}
\addtolength{\contl}{-1em}
\setlength{\sbcontl}{\contl}
\addtolength{\sbcontl}{-1em}
\setlength{\ssbcontl}{\sbcontl}
\addtolength{\ssbcontl}{-1em}
\newenvironment{questions}{% env for each item
\stepcounter{nq}
}{\par}
%\newenvironment{subquestions}{%
%\begin{minipage}[t]{\indexlength}\wqq\end{minipage}\begin{minipage}[t]{\subcontentlength}
%}{%
%\end{minipage}\\
%} 
\newenvironment{subquestions}{\begin{enumerate*}}{\end{enumerate*}}
\newenvironment{subsubquestions}{
\begin{enumerate*}}{\end{enumerate*}}
\renewcommand{\cong}{\text{\raisebox{-0.2em}{\includegraphics[height=1em]{U+224C.pdf}}}}
\renewcommand{\parallel}{\text{\raisebox{-0.2em}{\includegraphics[height=1em]{U+2225.pdf}}}}
\renewcommand{\backsim}{\text{\raisebox{-0.2em}{\includegraphics[height=1.2em]{U+223D.pdf}}}}
\newcommand{\phrm}[1]{{\rm{#1}}}
\newunicodechar{Ⅳ}{\text{$\mathrm{IV}$}}
\newcommand{\klxitem}[4]{

    %\begin{varwidth}{#4}
    \setlength{\optwidth}{\textwidth}
    \settoheight{\imgheight}{#3}
    \settowidth{\imgwidth}{#3}
    \ifthenelse{\lengthtest{\imgheight = 0pt}}{\setlength{\imgwidth}{0pt}}{\addtolength{\optwidth}{-1\imgwidth}}
    \showthe\optwidth
    \showthe\textwidth
    \savebox{\descbox}{\parbox[t]{\optwidth}{#1}}
    \savebox{\optbox}{\parbox[t]{\optwidth}{
    #1 \ \\ #2
    }}
    \settoheight{\descheight}{\usebox{\descbox}}
    \settodepth{\descdepth}{\usebox{\descbox}}
    \setlength{\desctotalheight}{\descheight}
    \addtolength{\desctotalheight}{\descdepth}
    \addtolength{\desctotalheight}{3.33pt}
    \settoheight{\optheight}{\usebox{\optbox}}
    \settodepth{\optdepth}{\usebox{\optbox}}
    \setlength{\opttotalheight}{\optheight}
    \addtolength{\opttotalheight}{\optdepth}
    \addtolength{\heightdiff}{\imgheight}
    \addtolength{\heightdiff}{-1\opttotalheight}
    \ifthenelse{\lengthtest{\heightdiff > 0pt}}{\setlength{\comlength}{\heightdiff}}{}
    \savebox{\combox}{\parbox[t]{\optwidth}{#1 \ \\ #2 
    \vspace*{\comlength} 
        }
    }
    \ifthenelse{\lengthtest{\imgheight = 0pt}}{\def\idxcor{\relax}}{\setlength{\idxcorheight}{\descheight}%
    \addtolength{\idxcorheight}{0pt}%
    \def\idxcor{\vspace*{\idxcorheight}}}
    \showthe\idxcorheight
    \begin{minipage}[t]{\indexlength}
%    \hrule height-\idxcorheight depth-\idxcorheight
    %\idxcor
    \hfill \thenq. 
    \end{minipage}\hspace*{\idxsep}\begin{minipage}[t]{\contl}
    %\vspace{0pt}
   % \vspace*{-\descheight}
    \ifthenelse{\lengthtest{\imgheight = 0pt}}
        { % then
        \parbox[t]{\optwidth}{#1} #2
        }
        { % else
        %\vspace*{-.4em}
        \begin{window}[0,r,{#3},{}]
        \ifthenelse{\lengthtest{\desctotalheight > \imgheight}}
            { % then
            #1 
            \end{window} \setlength{\optwidth}{\textwidth}
             #2 }
            { % else
            \ifthenelse{\lengthtest{\opttotalheight > \imgheight}}
                {\usebox{\optbox}}
                {\usebox{\combox}}\end{window}}}
    \showthe\optwidth
    \showthe\imgwidth
    \showthe\textwidth
    \showthe\descheight
    \showthe\descdepth
    \showthe\imgheight
    \showthe\opttotalheight
    \showthe\comlength
    %\end{varwidth}
    \end{minipage}

}
\newcommand{\klxitemm}[2]{
    \settowidth{\imgwidth}{#1}
    \showthe\imgwidth
    \ifthenelse{\lengthtest{\imgwidth=0pt}}{}{
        \addtolength{\imgwidth}{\imgsep}
    }
    \addtolength{\contl}{-\imgwidth}
    \setlength{\optwidth}{\contl}
    \begin{minipage}[t]{\indexlength}
    \hfill \thenq.
%    \settowidth{\imgwidth}{#3}
    \showthe\contl

    \end{minipage}\hspace*{\idxsep}%
    \begin{minipage}[t]{\contl}
    #2
    \end{minipage}\hspace*{\imgsep}%
    \begin{minipage}[t]{\imgwidth}
    \vspace{-1em}%
    #1
    \end{minipage}
    \showthe\imgwidth
    \showthe\contl
}
\def\qssep{\hrule height0pt\vspace*{5pt}}   
\newcommand{\klxqs}[2]{\par%
    \stepcounter{nqq}
    \settowidth{\imgwidth}{#1}
    \ifthenelse{\lengthtest{\imgwidth=0pt}}{}{
        \addtolength{\imgwidth}{\imgsep}
    }
    \showthe\imgwidth
    \setlength{\sbcontl}{\contl}
    \addtolength{\sbcontl}{-\imgwidth}
    \addtolength{\sbcontl}{-\imgsep}
    \addtolength{\sbcontl}{-\indexlength}
%    \hspace*{\indexlength}
    \begin{minipage}[t]{\indexlength}
    \hfill (\thenqq)
    \end{minipage}\hspace*{\idxsep}%
    \begin{minipage}[t]{\sbcontl}
    #2
    \end{minipage}\hspace*{\imgsep}%
    \begin{minipage}[t]{\imgwidth}
    \vspace{-1em}%
    #1
    \end{minipage}
    \qssep
}   
\newcommand{\klxqss}[2]{\par%
    \stepcounter{nqqq}
    \settowidth{\imgwidth}{#1}
    \ifthenelse{\lengthtest{\imgwidth=0pt}}{}{
        \addtolength{\imgwidth}{\imgsep}
    }
    \setlength{\ssbcontl}{\sbcontl}
    \addtolength{\ssbcontl}{-\imgwidth}
    \addtolength{\ssbcontl}{-\indexlength}
    \begin{minipage}[t]{\indexlength}
    \hfill [\thenqqq]
    \end{minipage}\hspace*{\idxsep}
    \begin{minipage}[t]{\ssbcontl}
    #2
    \end{minipage}\hspace*{\imgsep}%

}
\newenvironment{displayimgs}{
    \begin{center}
        \vspace*{-0.5em}
}{
        \vspace*{-1em}
    \end{center}
}
\cfoot{第 \thepage 页，共 \pageref{LastPage} 页}