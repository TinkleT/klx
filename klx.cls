%% This is file 'klx.cls',
%% Used for klx latex render.

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{klx}[2016/06/28 v0.1 test]
%\LoadClass{article}
\LoadClass[10pt]{standalone}
%\RequirePackage[paperwidth=195mm,paperheight=270mm,left=8mm,right=12mm,top=16mm,bottom=4mm,includefoot]{geometry}
\pagestyle{empty}
\RequirePackage{xeCJK}
\RequirePackage{varwidth,calc}
\RequirePackage{amsmath, amssymb, yhmath}
\RequirePackage{graphicx}
\RequirePackage[version=4]{mhchem}
\RequirePackage{pifont, picinpar}
\RequirePackage{ifthen,CJKnumb,mdwlist,enumerate,wrapfig}
\RequirePackage{newunicodechar}
\setCJKmainfont{STSong}
\linespread{1.2}
\setlength{\fboxsep}{0pt}
\setlength{\fboxrule}{0pt}
\newlength{\optlength}
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
\newlength{\opttatolheight}
\newlength{\desctatolheight}
\newlength{\heightdiff}
\newlength{\comlength}
\newsavebox{\descbox}
\newsavebox{\optbox}
\newsavebox{\combox}
\setlength{\comlength}{0pt}
\setlength{\heightdiff}{0pt}
\setlength{\optwidth}{\textwidth}
\setlength{\optlength}{\textwidth}
\newcommand{\dq}{\mbox{(\qquad)}}
\newcommand{\dd}{\mbox{\rule[-.2ex]{4em}{.5pt}}}
\newcommand{\fourch}[4]
{~\newline \begin{tabular}{*{4} {@{} p{0.23\optwidth}}} A. #1 & B. #2 & C. #3 & D. #4 \end{tabular}}
\newcommand{\twoch}[4]
{~\newline \begin{tabular}{*{2} {@{} p{0.46\optwidth}}} A. #1 & B. #2\\ \end{tabular}
\begin{tabular}{*{2} {@{} p{0.46\optwidth}}}C. #3 & D. #4 \end{tabular}}
\newcommand{\onech}[4]{ ~\newline  A. #1 \\ B. #2 \\ C. #3 \\ D. #4}
%\newcommand{\imgch}[4]{
% \begin{tabular}{cccc}  \fbox{#1} &  \fbox{#2} & \fbox{#3} &  \fbox{#4} \\ A & B & C & D \end{tabular}}
\newlength{\cha}
\newlength{\chb}
\newlength{\chc}
\newlength{\chd}
\newlength{\che}
\newlength{\maxw}
\newcommand{\imgch}[8]{
    \settowidth{\cha}{#1}
    \settowidth{\chb}{#3}
    \settowidth{\chc}{#5}
    \settowidth{\chd}{#7}
    \addtolength{\cha}{\chb}
    \addtolength{\cha}{\chd}
    \addtolength{\cha}{\chc}
    \ifthenelse{\lengthtest{\cha = 0mm}}
    {%then no text in img_opts
     
    \hspace*{-1em}\begin{tabular}{cccc}  
    \fbox{#2} &  \fbox{#4} & \fbox{#6} &  \fbox{#8} \\
    A & B & C & D 
    \end{tabular}
    }
    {%else some text in img_opts
     
    \hspace*{-1em}\begin{tabular}{*{4} {@{} p{0.23\optwidth}}c}
    \centering #2 & \centering #4 & \centering #6 & \centering #8 &\\
    \parbox{0.23\optwidth}{ \centering #1} & \parbox{0.23\optwidth}{\centering #3} & \parbox{0.23\optwidth}{\centering #5} &  \parbox{0.23\optwidth}{\centering #7} & \\
    \centering A & \centering B & \centering C & \centering D   &\\
    \end{tabular}
    }
    }
\setlength{\parindent}{0em}
\setlength{\parskip}{1em}
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
\newcommand{\trech}[6]{
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
\newcommand{\fivch}[9]{
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
    \stepcounter{nq}
    \thenq.\hspace{.6em}}
%\newcommand{\wqq}{\stepcounter{nqq}\item[(\thenqq)]}
\newcommand{\wqq}{\stepcounter{nqq}\item[(\thenqq)]}
\newcommand{\wqqq}{\stepcounter{nqqq}\item[(\roman{nqqq})]}
\newcommand{\wns}{\stepcounter{ns}\CJKnumber{\thens}、}
\newcommand{\ws}[2]{\begin{minipage}[t]{\textwidth} {\heiti \wns #1 } #2 \end{minipage} }
\newlength{\indexlength}
\newlength{\contentlength}
\newlength{\subcontentlength}
\setlength{\indexlength}{1.5em}
\setlength{\contentlength}{\textwidth}
\setlength{\subcontentlength}{\textwidth}
\addtolength{\contentlength}{-1em}
\addtolength{\subcontentlength}{-3em}
\newenvironment{questions}{% env for each item
\stepcounter{nq}
}{}
%\newenvironment{subquestions}{%
%\begin{minipage}[t]{\indexlength}\wqq\end{minipage}\begin{minipage}[t]{\subcontentlength}
%}{%
%\end{minipage}\\
%} 
\newenvironment{subquestions}{\begin{enumerate*}}{\end{enumerate*}}
\newenvironment{subsubquestions}{
%\vspace*{-0.4em}
\begin{enumerate*}}{\end{enumerate*}}
\renewcommand{\cong}{\text{\raisebox{-0.2em}{\includegraphics[height=1em]{../imgs/U+224C.pdf}}}}
\renewcommand{\parallel}{\text{\raisebox{-0.2em}{\includegraphics[height=1em]{../imgs/U+2225.pdf}}}}
\newcommand{\phrm}[1]{{\rm{#1}}}
\newunicodechar{Ⅳ}{\text{$\mathrm{IV}$}}

%\AtEndOfClass{
%\standaloneconfig{border={0pt 0pt 0pt 0pt}}% used for multi-items test
\standaloneenv{questions}% used for multi-items test
%}
\catcode`\^^M=10% ignore space lines 
\newcommand{\klxitem}[4]{
\begin{varwidth}{#4}
\settoheight{\imgheight}{ #3 }
\settowidth{\imgwidth}{ #3 }
\addtolength{\optwidth}{-1\imgwidth}
\savebox{\descbox}{\parbox[t]{\optwidth}{ #1 }}
\savebox{\optbox}{\parbox[t]{\optwidth}{ #1   #2 }}
\settoheight{\descheight}{\usebox{\descbox}}
\settodepth{\descdepth}{\usebox{\descbox}}
\setlength{\desctatolheight}{\descheight}
\addtolength{\desctatolheight}{\descdepth}
\settoheight{\optheight}{\usebox{\optbox}}
\settodepth{\optdepth}{\usebox{\optbox}}
\setlength{\opttatolheight}{\optheight}
\addtolength{\opttatolheight}{\optdepth}
\addtolength{\heightdiff}{\imgheight}
\addtolength{\heightdiff}{-1\opttatolheight}
\showthe\optwidth
\showthe\imgwidth
\showthe\textwidth
\showthe\descheight
\showthe\descdepth
\ifthenelse{\lengthtest{\heightdiff > 0pt}}{\setlength{\comlength}{\heightdiff}}{}
\savebox{\combox}{\parbox[t]{\optwidth}{ #1   #2  \vspace*{\comlength} }}
\begin{window}[0,r,{#3},{}]
\ifthenelse{\lengthtest{\desctatolheight > \imgheight}}{
\setlength{\optwidth}{\textwidth}#1 #2 }{
% else
\ifthenelse{\lengthtest{\opttatolheight > \imgheight}}{\usebox{\optbox}}{\usebox{\combox}}}
\end{window}
\end{varwidth}}