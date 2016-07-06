%% This is file 'klx.cls',
%% Used for klx latex render.

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{klx}[2016/06/28 v0.1 test]
\LoadClass{article}
%\RequirePackage[paperwidth=195mm,paperheight=270mm,left=8mm,right=12mm,top=16mm,bottom=4mm,includefoot]{geometry}
\RequirePackage[paperwidth=195mm,paperheight=270mm,left=0mm,right=0mm,top=0mm,bottom=0mm,includefoot]{geometry} % test for standalone
\pagestyle{empty}
\RequirePackage{xeCJK}
\RequirePackage{varwidth,calc}
\RequirePackage{amsmath, amssymb, yhmath}
\RequirePackage{graphicx}
\RequirePackage{pifont,arcs,picinpar}
\RequirePackage{ifthen,CJKnumb,mdwlist,enumerate,wrapfig}
\linespread{1.3}
\setlength{\fboxsep}{0pt}
\setlength{\fboxrule}{0pt}
\newcommand{\dq}{\mbox{(\qquad)}}
\newcommand{\dd}{\mbox{\rule[-.2ex]{4em}{.5pt}}}
\newcommand{\fourch}[4]
{\newline \begin{tabular}{*{4} {@{} p{0.25\textwidth}}} A. #1 & B. #2 & C. #3 & D. #4 \end{tabular}}
\newcommand{\twoch}[4]
{\newline \begin{tabular}{*{2} {@{} p{0.5\textwidth}}} A. #1 & B. #2\\ \end{tabular}
\begin{tabular}{*{2} {@{} p{0.5\textwidth}}}C. #3 & D. #4 \end{tabular}}
\newcommand{\onech}[4]{\newline  A. #1 \\ B. #2 \\ C. #3 \\ D. #4}
%\newcommand{\imgch}[4]{
%\newline \begin{tabular}{cccc}  \fbox{#1} &  \fbox{#2} & \fbox{#3} &  \fbox{#4} \\ A & B & C & D \end{tabular}}
\newlength{\cha}
\newlength{\chb}
\newlength{\chc}
\newlength{\chd}
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
    \newline 
    \begin{tabular}{cccc}  
    \fbox{#2} &  \fbox{#4} & \fbox{#6} &  \fbox{#8} \\
    A & B & C & D 
    \end{tabular}
    }
    {%else some text in img_opts
    \newline 
    \begin{tabular}{*{4} {@{} p{0.24\textwidth}}c}
    \centering #2 & \centering #4 & \centering #6 & \centering #8 &\\
    \parbox{0.23\textwidth}{ \centering #1} & \parbox{0.23\textwidth}{\centering #3} & \parbox{0.23\textwidth}{\centering #5} &  \parbox{0.23\textwidth}{\centering #7} & \\
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
    \ifthenelse{\lengthtest{\maxw > 0.48\textwidth}}
    {\onech{#1}{#3}{#5}{#7}}
    {\ifthenelse{\lengthtest{\maxw >0.24\textwidth}}{\twoch{#1}{#3}{#5}{#7}}{\fourch{#1}{#3}{#5}{#7}}}}
\newcounter{ns}
\newcounter{nq}
\newcounter{nqq}[nq]
\newcounter{nqqq}[nqq]
\newcommand{\wq}{
    \stepcounter{nq}
    \thenq.\hspace{.6em}}
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
\newenvironment{question}{%
    \begin{minipage}[t]{\indexlength}\wq\end{minipage}\begin{minipage}[t]{\contentlength}
    }{%
    \end{minipage}\par
    }
\newenvironment{subquestions}{\begin{enumerate*}}{\end{enumerate*}}
\newenvironment{subsubquestions}{\begin{enumerate*}}{\end{enumerate*}}
\renewcommand{\cong}{\text{\raisebox{-0.2em}{\includegraphics[height=1em]{../imgs/U+224C.pdf}}}}
\renewcommand{\parallel}{\text{\raisebox{-0.2em}{\includegraphics[height=1em]{../imgs/U+2225.pdf}}}}