%% This is file 'klx.cls',
%% Used for klx latex render.

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{klx}[2016/06/28 v0.1 test]
%\LoadClass{article}
\LoadClass[10pt]{standalone}
\standaloneconfig{multi={questions}}
%\RequirePackage[paperwidth=195mm,paperheight=270mm,left=8mm,right=12mm,top=16mm,bottom=4mm,includefoot]{geometry}
\pagestyle{empty}
\RequirePackage[CJKmath=true]{xeCJK}
\RequirePackage{varwidth,calc}
\RequirePackage{amsmath, amssymb, yhmath}
\RequirePackage{graphicx,ulem}
\RequirePackage{mathrsfs}
\RequirePackage[version=4]{mhchem}
\RequirePackage{pifont, picinpar}
\RequirePackage{ifthen,CJKnumb,mdwlist,enumerate,wrapfig}
\RequirePackage{newunicodechar}
\RequirePackage{newtxmath}
\graphicspath{{/Users/zhangyingjie/var/data/img/}}

%\setCJKmainfont{Simsun}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                  %
%   redefine some symbols for Chinese math style   %
%                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\catcode`\^^M=10 % treat return as space

\newunicodechar{Ⅰ}{\text{$\mathrm{I}$}}
\newunicodechar{Ⅱ}{\text{$\mathrm{II}$}}
\newunicodechar{Ⅲ}{\text{$\mathrm{III}$}}
\newunicodechar{Ⅳ}{\text{$\mathrm{IV}$}}
\newunicodechar{Ⅴ}{\text{$\mathrm{V}$}}
\newunicodechar{Ⅵ}{\text{$\mathrm{VI}$}}
\newunicodechar{Ⅶ}{\text{$\mathrm{VII}$}}
\newunicodechar{Ⅷ}{\text{$\mathrm{VIII}$}}
\newunicodechar{Ⅸ}{\text{$\mathrm{IX}$}}
\newunicodechar{Ⅹ}{\text{$\mathrm{X}$}}
\newunicodechar{①}{\text{\ding{172}}}
\newunicodechar{②}{\text{\ding{173}}}
\newunicodechar{③}{\text{\ding{174}}}
\newunicodechar{④}{\text{\ding{175}}}
\newunicodechar{⑤}{\text{\ding{176}}}
\newunicodechar{⑥}{\text{\ding{177}}}
\newunicodechar{⑦}{\text{\ding{178}}}
\newunicodechar{⑧}{\text{\ding{179}}}
\newunicodechar{⑨}{\text{\ding{180}}}
\newunicodechar{⑩}{\text{\ding{181}}}
\newunicodechar{∴}{\text{\raisebox{0.15em}{$\therefore$}}}
\newunicodechar{∵}{\text{\raisebox{0.15em}{$\because$}}}
\newunicodechar{∃}{\text{$\exists$}}
\newunicodechar{∀}{\text{$\forall$}}
\DeclareMathSizes{10}{10}{5}{5}% Font Size{text}{math}{script}{scriptscript}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                  %
%         fix some math formula appearance         %
%                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% dfrac appearance
\newlength{\fracsep}
\setlength{\fracsep}{.15em}
\def\dfrac#1#2{
    \genfrac{}{}{}0{
        \raisebox{-0.15em}{\hspace*{\fracsep}$#1$\hspace*{\fracsep}}% extra math switch for raisebox
    }{
        \hspace*{\fracsep}#2\hspace*{\fracsep}
    }
}
% cong, sim, parallel appearance
\renewcommand{\cong}{
    \text{\raisebox{-0.2em}{\includegraphics[height=1em]{U+224C.pdf}}}
}
\renewcommand{\parallel}{
    \text{\raisebox{-0.2em}{\includegraphics[height=1em]{U+2225.pdf}}}
}
\renewcommand{\backsim}{
    \text{\raisebox{-0.2em}{\includegraphics[height=1.2em]{U+223D.pdf}}}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                  %
%             item & paper structure               %
%                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\linespread{1.2}
\setlength{\fboxsep}{0pt}
\setlength{\fboxrule}{1pt}
\setlength{\parindent}{0em}
\setlength{\parskip}{0em}
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
\newlength{\choicewidth}
\newlength{\idxsep}
\setlength{\idxsep}{.3em}
\newlength{\imgsep}
\setlength{\imgsep}{.4em}
\newsavebox{\descbox}
\newsavebox{\optbox}
\newsavebox{\combox}
\setlength{\comlength}{0pt}
\setlength{\heightdiff}{0pt}
\newlength{\displayimageswidth}
\newcommand{\dq}{\mbox{(\qquad)}}
\newcommand{\dd}{\mbox{\rule[-.2ex]{4em}{.5pt}}}
\newcommand{\displayimages}[1]{%
    \settowidth{\displayimageswidth}{#1}%
    \ifthenelse{\lengthtest{\displayimageswidth > \textwidth}}%
    {\setlength{\displayimageswidth}{\textwidth}}%
    {}%
    \resizebox{\displayimageswidth}{!}{#1}}
\newcommand{\fourch}[4]% 四个选项一行
{\begin{tabular}{*{4} {@{} p{0.248\optwidth}}} A. #1 & B. #2 & C. #3 & D. #4\end{tabular}}
\newcommand{\twoch}[4]% 两个选项一行
{\begin{tabular}{*{2} {@{} p{0.46\optwidth}}} A. #1 & B. #2 \end{tabular}
\begin{tabular}{*{2} {@{} p{0.46\optwidth}}}C. #3 & D. #4 \end{tabular}}
\newcommand{\onech}[4]{  A. #1 \\ B. #2 \\ C. #3 \\ D. #4}
%\newcommand{\imgch}[4]{
% \begin{tabular}{cccc}  \fbox{#1} &  \fbox{#2} & \fbox{#3} &  \fbox{#4} \\ A & B & C & D \end{tabular}}
\newlength{\cha}
\newlength{\chb}
\newlength{\chc}
\newlength{\chd}
\newlength{\che}
\newlength{\maxw}
\newlength{\choicedimen}
\newcommand{\choiceimg}[1]{%
    \settowidth{\imgwidth}{#1}%
    \settototalheight{\imgheight}{#1}%
    \setlength{\choicedimen}{0.22\optwidth}%
    \ifthenelse{%
        \lengthtest{\imgwidth < \choicedimen} \and \lengthtest{\imgheight < \choicedimen}%
    }{#1}{\ifthenelse{\lengthtest{\imgwidth > \imgheight}}{\resizebox{\choicedimen}{!}{#1}}{\resizebox{!}{\choicedimen}{#1}}
    }   
}
\newcommand{\imgch}[8]{\def\arraystretch{0.4}%
    \settowidth{\cha}{#1}
    \settowidth{\chb}{#3}
    \settowidth{\chc}{#5}
    \settowidth{\chd}{#7}
    \addtolength{\cha}{\chb}%
    \addtolength{\cha}{\chd}%
    \addtolength{\cha}{\chc}%
    \ifthenelse{\lengthtest{\cha = 0mm}}
    {\tabcolsep=0pt \centering%then no text in img_opts 
    \begin{tabular}{*{4} {@{} |p{0.248\optwidth}|}}  
    \centering \choiceimg{#2}&\centering \choiceimg{#4}&\centering \choiceimg{#6}&\centering \choiceimg{#8}\tabularnewline%
    \centering A &\centering B &\centering C &\centering D%
    \end{tabular}}%
    {%
    \hspace*{-0.5em}\begin{tabular}{*{4} {@{} p{0.23\optwidth}}c}
    \centering #2 & \centering #4 & \centering #6 & \centering #8 &\\
    \parbox{0.23\optwidth}{ \centering #1} & \parbox{0.23\optwidth}{\centering #3} & \parbox{0.23\optwidth}{\centering #5} &  \parbox{0.23\optwidth}{\centering #7} & \\
    \centering A & \centering B & \centering C & \centering D   &\\
    \end{tabular}
    }
}

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
\newlength{\contl}
\newlength{\sbcontl}
\newlength{\ssbcontl}
\setlength{\indexlength}{1.5em}
\setlength{\contl}{\textwidth}
\setlength{\sbcontl}{\textwidth}
\addtolength{\contl}{-1em}
\addtolength{\sbcontl}{-3em}
\newenvironment{questions}{}{}% for multi-pages
%\newenvironment{subquestions}{%
%\begin{minipage}[t]{\indexlength}\wqq\end{minipage}\begin{minipage}[t]{\sbcontl}
%}{%
%\end{minipage}\\
%} 
\newenvironment{subquestions}{\begin{enumerate*}}{\end{enumerate*}}
\newenvironment{subsubquestions}{%
%\vspace*{-0.4em}
\begin{enumerate*}}{\end{enumerate*}}
\newsavebox{\Choice}
\newlength{\ChoiceWidth}
\newlength{\ChoiceHeight}
\newcommand{\klxchoice}[1]{%
    \savebox{\Choice}{#1}%
    \settowidth{\ChoiceWidth}{\Choice}%
    \settototalheight{\ChoiceHeight}{\Choice}%
    \usebox{\Choice}%
    \showthe\ChoiceWidth\showthe\ChoiceHeight%
}
\newcommand{\klxitem}[5]{%
    \def\ItemId{#5}%
    \show\ItemId
    \begin{questions}%
    \stepcounter{nq}%
    \begin{varwidth}{#4}%
    \settowidth{\choicewidth}{#2}%
    \ifthenelse{\lengthtest{\choicewidth=0pt}}{}{\def\dd{\mbox{(\qquad)}}}%
%    \showthe\textwidth
    \setlength{\optwidth}{\textwidth}%
    \settoheight{\imgheight}{#3}%
    \settowidth{\imgwidth}{#3}%
    \ifthenelse{\lengthtest{\imgheight=0pt}}{\setlength{\imgwidth}{0pt}}{\addtolength{\optwidth}{-1\imgwidth}}%
%    \showthe\optwidth
%    \showthe\textwidth%
    \savebox{\descbox}{\parbox[t]{\optwidth}{\def\stepcounter{\relax}#1}}%
    \savebox{\optbox}{\parbox[t]{\optwidth}{\def\stepcounter{\relax}#1#2}}%
    \settoheight{\descheight}{\usebox{\descbox}}%
    \settodepth{\descdepth}{\usebox{\descbox}}%
    \setlength{\desctatolheight}{\descheight}%
    \addtolength{\desctatolheight}{\descdepth}%
    \addtolength{\desctatolheight}{3.33pt}%
    \settoheight{\optheight}{\usebox{\optbox}}%
    \settodepth{\optdepth}{\usebox{\optbox}}%
    \setlength{\opttatolheight}{\optheight}%
    \addtolength{\opttatolheight}{\optdepth}%
    \addtolength{\heightdiff}{\imgheight}%
    \addtolength{\heightdiff}{-1\opttatolheight}%
    \ifthenelse{\lengthtest{\heightdiff > 0pt}}{\setlength{\comlength}{\heightdiff}}{}%
    \savebox{\combox}{\parbox[t]{\optwidth}{\def\stepcounter{\relax}#1#2\vspace*{\comlength}}}%
    \ifthenelse{\lengthtest{\imgheight = 0pt}}%
        {\parbox[t]{\optwidth}{#1}#2}%
        {\begin{window}[0,r,{#3},{}]
        \ifthenelse{\lengthtest{\desctatolheight > \imgheight}}%
            {% then
            #1\end{window}\setlength{\optwidth}{\textwidth}#2}%
            {% else
            \ifthenelse{\lengthtest{\opttatolheight > \imgheight}}%
                %{\usebox{\optbox}}
                {\parbox[t]{\optwidth}{#1#2}}%
                {\parbox[t]{\optwidth}{#1#2\vspace*{\comlength}}}%
                \end{window}%
            }%
        }%
%    \showthe\optwidth
%    \showthe\imgwidth
%    \showthe\textwidth
%    \showthe\descheight
%    \showthe\descdepth
%    \showthe\imgheight
%    \showthe\opttatolheight
%    \showthe\comlength
    \end{varwidth}%
    \settowidth{\ChoiceWidth}{\usebox{\Choice}}%
    \settototalheight{\ChoiceHeight}{\usebox{\Choice}}%
    \showthe\ChoiceWidth%
    \showthe\ChoiceHeight%
    \showthe\value{page}%
    \end{questions}%
}
\def\qssep{\hrule height0pt\vspace*{3pt}}   
\newcommand{\klxqs}[2]{%
    \stepcounter{nqq}
    \setlength{\contl}{\optwidth}
    \settowidth{\imgwidth}{#1}
    \ifthenelse{\lengthtest{\imgwidth=0pt}}{}{
        \addtolength{\imgwidth}{\imgsep}
    }
    \setlength{\sbcontl}{\contl}
    \addtolength{\sbcontl}{-\imgwidth}
    \addtolength{\sbcontl}{-\imgsep}
    \addtolength{\sbcontl}{-\indexlength}
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
}   
\newcommand{\klxqss}[2]{%
    \stepcounter{nqqq}
    \settowidth{\imgwidth}{#1}
    \ifthenelse{\lengthtest{\imgwidth=0pt}}{}{
        \addtolength{\imgwidth}{\imgsep}
    }
    \setlength{\ssbcontl}{\sbcontl}
    \addtolength{\ssbcontl}{-\imgwidth}
    \addtolength{\ssbcontl}{-\indexlength}
    \begin{minipage}[t]{\indexlength-0.5em}
    \hfill \roman{nqqq}
    \end{minipage}\hspace*{\idxsep}
    \begin{minipage}[t]{\ssbcontl}
    #2
    \end{minipage}%
}
