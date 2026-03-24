% 东北大学本科毕业设计（论文）中期报告 LaTeX 模板样式类
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{NEUBachelorMidterm}[2026/03/23 V1.6.3 A Bachelor Midterm Report LaTeX Template for NEU students]
\providecommand{\Version}{V1.6.3}
\LoadClass[UTF8,heading=true,12pt,a4paper,fontset=windows]{ctexart}

% ==================== 基本宏包 ====================
\RequirePackage{array}
\RequirePackage{makecell}
\RequirePackage{amsmath,amssymb}
\RequirePackage[a4paper,margin=0pt]{geometry}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{xcolor}
\RequirePackage{fontspec}
\RequirePackage{tikz}
\RequirePackage{xstring}
\RequirePackage{siunitx}
\RequirePackage[unicode,hidelinks]{hyperref}
\usetikzlibrary{calc}

% ==================== 页面设置 ====================
\pagestyle{empty}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}
\raggedbottom
\renewcommand{\arraystretch}{1.3}
\setlength{\tabcolsep}{6pt}
\newcolumntype{C}{>{\centering\arraybackslash}X}

% ==================== 颜色与字体 ====================
\definecolor{NEUMidtermLine}{RGB}{0,0,0}
\definecolor{NEUMidtermHint}{RGB}{255,102,102}

\IfFontExistsTF{方正小标宋简体}
  {\newCJKfontfamily\NEUMidtermTitleFamily{方正小标宋简体}}
  {\newCJKfontfamily\NEUMidtermTitleFamily{SimSun}[AutoFakeBold=3]}

\newcommand{\NEUMidtermTitleFont}{\NEUMidtermTitleFamily\bfseries\fontsize{18pt}{18pt}\selectfont}
\newcommand{\NEUMidtermBodyFont}{\songti\fontsize{12pt}{18pt}\selectfont}
\newcommand{\NEUMidtermSmallFont}{\songti\fontsize{10.5pt}{10.5pt}\selectfont}
\newcommand{\NEUMidtermHintFont}{\songti\fontsize{12pt}{18pt}\selectfont\color{NEUMidtermHint}}
\newcommand{\NEUMidtermSidebarLabelWidth}{52}
\newcommand{\NEUMidtermLabelStageOne}{\shortstack[c]{前一阶段\\工作总结}}
\newcommand{\NEUMidtermLabelNextStage}{\shortstack[c]{下一阶段\\工作计划}}
\newcommand{\NEUMidtermLabelIssues}{存在问题}
\newcommand{\NEUMidtermLabelOther}{\makebox[3.6em][c]{其\hspace{1.2em}它}}
\newcommand{\NEUMidtermLabelAdvisor}{\shortstack[c]{指导教师\\意见}}

\sisetup{
  inter-unit-product = \cdot,
  list-separator = {、},
  list-final-separator = {和},
  list-pair-separator = {和},
  list-units = single,
  range-units = single,
  separate-uncertainty = true
}

\makeatletter

% ==================== 标题样式（与开题报告一致） ====================
\ctexset{
  section = {
    format = \heiti\Large\selectfont,
    beforeskip = 6pt,
    afterskip = 6pt,
  },
  subsection = {
    format = \heiti\large\selectfont,
    beforeskip = 6pt,
    afterskip = 6pt,
  },
  subsubsection = {
    format = \heiti\normalsize\selectfont,
    beforeskip = 6pt,
    afterskip = 6pt,
  }
}
\setcounter{secnumdepth}{3}
\numberwithin{equation}{section}

% ==================== 信息命令 ====================
\newcommand{\@studentid}{}
\newcommand{\@studentname}{}
\newcommand{\@grade}{}
\newcommand{\@phone}{}
\newcommand{\@email}{}
\newcommand{\@internshipunit}{}
\newcommand{\@thesistitle}{}
\newcommand{\@reportyear}{}
\newcommand{\@reportmonth}{}
\newcommand{\@reportday}{}
\newcommand{\@advisorsignature}{}
\newcommand{\@advisoryear}{}
\newcommand{\@advisormonth}{}
\newcommand{\@advisorday}{}
\long\def\@stageonesummary{}
\long\def\@nextstageplan{}
\long\def\@issues{}
\long\def\@othernotes{}
\long\def\@advisoropinion{}

\newcommand{\studentid}[1]{\gdef\@studentid{#1}}
\newcommand{\studentname}[1]{\gdef\@studentname{#1}}
\newcommand{\grade}[1]{\gdef\@grade{#1}}
\newcommand{\phone}[1]{\gdef\@phone{#1}}
\newcommand{\email}[1]{\gdef\@email{#1}}
\newcommand{\internshipunit}[1]{\gdef\@internshipunit{#1}}
\newcommand{\thesistitle}[1]{\gdef\@thesistitle{#1}}
\newcommand{\reportyear}[1]{\gdef\@reportyear{#1}}
\newcommand{\reportmonth}[1]{\gdef\@reportmonth{#1}}
\newcommand{\reportday}[1]{\gdef\@reportday{#1}}
\newcommand{\advisorsignature}[1]{\gdef\@advisorsignature{#1}}
\newcommand{\advisoryear}[1]{\gdef\@advisoryear{#1}}
\newcommand{\advisormonth}[1]{\gdef\@advisormonth{#1}}
\newcommand{\advisorday}[1]{\gdef\@advisorday{#1}}
\long\def\stageonesummary#1{\gdef\@stageonesummary{#1}}
\long\def\nextstageplan#1{\gdef\@nextstageplan{#1}}
\long\def\issues#1{\gdef\@issues{#1}}
\long\def\othernotes#1{\gdef\@othernotes{#1}}
\long\def\advisoropinion#1{\gdef\@advisoropinion{#1}}

% ==================== 与开题报告一致的正文辅助命令 ====================
\newcommand{\suojin}{\hspace*{2em}}
\newcommand{\tips}[1]{{\zihao{-5}\textcolor{NEUMidtermHint}{#1}}}
\newcommand{\verbx}[1]{\texttt{\detokenize{#1}}}
\newcommand{\lb}{\texttt{\{}}
\newcommand{\rb}{\texttt{\}}}

\newcounter{NEUMidtermFigure}
\newcounter{NEUMidtermTable}

\newcommand{\tizhu}[3][5]{%
  \par\noindent
  \IfStrEq{#2}{tu}{%
    \refstepcounter{NEUMidtermFigure}%
    {\centering\zihao{#1}图\theNEUMidtermFigure\hspace{1em}#3\par}%
  }{%
    \IfStrEq{#2}{biao}{%
      \refstepcounter{NEUMidtermTable}%
      {\centering\zihao{#1}表\theNEUMidtermTable\hspace{1em}#3\par}%
    }{%
      \PackageError{NEUBachelorMidterm}{Unknown caption type: #2}{Use `tu' or `biao'.}%
    }%
  }%
}

\newlength{\NEUMidtermFigureMaxHeight}
\setlength{\NEUMidtermFigureMaxHeight}{0.26\textheight}
\newcommand{\setmidtermfiguremaxheight}[1]{%
  \setlength{\NEUMidtermFigureMaxHeight}{#1}%
}

\newcommand{\tu}[3][]{%
  \par\noindent
  \vspace{0.25em}%
  \begin{minipage}{\linewidth}
    \centering
    \includegraphics[width=#2,#1]{#3}
  \end{minipage}%
  \par
  \vspace{0.25em}%
}

\newcommand{\tuauto}[2][]{%
  \par\noindent
  \vspace{0.25em}%
  \begin{minipage}{\linewidth}
    \centering
    \includegraphics[width=\linewidth,height=\NEUMidtermFigureMaxHeight,keepaspectratio,#1]{#2}
  \end{minipage}%
  \par
  \vspace{0.25em}%
}

\newcommand{\tuxia}[5][]{%
  \par\noindent
  \begin{minipage}{\linewidth}
    \centering
    \includegraphics[width=#2,#1]{#3}\par
    \vspace{0.25em}%
    \refstepcounter{NEUMidtermFigure}%
    \edef\NEUMidterm@tempa{#5}%
    \ifx\NEUMidterm@tempa\@empty\else
      \label{#5}%
    \fi
    {\centering\zihao{5}图\theNEUMidtermFigure\hspace{1em}#4\par}%
  \end{minipage}%
  \par
  \vspace{0.05em}%
}

\newcommand{\tuxiaauto}[4][]{%
  \par\noindent
  \begin{minipage}{\linewidth}
    \centering
    \includegraphics[width=\linewidth,height=\NEUMidtermFigureMaxHeight,keepaspectratio,#1]{#2}\par
    \vspace{0.25em}%
    \refstepcounter{NEUMidtermFigure}%
    \edef\NEUMidterm@tempa{#4}%
    \ifx\NEUMidterm@tempa\@empty\else
      \label{#4}%
    \fi
    {\centering\zihao{5}图\theNEUMidtermFigure\hspace{1em}#3\par}%
  \end{minipage}%
  \par
  \vspace{0.05em}%
}

\newcommand{\biao}[2]{%
  \par\noindent
  \begin{minipage}{\linewidth}
    \vspace{0.25em}%
    \centering
    \renewcommand{\arraystretch}{1}%
    \begin{tabularx}{\linewidth}{*{#1}{>{\centering\arraybackslash}X}}
      \toprule
      #2
      \bottomrule
    \end{tabularx}
  \end{minipage}%
  \par
  \vspace{0.05em}%
}

\newcommand{\biaoX}[2]{%
  \par\noindent
  \begin{minipage}{\linewidth}
    \vspace{0.25em}%
    \centering
    \renewcommand{\arraystretch}{1}%
    \begin{tabularx}{\linewidth}{#1}
      \toprule
      #2
      \bottomrule
    \end{tabularx}
  \end{minipage}%
  \par
  \vspace{0.05em}%
}

\newcommand{\fitbiao}[2]{%
  \par\noindent
  \begin{minipage}{\linewidth}
    \vspace{0.25em}%
    \centering
    \renewcommand{\arraystretch}{1}%
    \resizebox{\linewidth}{!}{%
      \begin{tabular}{#1}
        \toprule
        #2
        \bottomrule
      \end{tabular}%
    }%
  \end{minipage}%
  \par
  \vspace{0.05em}%
}

% ==================== 模板提示开关 ====================
\newif\ifNEUMidtermShowHints
\NEUMidtermShowHintsfalse
\newcommand{\showtemplatehintson}{\NEUMidtermShowHintstrue}
\newcommand{\showtemplatehintsoff}{\NEUMidtermShowHintsfalse}

% ==================== 绘图辅助命令 ====================
\newcommand{\NEUMidtermText}[4]{%
  \node[anchor=north west,inner sep=0pt,outer sep=0pt,font={#4}] at (#1,#2) {#3};%
}

\newcommand{\NEUMidtermCenteredBox}[5]{%
  \node[
    anchor=center,
    inner sep=0pt,
    outer sep=0pt,
    text width=#3pt,
    align=center,
    font={#4}
  ] at (#1,#2) {#5};%
}

\newcommand{\NEUMidtermAlignedBox}[6]{%
  \node[
    anchor=north west,
    inner sep=0pt,
    outer sep=0pt,
    text width=#3pt,
    align=#4,
    font={#5}
  ] at (#1,#2) {#6};%
}

\newbox\NEUMidtermStageOneBox
\newbox\NEUMidtermStageOneChunk
\newbox\NEUMidtermNextStageBox
\newbox\NEUMidtermNextStageChunk
\newbox\NEUMidtermIssuesBox
\newbox\NEUMidtermIssuesChunk
\newbox\NEUMidtermOtherBox
\newbox\NEUMidtermOtherChunk
\newbox\NEUMidtermAdvisorBox
\newbox\NEUMidtermAdvisorChunk
\newbox\NEUMidtermContinuationChunk
\newbox\NEUMidtermFlowChunk
\newbox\NEUMidtermAdvisorFlowBox

\newif\ifNEUMidtermFlowFirstPage
\newif\ifNEUMidtermFlowPageHasRows
\newif\ifNEUMidtermFlowPageEmitted
\newif\ifNEUMidtermSectionFirstChunk

\newdimen\NEUMidtermFlowTop
\newdimen\NEUMidtermFlowBottom
\newdimen\NEUMidtermFlowCursor
\newdimen\NEUMidtermFlowRemaining
\newdimen\NEUMidtermFlowTarget
\newdimen\NEUMidtermFlowContentHeight
\newdimen\NEUMidtermFlowRowHeight
\newdimen\NEUMidtermFlowTopPadding
\newdimen\NEUMidtermFlowBottomPadding
\newdimen\NEUMidtermFlowMinStartHeight
\newdimen\NEUMidtermFlowMinRowHeight

\NEUMidtermFlowTopPadding=14pt
\NEUMidtermFlowBottomPadding=6pt
\NEUMidtermFlowMinStartHeight=72pt
\NEUMidtermFlowMinRowHeight=64pt

\newcount\NEUMidtermStoredChunkCount
\newtoks\NEUMidtermPageBodyToks
\newcommand{\NEUMidtermLastStoredChunkName}{}
\newcommand{\NEUMidtermAppendToPageBody}[1]{%
  \NEUMidtermPageBodyToks\expandafter{\the\NEUMidtermPageBodyToks #1}%
}

\newcommand{\NEUMidtermPrepareParagraphMaterial}[3]{%
  \global\setbox#1=\vbox{%
    \hsize=#2pt\relax
    \linewidth=\hsize
    \columnwidth=\hsize
    \textwidth=\hsize
    \NEUMidtermBodyFont
    \parindent=0pt\relax
    \parskip=0.5em\relax
    \leftskip=0pt\relax
    \rightskip=0pt\relax
    \parfillskip=0pt plus 1fil\relax
    \emergencystretch=1em\relax
    \abovedisplayskip=4pt\relax
    \belowdisplayskip=4pt\relax
    \abovedisplayshortskip=2pt\relax
    \belowdisplayshortskip=2pt\relax
    \predisplaypenalty=0\relax
    \postdisplaypenalty=0\relax
    \clubpenalty=-1000\relax
    \widowpenalty=-1000\relax
    \displaywidowpenalty=-1000\relax
    \interlinepenalty=0\relax
    \brokenpenalty=0\relax
    \@beginparpenalty=0\relax
    \@endparpenalty=0\relax
    \@itempenalty=0\relax
    \jot=2pt\relax
    #3\par
  }%
}

\newcommand{\NEUMidtermSplitParagraphMaterial}[3]{%
  \ifdim\dimexpr\ht#1+\dp#1\relax>0pt\relax
    \ifdim\dimexpr\ht#1+\dp#1\relax>#3pt\relax
      \global\setbox#2=\vsplit#1 to #3pt\relax
    \else
      \global\setbox#2=\box#1%
      \global\setbox#1=\vbox{}%
    \fi
  \else
    \global\setbox#2=\vbox{}%
  \fi
}

\newcommand{\NEUMidtermPlacedBox}[3]{%
  \node[anchor=north west, inner sep=0pt, outer sep=0pt] at (#1,#2) {\box#3};%
}

\newcommand{\NEUMidtermPrepareAllParagraphs}{%
  \NEUMidtermPrepareParagraphMaterial{\NEUMidtermStageOneBox}{372}{\@stageonesummary}
  \NEUMidtermPrepareParagraphMaterial{\NEUMidtermNextStageBox}{372}{\@nextstageplan}
  \NEUMidtermPrepareParagraphMaterial{\NEUMidtermIssuesBox}{372}{\@issues}
  \NEUMidtermPrepareParagraphMaterial{\NEUMidtermOtherBox}{372}{\@othernotes}
  \ifNEUMidtermShowHints
    \NEUMidtermPrepareParagraphMaterial{\NEUMidtermAdvisorBox}{372}{\@advisoropinion}
  \else
    \NEUMidtermPrepareParagraphMaterial{\NEUMidtermAdvisorFlowBox}{372}{%
      \@advisoropinion
      \par\vspace{1.5em}%
      \noindent\hfill 指导教师签名：\@advisorsignature\par
      \noindent\hfill
      \makebox[28pt][c]{\@advisoryear}年%
      \makebox[14pt][c]{\@advisormonth}月%
      \makebox[16pt][c]{\@advisorday}日%
    }
  \fi
}

\newcommand{\NEUMidtermSplitFixedPageChunks}{%
  \NEUMidtermSplitParagraphMaterial{\NEUMidtermStageOneBox}{\NEUMidtermStageOneChunk}{480}
  \NEUMidtermSplitParagraphMaterial{\NEUMidtermNextStageBox}{\NEUMidtermNextStageChunk}{188}
  \NEUMidtermSplitParagraphMaterial{\NEUMidtermIssuesBox}{\NEUMidtermIssuesChunk}{156}
  \NEUMidtermSplitParagraphMaterial{\NEUMidtermOtherBox}{\NEUMidtermOtherChunk}{58}
  \NEUMidtermSplitParagraphMaterial{\NEUMidtermAdvisorBox}{\NEUMidtermAdvisorChunk}{126}
}

\newcommand{\NEUMidtermContinuationPage}[2]{%
  \newpage
  \thispagestyle{empty}%
  \null
  \begin{tikzpicture}[remember picture,overlay]
    \begin{scope}[shift={(current page.north west)}, x=1pt, y=-1pt]
      \draw[color=NEUMidtermLine, line width=0.45pt] (65.24,71.04) rectangle (529.42,750.24);
      \draw[color=NEUMidtermLine, line width=0.45pt] (124.72,71.04) -- (124.72,750.24);
      \NEUMidtermPlacedBox{141.00}{87.00}{#2}
    \end{scope}
  \end{tikzpicture}%
}

\newcommand{\NEUMidtermRenderStageOneContinuation}{%
  \ifdim\dimexpr\ht\NEUMidtermStageOneBox+\dp\NEUMidtermStageOneBox\relax>0pt\relax
    \NEUMidtermSplitParagraphMaterial{\NEUMidtermStageOneBox}{\NEUMidtermContinuationChunk}{644}
    \NEUMidtermContinuationPage{前一阶段\\工作总结}{\NEUMidtermContinuationChunk}
    \NEUMidtermRenderStageOneContinuation
  \fi
}

\newcommand{\NEUMidtermRenderNextStageContinuation}{%
  \ifdim\dimexpr\ht\NEUMidtermNextStageBox+\dp\NEUMidtermNextStageBox\relax>0pt\relax
    \NEUMidtermSplitParagraphMaterial{\NEUMidtermNextStageBox}{\NEUMidtermContinuationChunk}{644}
    \NEUMidtermContinuationPage{下一阶段\\工作计划}{\NEUMidtermContinuationChunk}
    \NEUMidtermRenderNextStageContinuation
  \fi
}

\newcommand{\NEUMidtermRenderIssuesContinuation}{%
  \ifdim\dimexpr\ht\NEUMidtermIssuesBox+\dp\NEUMidtermIssuesBox\relax>0pt\relax
    \NEUMidtermSplitParagraphMaterial{\NEUMidtermIssuesBox}{\NEUMidtermContinuationChunk}{644}
    \NEUMidtermContinuationPage{存在问题}{\NEUMidtermContinuationChunk}
    \NEUMidtermRenderIssuesContinuation
  \fi
}

\newcommand{\NEUMidtermRenderOtherContinuation}{%
  \ifdim\dimexpr\ht\NEUMidtermOtherBox+\dp\NEUMidtermOtherBox\relax>0pt\relax
    \NEUMidtermSplitParagraphMaterial{\NEUMidtermOtherBox}{\NEUMidtermContinuationChunk}{644}
    \NEUMidtermContinuationPage{其\\它}{\NEUMidtermContinuationChunk}
    \NEUMidtermRenderOtherContinuation
  \fi
}

\newcommand{\NEUMidtermRenderAdvisorContinuation}{%
  \ifdim\dimexpr\ht\NEUMidtermAdvisorBox+\dp\NEUMidtermAdvisorBox\relax>0pt\relax
    \NEUMidtermSplitParagraphMaterial{\NEUMidtermAdvisorBox}{\NEUMidtermContinuationChunk}{644}
    \NEUMidtermContinuationPage{指导教师\\意见}{\NEUMidtermContinuationChunk}
    \NEUMidtermRenderAdvisorContinuation
  \fi
}

\newcommand{\NEUMidtermHintBox}[5]{%
  \begin{scope}
    \clip (#1,#2) rectangle ($(#1,#2)+(#3,#4)$);
    \node[
      anchor=north west,
      inner sep=0pt,
      outer sep=0pt,
      text width=#3pt,
      align=left,
      font={\NEUMidtermHintFont}
    ] at (#1,#2) {#5};
  \end{scope}
}

% ==================== 正式稿连续排版 ====================
\newcommand{\NEUMidtermFlowFirstPageBackground}{%
  \draw[color=NEUMidtermLine, line width=0.45pt] (65.24,128.64) -- (529.42,128.64);
  \draw[color=NEUMidtermLine, line width=0.45pt] (65.24,128.64) -- (65.24,262.08);
  \draw[color=NEUMidtermLine, line width=0.45pt] (529.42,128.64) -- (529.42,262.08);
  \draw[color=NEUMidtermLine, line width=0.45pt] (124.72,128.64) -- (124.72,262.08);
  \draw[color=NEUMidtermLine, line width=0.45pt] (190.92,128.64) -- (190.92,178.08);
  \draw[color=NEUMidtermLine, line width=0.45pt] (261.93,128.64) -- (261.93,262.08);
  \draw[color=NEUMidtermLine, line width=0.45pt] (332.94,128.64) -- (332.94,262.08);
  \draw[color=NEUMidtermLine, line width=0.45pt] (410.65,128.64) -- (410.65,178.08);
  \draw[color=NEUMidtermLine, line width=0.45pt] (65.24,178.08) -- (529.42,178.08);
  \draw[color=NEUMidtermLine, line width=0.45pt] (65.24,219.36) -- (529.42,219.36);

  \NEUMidtermText{153.00}{77.83}{东北大学毕业设计（论文）中期报告}{\NEUMidtermTitleFont}
  \NEUMidtermText{449.88}{110.47}{年}{\NEUMidtermSmallFont}
  \NEUMidtermText{481.44}{110.47}{月}{\NEUMidtermSmallFont}
  \NEUMidtermText{512.88}{110.47}{日}{\NEUMidtermSmallFont}

  \NEUMidtermText{77.16}{147.54}{学}{\NEUMidtermBodyFont}
  \NEUMidtermText{101.16}{147.54}{号}{\NEUMidtermBodyFont}
  \NEUMidtermText{208.80}{147.54}{姓}{\NEUMidtermBodyFont}
  \NEUMidtermText{232.80}{147.54}{名}{\NEUMidtermBodyFont}
  \NEUMidtermText{354.12}{147.54}{班}{\NEUMidtermBodyFont}
  \NEUMidtermText{378.12}{147.54}{级}{\NEUMidtermBodyFont}

  \NEUMidtermText{71.16}{192.90}{联系电话}{\NEUMidtermBodyFont}
  \NEUMidtermText{273.72}{192.90}{电子邮箱}{\NEUMidtermBodyFont}
  \NEUMidtermText{71.16}{234.90}{实习单位}{\NEUMidtermBodyFont}
  \NEUMidtermText{267.72}{227.10}{设计（论文）}{\NEUMidtermBodyFont}
  \NEUMidtermText{285.72}{242.70}{题目}{\NEUMidtermBodyFont}

  \NEUMidtermText{420.90}{110.47}{\makebox[24pt][c]{\@reportyear}}{\NEUMidtermSmallFont}
  \NEUMidtermText{463.20}{110.47}{\makebox[16pt][c]{\@reportmonth}}{\NEUMidtermSmallFont}
  \NEUMidtermText{495.20}{110.47}{\makebox[16pt][c]{\@reportday}}{\NEUMidtermSmallFont}

  \NEUMidtermCenteredBox{157.82}{153.36}{58}{\NEUMidtermBodyFont}{\@studentid}
  \NEUMidtermCenteredBox{297.44}{153.36}{58}{\NEUMidtermBodyFont}{\@studentname}
  \NEUMidtermCenteredBox{470.03}{153.36}{100}{\NEUMidtermBodyFont}{\@grade}
  \NEUMidtermCenteredBox{193.32}{198.72}{120}{\NEUMidtermBodyFont}{\@phone}
  \NEUMidtermCenteredBox{431.18}{198.72}{176}{\NEUMidtermBodyFont}{\@email}
  \NEUMidtermCenteredBox{193.32}{240.72}{120}{\NEUMidtermBodyFont}{\@internshipunit}
  \NEUMidtermCenteredBox{431.18}{240.72}{176}{\NEUMidtermBodyFont}{\@thesistitle}
}

\newcommand{\NEUMidtermStartFlowPages}{%
  \NEUMidtermFlowFirstPagetrue
  \NEUMidtermFlowPageEmittedfalse
  \NEUMidtermStoredChunkCount=0\relax
  \NEUMidtermStartNewFlowPage
}

\newcommand{\NEUMidtermStartNewFlowPage}{%
  \NEUMidtermPageBodyToks={}%
  \ifNEUMidtermFlowFirstPage
    \NEUMidtermFlowTop=262.08pt\relax
    \NEUMidtermFlowBottom=765.60pt\relax
  \else
    \NEUMidtermFlowTop=71.04pt\relax
    \NEUMidtermFlowBottom=750.24pt\relax
  \fi
  \NEUMidtermFlowCursor=\NEUMidtermFlowTop
  \NEUMidtermFlowRemaining=\dimexpr\NEUMidtermFlowBottom-\NEUMidtermFlowTop\relax
  \NEUMidtermFlowPageHasRowsfalse
}

\newcommand{\NEUMidtermEmitFlowPage}{%
  \ifNEUMidtermFlowPageEmitted
    \newpage
  \fi
  \thispagestyle{empty}%
  \null
  \begin{tikzpicture}[remember picture,overlay]
    \begin{scope}[shift={(current page.north west)}, x=1pt, y=-1pt]
      \ifNEUMidtermFlowFirstPage
        \NEUMidtermFlowFirstPageBackground
      \fi
      \the\NEUMidtermPageBodyToks
    \end{scope}
  \end{tikzpicture}%
  \NEUMidtermFlowPageEmittedtrue
  \NEUMidtermFlowFirstPagefalse
}

\newcommand{\NEUMidtermEnsureSectionStartSpace}{%
  \ifNEUMidtermFlowPageHasRows
    \ifdim\NEUMidtermFlowRemaining<\NEUMidtermFlowMinStartHeight
      \NEUMidtermEmitFlowPage
      \NEUMidtermStartNewFlowPage
    \fi
  \fi
}

\newcommand{\NEUMidtermStoreFlowChunk}[1]{%
  \global\advance\NEUMidtermStoredChunkCount by 1\relax
  \expandafter\newbox\csname NEUMidtermStoredChunk\the\NEUMidtermStoredChunkCount\endcsname
  \global\setbox\csname NEUMidtermStoredChunk\the\NEUMidtermStoredChunkCount\endcsname=\box#1%
  \xdef\NEUMidtermLastStoredChunkName{NEUMidtermStoredChunk\the\NEUMidtermStoredChunkCount}%
}

\newcommand{\NEUMidtermAppendCurrentChunk}[2]{%
  \edef\NEUMidterm@rowtop{\strip@pt\NEUMidtermFlowCursor}%
  \edef\NEUMidterm@rowbottom{\strip@pt\dimexpr\NEUMidtermFlowCursor+\NEUMidtermFlowRowHeight\relax}%
  \edef\NEUMidterm@contenttop{\strip@pt\dimexpr\NEUMidtermFlowCursor+\NEUMidtermFlowTopPadding\relax}%
  \edef\NEUMidterm@labelcenter{\strip@pt\dimexpr\NEUMidtermFlowCursor+\NEUMidtermFlowRowHeight/2\relax}%
  \ifNEUMidtermFlowPageHasRows
    \edef\NEUMidterm@rowcmd{%
      \noexpand\draw[color=NEUMidtermLine, line width=0.45pt] (65.24,\NEUMidterm@rowtop) -- (65.24,\NEUMidterm@rowbottom);
      \noexpand\draw[color=NEUMidtermLine, line width=0.45pt] (124.72,\NEUMidterm@rowtop) -- (124.72,\NEUMidterm@rowbottom);
      \noexpand\draw[color=NEUMidtermLine, line width=0.45pt] (529.42,\NEUMidterm@rowtop) -- (529.42,\NEUMidterm@rowbottom);
      \noexpand\draw[color=NEUMidtermLine, line width=0.45pt] (65.24,\NEUMidterm@rowbottom) -- (529.42,\NEUMidterm@rowbottom);
      \noexpand\NEUMidtermPlacedBox{141.00}{\NEUMidterm@contenttop}{\expandafter\noexpand\csname \NEUMidtermLastStoredChunkName\endcsname}%
    }%
  \else
    \edef\NEUMidterm@rowcmd{%
      \noexpand\draw[color=NEUMidtermLine, line width=0.45pt] (65.24,\NEUMidterm@rowtop) -- (529.42,\NEUMidterm@rowtop);
      \noexpand\draw[color=NEUMidtermLine, line width=0.45pt] (65.24,\NEUMidterm@rowtop) -- (65.24,\NEUMidterm@rowbottom);
      \noexpand\draw[color=NEUMidtermLine, line width=0.45pt] (124.72,\NEUMidterm@rowtop) -- (124.72,\NEUMidterm@rowbottom);
      \noexpand\draw[color=NEUMidtermLine, line width=0.45pt] (529.42,\NEUMidterm@rowtop) -- (529.42,\NEUMidterm@rowbottom);
      \noexpand\draw[color=NEUMidtermLine, line width=0.45pt] (65.24,\NEUMidterm@rowbottom) -- (529.42,\NEUMidterm@rowbottom);
      \noexpand\NEUMidtermPlacedBox{141.00}{\NEUMidterm@contenttop}{\expandafter\noexpand\csname \NEUMidtermLastStoredChunkName\endcsname}%
    }%
  \fi
  \expandafter\NEUMidtermAppendToPageBody\expandafter{\NEUMidterm@rowcmd}%
  \ifnum#2=1\relax
    \edef\NEUMidterm@labelcmd{%
      \noexpand\NEUMidtermCenteredBox{94.98}{\NEUMidterm@labelcenter}{\NEUMidtermSidebarLabelWidth}{\noexpand\NEUMidtermBodyFont}{\unexpanded{#1}}%
    }%
    \expandafter\NEUMidtermAppendToPageBody\expandafter{\NEUMidterm@labelcmd}%
  \fi
  \NEUMidtermFlowPageHasRowstrue
}

\newcommand{\NEUMidtermAdvanceFlowCursor}{%
  \advance\NEUMidtermFlowCursor by \NEUMidtermFlowRowHeight
  \advance\NEUMidtermFlowRemaining by -\NEUMidtermFlowRowHeight
}

\newcommand{\NEUMidtermFlowSection}[2]{%
  \NEUMidtermSectionFirstChunktrue
  \ifdim\dimexpr\ht#2+\dp#2\relax=0pt\relax
    \NEUMidtermEnsureSectionStartSpace
    \global\setbox\NEUMidtermFlowChunk=\vbox{}%
    \NEUMidtermFlowRowHeight=\NEUMidtermFlowMinRowHeight
    \NEUMidtermStoreFlowChunk{\NEUMidtermFlowChunk}
    \NEUMidtermAppendCurrentChunk{#1}{1}
    \NEUMidtermAdvanceFlowCursor
  \else
    \loop
      \ifdim\dimexpr\ht#2+\dp#2\relax>0pt\relax
        \ifNEUMidtermSectionFirstChunk
          \NEUMidtermEnsureSectionStartSpace
        \fi
        \NEUMidtermFlowTarget=\dimexpr\NEUMidtermFlowRemaining-\NEUMidtermFlowTopPadding-\NEUMidtermFlowBottomPadding\relax
        \ifdim\NEUMidtermFlowTarget<24pt\relax
          \NEUMidtermEmitFlowPage
          \NEUMidtermStartNewFlowPage
          \NEUMidtermFlowTarget=\dimexpr\NEUMidtermFlowRemaining-\NEUMidtermFlowTopPadding-\NEUMidtermFlowBottomPadding\relax
        \fi
        \ifdim\dimexpr\ht#2+\dp#2\relax>\NEUMidtermFlowTarget
          \global\setbox\NEUMidtermFlowChunk=\vsplit#2 to \NEUMidtermFlowTarget
          \ifdim\dimexpr\ht\NEUMidtermFlowChunk+\dp\NEUMidtermFlowChunk\relax=0pt\relax
            \ifNEUMidtermFlowPageHasRows
              \NEUMidtermEmitFlowPage
              \NEUMidtermStartNewFlowPage
              \NEUMidtermFlowTarget=\dimexpr\NEUMidtermFlowRemaining-\NEUMidtermFlowTopPadding-\NEUMidtermFlowBottomPadding\relax
              \ifdim\dimexpr\ht#2+\dp#2\relax>\NEUMidtermFlowTarget
                \global\setbox\NEUMidtermFlowChunk=\vsplit#2 to \NEUMidtermFlowTarget
              \else
                \global\setbox\NEUMidtermFlowChunk=\box#2%
                \global\setbox#2=\vbox{}%
              \fi
            \else
              \PackageWarning{NEUBachelorMidterm}{An element in section `#1' exceeds the page height and may overflow}%
              \global\setbox\NEUMidtermFlowChunk=\box#2%
              \global\setbox#2=\vbox{}%
            \fi
          \fi
        \else
          \global\setbox\NEUMidtermFlowChunk=\box#2%
          \global\setbox#2=\vbox{}%
        \fi
        \NEUMidtermFlowContentHeight=\dimexpr\ht\NEUMidtermFlowChunk+\dp\NEUMidtermFlowChunk\relax
        \NEUMidtermFlowRowHeight=\dimexpr\NEUMidtermFlowContentHeight+\NEUMidtermFlowTopPadding+\NEUMidtermFlowBottomPadding\relax
        \ifNEUMidtermSectionFirstChunk
          \ifdim\NEUMidtermFlowRowHeight<\NEUMidtermFlowMinRowHeight
            \NEUMidtermFlowRowHeight=\NEUMidtermFlowMinRowHeight
          \fi
          \NEUMidtermStoreFlowChunk{\NEUMidtermFlowChunk}
          \NEUMidtermAppendCurrentChunk{#1}{1}
        \else
          \NEUMidtermStoreFlowChunk{\NEUMidtermFlowChunk}
          \NEUMidtermAppendCurrentChunk{#1}{0}
        \fi
        \NEUMidtermAdvanceFlowCursor
        % If content remains, keep trying to fill the current page before
        % emitting a continuation page. This avoids large blank areas when
        % headings, formulas, or tables force \vsplit to stop early.
        \NEUMidtermSectionFirstChunkfalse
    \repeat
  \fi
}

\newcommand{\NEUMidtermMakeFlowReport}{%
  \NEUMidtermStartFlowPages
  \NEUMidtermFlowSection{\NEUMidtermLabelStageOne}{\NEUMidtermStageOneBox}
  \NEUMidtermFlowSection{\NEUMidtermLabelNextStage}{\NEUMidtermNextStageBox}
  \NEUMidtermFlowSection{\NEUMidtermLabelIssues}{\NEUMidtermIssuesBox}
  \NEUMidtermFlowSection{\NEUMidtermLabelOther}{\NEUMidtermOtherBox}
  \NEUMidtermFlowSection{\NEUMidtermLabelAdvisor}{\NEUMidtermAdvisorFlowBox}
  \ifNEUMidtermFlowPageHasRows
    \NEUMidtermEmitFlowPage
  \else
    \ifNEUMidtermFlowPageEmitted\else
      \NEUMidtermEmitFlowPage
    \fi
  \fi
}

% ==================== 第一页 ====================
\newcommand{\NEUMidtermPageOne}{%
  \thispagestyle{empty}%
  \null
  \begin{tikzpicture}[remember picture,overlay]
    \begin{scope}[shift={(current page.north west)}, x=1pt, y=-1pt]
      % 线框坐标严格按照用户提供的原始 LaTeX
      \draw[color=NEUMidtermLine, line width=0.45pt] (65.24,128.64) rectangle (529.42,765.60);
      \draw[color=NEUMidtermLine, line width=0.45pt] (124.72,128.64) -- (124.72,765.60);
      \draw[color=NEUMidtermLine, line width=0.45pt] (190.92,128.64) -- (190.92,178.08);
      \draw[color=NEUMidtermLine, line width=0.45pt] (261.93,128.64) -- (261.93,262.08);
      \draw[color=NEUMidtermLine, line width=0.45pt] (332.94,128.64) -- (332.94,262.08);
      \draw[color=NEUMidtermLine, line width=0.45pt] (410.65,128.64) -- (410.65,178.08);
      \draw[color=NEUMidtermLine, line width=0.45pt] (65.24,178.08) -- (529.42,178.08);
      \draw[color=NEUMidtermLine, line width=0.45pt] (65.24,219.36) -- (529.42,219.36);
      \draw[color=NEUMidtermLine, line width=0.45pt] (65.24,262.08) -- (529.42,262.08);

      % 固定文字坐标严格按照用户提供的原始 LaTeX
      \NEUMidtermText{153.00}{77.83}{东北大学毕业设计（论文）中期报告}{\NEUMidtermTitleFont}
      \NEUMidtermText{449.88}{110.47}{年}{\NEUMidtermSmallFont}
      \NEUMidtermText{481.44}{110.47}{月}{\NEUMidtermSmallFont}
      \NEUMidtermText{512.88}{110.47}{日}{\NEUMidtermSmallFont}

      \NEUMidtermText{77.16}{147.54}{学}{\NEUMidtermBodyFont}
      \NEUMidtermText{101.16}{147.54}{号}{\NEUMidtermBodyFont}
      \NEUMidtermText{208.80}{147.54}{姓}{\NEUMidtermBodyFont}
      \NEUMidtermText{232.80}{147.54}{名}{\NEUMidtermBodyFont}
      \NEUMidtermText{354.12}{147.54}{班}{\NEUMidtermBodyFont}
      \NEUMidtermText{378.12}{147.54}{级}{\NEUMidtermBodyFont}

      \NEUMidtermText{71.16}{192.90}{联系电话}{\NEUMidtermBodyFont}
      \NEUMidtermText{273.72}{192.90}{电子邮箱}{\NEUMidtermBodyFont}
      \NEUMidtermText{71.16}{234.90}{实习单位}{\NEUMidtermBodyFont}
      \NEUMidtermText{267.72}{227.10}{设计（论文）}{\NEUMidtermBodyFont}
      \NEUMidtermText{285.72}{242.70}{题目}{\NEUMidtermBodyFont}
      \NEUMidtermText{70.92}{500.22}{前一阶段}{\NEUMidtermBodyFont}
      \NEUMidtermText{70.92}{515.82}{工作总结}{\NEUMidtermBodyFont}

      % 填写内容
      \NEUMidtermText{420.90}{110.47}{\makebox[24pt][c]{\@reportyear}}{\NEUMidtermSmallFont}
      \NEUMidtermText{463.20}{110.47}{\makebox[16pt][c]{\@reportmonth}}{\NEUMidtermSmallFont}
      \NEUMidtermText{495.20}{110.47}{\makebox[16pt][c]{\@reportday}}{\NEUMidtermSmallFont}

      \NEUMidtermCenteredBox{157.82}{153.36}{58}{\NEUMidtermBodyFont}{\@studentid}
      \NEUMidtermCenteredBox{297.44}{153.36}{58}{\NEUMidtermBodyFont}{\@studentname}
      \NEUMidtermCenteredBox{470.03}{153.36}{100}{\NEUMidtermBodyFont}{\@grade}
      \NEUMidtermCenteredBox{193.32}{198.72}{120}{\NEUMidtermBodyFont}{\@phone}
      \NEUMidtermCenteredBox{431.18}{198.72}{176}{\NEUMidtermBodyFont}{\@email}
      \NEUMidtermCenteredBox{193.32}{240.72}{120}{\NEUMidtermBodyFont}{\@internshipunit}
      \NEUMidtermCenteredBox{431.18}{240.72}{176}{\NEUMidtermBodyFont}{\@thesistitle}

      \NEUMidtermPlacedBox{141.00}{278.00}{\NEUMidtermStageOneChunk}

      \ifNEUMidtermShowHints
        \NEUMidtermHintBox{145.00}{430.00}{315.00}{96.00}{%
          除对毕业设计的情况进行阶段性总结外，还应具体总结前一阶段工作的内容，如应对本阶段研究或学习的文献、书籍内容进行总结，学习或进行的设计情况进行总结，情况应不少于400字。%
        }
        \NEUMidtermHintBox{286.00}{590.00}{145.00}{40.00}{%
          不少于400。\\宋体小四号，1.5倍行距%
        }
      \fi
    \end{scope}
  \end{tikzpicture}%
}

% ==================== 第二页 ====================
\newcommand{\NEUMidtermPageTwo}{%
  \newpage
  \thispagestyle{empty}%
  \null
  \begin{tikzpicture}[remember picture,overlay]
    \begin{scope}[shift={(current page.north west)}, x=1pt, y=-1pt]
      % 线框坐标严格按照用户提供的原始 LaTeX
      \draw[color=NEUMidtermLine, line width=0.45pt] (65.24,71.04) rectangle (529.42,750.24);
      \draw[color=NEUMidtermLine, line width=0.45pt] (124.72,71.04) -- (124.72,750.24);
      \draw[color=NEUMidtermLine, line width=0.45pt] (65.24,275.52) -- (529.42,275.52);
      \draw[color=NEUMidtermLine, line width=0.45pt] (65.24,453.60) -- (529.42,453.60);
      \draw[color=NEUMidtermLine, line width=0.45pt] (65.24,534.24) -- (529.42,534.24);

      % 固定文字坐标严格按照用户提供的原始 LaTeX
      \NEUMidtermText{71.16}{159.54}{下一阶段}{\NEUMidtermBodyFont}
      \NEUMidtermText{71.16}{175.14}{工作计划}{\NEUMidtermBodyFont}
      \NEUMidtermText{71.16}{358.86}{存在问题}{\NEUMidtermBodyFont}
      \NEUMidtermText{77.16}{488.22}{其}{\NEUMidtermBodyFont}
      \NEUMidtermText{101.16}{488.22}{它}{\NEUMidtermBodyFont}
      \NEUMidtermText{71.16}{628.74}{指导教师}{\NEUMidtermBodyFont}
      \NEUMidtermText{83.16}{644.22}{意见}{\NEUMidtermBodyFont}
      \NEUMidtermText{360.36}{694.74}{指导教师签名：}{\NEUMidtermBodyFont}
      \NEUMidtermText{384.36}{718.14}{年}{\NEUMidtermBodyFont}
      \NEUMidtermText{420.36}{718.14}{月}{\NEUMidtermBodyFont}
      \NEUMidtermText{456.36}{718.14}{日}{\NEUMidtermBodyFont}

      % 填写内容
      \NEUMidtermPlacedBox{141.00}{87.00}{\NEUMidtermNextStageChunk}
      \NEUMidtermPlacedBox{141.00}{291.00}{\NEUMidtermIssuesChunk}
      \NEUMidtermPlacedBox{141.00}{468.00}{\NEUMidtermOtherChunk}
      \NEUMidtermPlacedBox{141.00}{549.00}{\NEUMidtermAdvisorChunk}

      \NEUMidtermText{454.80}{694.74}{\@advisorsignature}{\NEUMidtermBodyFont}
      \NEUMidtermText{341.40}{718.14}{\makebox[28pt][c]{\@advisoryear}}{\NEUMidtermBodyFont}
      \NEUMidtermText{395.40}{718.14}{\makebox[14pt][c]{\@advisormonth}}{\NEUMidtermBodyFont}
      \NEUMidtermText{431.40}{718.14}{\makebox[16pt][c]{\@advisorday}}{\NEUMidtermBodyFont}

      \ifNEUMidtermShowHints
        \NEUMidtermHintBox{145.00}{94.00}{315.00}{28.00}{%
          对下一阶段工作的具体计划，不少于300字。%
        }
        \NEUMidtermHintBox{252.00}{188.00}{160.00}{44.00}{%
          不少于300字。\\宋体小四号，1.5倍行距%
        }
        \NEUMidtermHintBox{145.00}{308.00}{315.00}{26.00}{%
          必须填写，不少于100字。宋体小四号，1.5倍行距%
        }
        \NEUMidtermHintBox{205.00}{393.00}{190.00}{44.00}{%
          必须填写，不少于100字。\\宋体小四号，1.5倍行距%
        }
        \NEUMidtermText{67.20}{753.40}{此表需要双面打印。}{\NEUMidtermHintFont}
      \fi
    \end{scope}
  \end{tikzpicture}%
}

% ==================== 主命令 ====================
\newcommand{\makemidtermreport}{%
  \NEUMidtermPrepareAllParagraphs
  \ifNEUMidtermShowHints
    \NEUMidtermSplitFixedPageChunks
    \NEUMidtermPageOne
    \NEUMidtermRenderStageOneContinuation
    \NEUMidtermPageTwo
    \NEUMidtermRenderNextStageContinuation
    \NEUMidtermRenderIssuesContinuation
    \NEUMidtermRenderOtherContinuation
    \NEUMidtermRenderAdvisorContinuation
  \else
    \NEUMidtermMakeFlowReport
  \fi
}

\makeatother
