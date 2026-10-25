% SPDX-License-Identifier: MIT
% China Agricultural University graduate thesis template, unofficial.
\NeedsTeXFormat{LaTeX2e}[2022-06-01]
\ProvidesClass{cauthesis}[2026/10/12 v0.2.9 CAU graduate thesis template]
\RequirePackage{iftex}
\ifXeTeX\else
  \ClassError{cauthesis}{XeLaTeX is required}{Select XeLaTeX, not pdfLaTeX.}
\fi
\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=cau,prefix=cau@}
\DeclareStringOption[doctor]{degree}
\DeclareStringOption[academic]{type}
\DeclareStringOption[required]{fontset}
\ProcessKeyvalOptions*
\LoadClass[UTF8,a4paper,zihao=-4,fontset=none,oneside,openany]{ctexbook}
\RequirePackage{etoolbox}
\ifdefstring{\cau@degree}{doctor}{\def\cau@level{博士}}{%
  \ifdefstring{\cau@degree}{master}{\def\cau@level{硕士}}{%
    \ClassError{cauthesis}{Invalid degree option}{Use degree=doctor or degree=master.}}}
\ifdefstring{\cau@type}{academic}{\def\cau@majorlabel{专业名称}}{%
  \ifdefstring{\cau@type}{professional}{\def\cau@majorlabel{专业领域名称}}{%
    \ClassError{cauthesis}{Invalid type option}{Use type=academic or type=professional.}}}

% All point values below use bp: one Word point is 1/72 inch.
\RequirePackage{geometry}
\geometry{left=30mm,right=25mm,top=30mm,bottom=25mm,
  headheight=19bp,headsep=\dimexpr7mm-19bp\relax,footskip=7mm}
\RequirePackage{fontspec}
\newcommand\cau@requirefont[2]{%
  \IfFontExistsTF{#1}{}{\ClassError{cauthesis}{Required font not found: #1}{#2}}}
\ifdefstring{\cau@fontset}{required}{%
  \cau@requirefont{Times New Roman}{Install a lawfully obtained Times New Roman font. See README.md.}
  \IfFontExistsTF{SimSun}{\def\cau@song{SimSun}}{\def\cau@song{宋体}}
  \IfFontExistsTF{SimHei}{\def\cau@hei{SimHei}}{\def\cau@hei{黑体}}
  \cau@requirefont{\cau@song}{Install SimSun. Fandol is preview-only; see README.md.}
  \cau@requirefont{\cau@hei}{Install SimHei. Fandol is preview-only; see README.md.}
  \setmainfont{Times New Roman}
  \setsansfont{Times New Roman}
  \setmonofont{Times New Roman}
  \setCJKmainfont{\cau@song}[AutoFakeBold=2.5]
  \setCJKsansfont{\cau@hei}[AutoFakeBold=2.5]
  \setCJKmonofont{\cau@song}
  \setCJKfamilyfont{zhsong}{\cau@song}[AutoFakeBold=2.5]
  \setCJKfamilyfont{zhhei}{\cau@hei}[AutoFakeBold=2.5]
}{\ifdefstring{\cau@fontset}{fandol}{%
  \setmainfont{TeX Gyre Termes}
  \setsansfont{TeX Gyre Termes}
  \setmonofont{TeX Gyre Termes}
  \setCJKmainfont{FandolSong-Regular.otf}[BoldFont=FandolSong-Bold.otf]
  \setCJKsansfont{FandolHei-Regular.otf}[BoldFont=FandolHei-Bold.otf]
  \setCJKmonofont{FandolSong-Regular.otf}
  \setCJKfamilyfont{zhsong}{FandolSong-Regular.otf}[BoldFont=FandolSong-Bold.otf]
  \setCJKfamilyfont{zhhei}{FandolHei-Regular.otf}[BoldFont=FandolHei-Bold.otf]
  \ClassInfo{cauthesis}{PREVIEW ONLY: Fandol/Termes do not meet the required font names; visible page notices remain}
}{\ClassError{cauthesis}{Invalid fontset option}{Use fontset=required or fontset=fandol.}}}
\providecommand\songti{\CJKfamily{zhsong}}
\providecommand\heiti{\CJKfamily{zhhei}}
\RequirePackage{amsmath}
\RequirePackage{unicode-math}
\setmathfont{TeX Gyre Termes Math}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{longtable}
\RequirePackage{caption}
\RequirePackage{titletoc}
\RequirePackage{needspace}
\RequirePackage{hyperref}
\hypersetup{hidelinks,bookmarksnumbered=true,pdfdisplaydoctitle=true}
\urlstyle{same}
\pdfstringdefDisableCommands{\def\quad{ }\def\qquad{ }\def\enspace{ }%
  \def\\{ }\def\newline{ }}

\linespread{1}
\newcommand\cau@bodyfont{\songti\fontsize{12bp}{20bp}\selectfont}
\newcommand\cau@chapterfont{\heiti\bfseries\fontsize{16bp}{20bp}\selectfont}
% Local topskip preserves the 12pt before-space when TeX moves a heading to
% a fresh page; discarded leading glue must not put its glyphs on the headrule.
\newcommand\cau@sectionfont{\heiti\fontsize{14bp}{20bp}\selectfont\topskip=31.75bp}
\newcommand\cau@subsectionfont{\heiti\fontsize{12bp}{20bp}\selectfont\topskip=31.75bp}
\newcommand\cau@captionfont{\heiti\fontsize{10.5bp}{20bp}\selectfont}
\newcommand\cau@tablefont{\songti\fontsize{10.5bp}{14.98bp}\selectfont}
\newcommand\cau@legendfont{\songti\fontsize{10.5bp}{20bp}\selectfont}
\newcommand\cau@smallfont{\songti\fontsize{9bp}{20bp}\selectfont}
% Native Word calibration: adjacent heading/body baselines are 32pt (20+12).
% This is measured output, not a conversion of auto line units to twips.
\newlength\cau@headinggap
\setlength\cau@headinggap{12bp}
\renewcommand\normalsize{\@setfontsize\normalsize{12bp}{20bp}%
  \abovedisplayskip=10bp plus 2bp minus 2bp
  \belowdisplayskip=10bp plus 2bp minus 2bp
  \abovedisplayshortskip=6bp plus 1bp minus 1bp
  \belowdisplayshortskip=6bp plus 1bp minus 1bp}
\renewcommand\footnotesize{\@setfontsize\footnotesize{9bp}{14bp}}
\AtBeginDocument{\normalsize\songti}
\ifdefstring{\cau@fontset}{fandol}{%
  \AddToHook{shipout/foreground}{\put(0,-18){\makebox[\paperwidth][c]{%
    \color{red}\rmfamily\fontsize{9bp}{11bp}\selectfont
    \ifdim\paperwidth<100mm
      \fontsize{6bp}{8bp}\selectfont\shortstack{预览\\勿提交}%
    \else PREVIEW ONLY - substitute fonts; not a submission copy\fi}}}}{}
\setlength\parindent{2em}
\setlength\parskip{0pt}
% Native Word's first ordinary line: baseline ~19.75pt below body-area top.
% CTeX's fixskip chapters explicitly cancel topskip, so they are independent.
\setlength\topskip{19.75bp}
\setlength\emergencystretch{1em}
\raggedbottom
% Float-only pages start at the same safe top as mixed text/float pages.
% Infinite glue belongs below the contents, never above/between figures.
\setlength\@fptop{0pt}
\setlength\@fpsep{8bp plus 1bp minus 1bp}
\setlength\@fpbot{0pt plus 1fil}
\renewcommand\topfraction{0.97}
\renewcommand\bottomfraction{0.90}
\renewcommand\textfraction{0.03}
\renewcommand\floatpagefraction{0.96}
\setcounter{topnumber}{10}
\setcounter{bottomnumber}{10}
\setcounter{totalnumber}{20}
% Discourage isolated lines without making ordinary paragraph/display breaks
% impossible; an absolute ban can leave a large hole above the footer.
\clubpenalty=3000
\widowpenalty=3000
\displaywidowpenalty=3000
\predisplaypenalty=10000
\ctexset{
  chapter={name={第,章},number=\chinese{chapter},
    format=\centering\cau@chapterfont,indent=0pt,
    % Chapter page-top glue differs from a Word paragraph; compensate separately.
    beforeskip=\dimexpr\cau@headinggap+6.5bp\relax,
    afterskip=\dimexpr\cau@headinggap+8.5bp\relax,fixskip=true,
    tocline={\protect\numberline{\thechapter}#2}},
  section={format=\raggedright\cau@sectionfont,indent=0pt,
    beforeskip=\cau@headinggap,afterskip=\cau@headinggap},
  subsection={format=\raggedright\cau@subsectionfont,indent=0pt,
    beforeskip=\cau@headinggap,afterskip=\cau@headinggap}
}
\setcounter{secnumdepth}{2}
\setcounter{tocdepth}{1}
\titlecontents{chapter}[0pt]{\songti\fontsize{14bp}{18bp}\selectfont}
  {\contentspush{\thecontentslabel\quad}}{}{\titlerule*[0.5pc]{.}\contentspage}
\titlecontents{section}[24bp]{\songti\fontsize{12bp}{18bp}\selectfont}
  {\contentspush{\thecontentslabel\quad}}{}{\titlerule*[0.5pc]{.}\contentspage}
\titlecontents{figure}[4em]{\songti\fontsize{12bp}{18bp}\selectfont}
  {\contentslabel{4em}}{}{\titlerule*[0.5pc]{.}\contentspage}
\titlecontents{table}[4em]{\songti\fontsize{12bp}{18bp}\selectfont}
  {\contentslabel{4em}}{}{\titlerule*[0.5pc]{.}\contentspage}

\newif\ifcau@body
\cau@bodyfalse
% Word anchors header/footer paragraph areas, not glyph baselines.
% Native Word: header baseline ~79.68bp, rule strokes 3/.75bp, gap .75bp.
% The supplied footer has an 18pt trailing empty paragraph. Rebuild one PAGE
% paragraph: copying that empty paragraph would raise the page number into the
% specified body area and collide with full-height tables. Keep Word's 18mm
% footer-area margin, 9pt type and 18pt line box; center as required by the PDF.
\newlength\cau@footraise
\setlength\cau@footraise{3.57bp}
% Author's PDF acceptance bounds, NOT additional school-mandated margins.
% Measure last main text/caption baseline -> page-number baseline; exempt
% chapter-ending pages. These thresholds never stretch text or move footers.
\newlength\cauminpageclearance
\newlength\caumaxpageclearance
\setlength\cauminpageclearance{16bp}
\setlength\caumaxpageclearance{43bp}
\newlength\caumintopclearance
\newlength\caumaxtopclearance
\setlength\caumintopclearance{2bp}
\setlength\caumaxtopclearance{20bp}
\newcommand\cau@runningfont{\normalfont\songti\fontsize{9bp}{18bp}\selectfont}
\newsavebox\cau@headleft
\newsavebox\cau@headright
\newcommand\cau@headtext{%
  \sbox\cau@headleft{中国农业大学\cau@level 学位论文}%
  \sbox\cau@headright{\leftmark}%
  \ifdim\dimexpr\wd\cau@headleft+\wd\cau@headright+1em\relax>\textwidth
    \ClassError{cauthesis}{Running header is too wide}{Use
      \string\cauheadertitle{short title} immediately after \string\chapter,
      or shorten the chapter title. This does not change the TOC.
      Do not reduce the required header font size.}%
    % An explicit error must not leave clipped text in a non-halting preview.
    \sbox\cau@headright{[HEADER TOO LONG]}%
  \fi
  \hbox to\textwidth{\usebox\cau@headleft\hfil\usebox\cau@headright}}
\def\ps@plain{%
  \def\@oddhead{\ifcau@body\begingroup\cau@runningfont
    \setlength\unitlength{1bp}%
    \begin{picture}(0,0)
      \put(0,4.55){\cau@headtext}%
      \put(-1.5,-4.4){\vbox{\hrule height3bp width\dimexpr\textwidth+3bp\relax
        \kern0.75bp\hrule height0.75bp width\dimexpr\textwidth+3bp\relax}}%
    \end{picture}\hfil\endgroup\fi}%
  \let\@evenhead\@oddhead
  \def\@oddfoot{\hbox to\textwidth{\hfil
    \raisebox{\cau@footraise}[0pt][0pt]{\cau@runningfont\thepage}\hfil}}%
  \let\@evenfoot\@oddfoot}
\renewcommand\chaptermark[1]{\markboth{\CTEXthechapter\quad#1}{}}
% Set immediately after chapter and before any body text; TOC stays unchanged.
\newcommand\cauheadertitle[1]{\if@mainmatter\chaptermark{#1}%
  \else\markboth{#1}{}\fi}
% Top floats bypass paragraph topskip. The calibrated lower headrule edge is
% 3.56bp below the nominal body-area top. Reserve 6bp (>=2bp visible clearance)
% ONLY for top floats/float pages, and account for it during placement, so the
% footer and ordinary text/heading calibration do not move. Single-column class.
\newlength\cau@floatclearance
\setlength\cau@floatclearance{6bp}
\let\cau@tryfcolumn\@tryfcolumn
\def\@tryfcolumn#1{\begingroup
  \ifcau@body\advance\@colht-\cau@floatclearance\fi
  \cau@tryfcolumn#1%
  \ifcau@body\if@fcolmade
    % Repack to the ORIGINAL full column height. A natural-height vbox would
    % discard the old stretch setting and lift the footer on short float pages.
    \global\setbox\@outputbox\vbox to\dimexpr\@colht+\cau@floatclearance\relax
      {\vskip\cau@floatclearance\unvbox\@outputbox}%
  \fi\fi\endgroup}
\let\cau@flcheckspace\@flcheckspace
\def\@flcheckspace#1#2{%
  \ifcau@body\ifx#1\@toproom\ifx#2\@empty
    \advance\@reqcolroom\cau@floatclearance
  \fi\fi\fi
  \cau@flcheckspace#1#2%
  \ifcau@body\ifx#1\@toproom\ifx#2\@empty
    \advance\@reqcolroom-\cau@floatclearance
  \fi\fi\fi}
\let\cau@flupdates\@flupdates
\def\@flupdates#1#2#3{%
  \ifcau@body\ifx#2\@toproom\ifx#3\@empty
    \global\advance\@toproom-\cau@floatclearance
    \global\advance\@colroom-\cau@floatclearance
  \fi\fi\fi
  \cau@flupdates#1#2#3}
\patchcmd{\@cflt}{\vbox{}}{\vbox{\ifcau@body\vskip\cau@floatclearance\fi}}{}%
  {\ClassError{cauthesis}{Cannot install top-float clearance}{The LaTeX output
    routine has changed. Verify compatibility before using this template.}}
% A 'here' float on a completely empty page loses its leading intextsep.
% Route this exact case through the accounted top-float path as well.
\newcommand\cau@pagetopfloat{\ifcau@body\ifdim\@pageht<1sp
  \@getfpsbit\@ne
  \ifodd\@tempcnta
    \global\advance\count\@currbox-\@ne
    \@getfpsbit\tw@
    \ifodd\@tempcnta\else\global\advance\count\@currbox\tw@\fi
  \fi
\fi\fi}
\pretocmd{\@addtocurcol}{\cau@pagetopfloat}{}%
  {\ClassError{cauthesis}{Cannot protect page-top here floats}{Verify output-routine compatibility.}}
\let\cau@largefloatcheck\@largefloatcheck
\def\@largefloatcheck{%
  \ifcau@body
    \ifdim\ht\@currbox>\dimexpr\textheight-\cau@floatclearance\relax
      \ClassError{cauthesis}{Float exceeds safe page height}{Reduce the graphic
        height or split the table. Include the caption in the total height.}%
    \fi
  \fi\cau@largefloatcheck}
\renewcommand\frontmatter{\clearpage\@mainmatterfalse\cau@bodyfalse
  \pagenumbering{Roman}\pagestyle{plain}}
\renewcommand\mainmatter{\clearpage\@mainmattertrue\cau@bodytrue
  \pagenumbering{arabic}\pagestyle{plain}}
\renewcommand\backmatter{\clearpage\@mainmatterfalse}
\newcommand\caustarchapter[1]{\chapter*{#1}\markboth{#1}{}
  \addcontentsline{toc}{chapter}{#1}}
\newcommand\caufrontchapter[1]{%
  \begingroup\ctexset{chapter={beforeskip=0bp,afterskip=6bp}}
  \chapter*{\textbf{#1}}\endgroup\markboth{#1}{}%
  % chapter's global nobreak flag outlives the local spacing group. Restore
  % its matching everypar hook, or titletoc entries lose their breakpoints.
  \@afterheading}
% Abstracts have their own native-Word calibration, not the generic front
% heading's 6bp skip. Word uses an 18bp title line and a 20bp body line;
% measured title/body baselines: 99.50/119.06bp on an A4 page with 30mm top.
% Explicit zero-width struts avoid dependence on CJK/Latin glyph heights.
\newcommand\cauabstractheading[1]{%
  \begingroup\ctexset{chapter={beforeskip=0bp,afterskip=0bp}}
  \chapter*{\rule[-3.54bp]{0pt}{18bp}\textbf{#1}}\endgroup
  \markboth{#1}{}\@afterheading
  \AddToHookNext{para/begin}{\vrule width0pt height16.02bp depth3.98bp\relax}}
\renewcommand\tableofcontents{\caufrontchapter{目\quad 录}\@starttoc{toc}}
\appto\appendix{\@mainmattertrue\ctexset{chapter={name={附录\space,},number=\Alph{chapter},
  tocline={\protect\numberline{附录\space\thechapter}#2}}}}
% Reserve the gap and one subheading line, plus two body-line heights for
% list leading/the opening entry. This conservative orphan-control budget
% is not a school-prescribed extra blank space.
% The list itself remains breakable; even a long first caption can continue.
\newcommand\cau@listsubheading[2]{%
  \par\Needspace{\dimexpr#1+3\baselineskip\relax}%
  \vspace{#1}{\noindent\heiti #2\par}\nobreak\@afterheading}
\newcommand\caulistoffiguresandtables{%
  \caufrontchapter{插图和附表清单}%
  \cau@listsubheading{0bp}{插图清单}\@starttoc{lof}%
  \cau@listsubheading{20bp}{附表清单}\@starttoc{lot}}
% Native Word: one 21bp tab before the Chinese label, two 14bp characters
% before the English label. Only the first line is indented, not continuations.
\newcommand\keywordszh[1]{\par\nobreak\vspace{6bp}\begingroup
  \clubpenalty=\@M\widowpenalty=\@M\noindent\hspace*{21bp}%
  {\fontsize{14bp}{20bp}\selectfont\bfseries 关键词：}#1\par\endgroup}
\newcommand\keywordsen[1]{\par\nobreak\vspace{6bp}\begingroup
  \clubpenalty=\@M\widowpenalty=\@M\noindent\hspace*{28bp}%
  {\fontsize{14bp}{20bp}\selectfont\bfseries Key words: }#1\par\endgroup}

\renewcommand\thefigure{\thechapter-\arabic{figure}}
\renewcommand\thetable{\thechapter-\arabic{table}}
\renewcommand\theequation{\thechapter-\arabic{equation}}
\DeclareCaptionFont{cau}{\cau@captionfont}
\captionsetup{font=cau,labelfont=cau,labelsep=space,
  justification=centering,singlelinecheck=false,skip=6bp}
% Native Word table: caption baseline -> top rule ~4bp. The negative
% skip compensates the caption strut; visible text and rule remain separated.
\captionsetup[table]{position=top,skip=-2.7bp,belowskip=3bp}
\newif\ifcau@hasnote
\AtBeginEnvironment{table}{\cau@hasnotefalse}
\AtEndEnvironment{table}{\par
  \ifcau@hasnote\ifdim\prevdepth>0pt\kern-\prevdepth\fi
  \else\kern-4.75bp\fi}
% Native Word: picture edge -> caption baseline ~16.1bp; caption/note
% baselines are 20bp apart, with no extra paragraph before/after spacing.
\captionsetup[figure]{position=bottom,skip=2bp,belowskip=0bp}
\setlength\textfloatsep{0bp}
\setlength\intextsep{2bp}
% End the figure's layout box on its last text baseline. The glyph descenders
% remain visible; the following ordinary 20bp line provides their clearance.
% This avoids adding caption-strut depth a second time at the float boundary.
\AtEndEnvironment{figure}{\par\ifdim\prevdepth>0pt\kern-\prevdepth\fi}
\setlength\heavyrulewidth{1.5bp}
\setlength\lightrulewidth{0.75bp}
\setlength\cmidrulewidth{0.75bp}
% Word auto=264 means 1.1 times font-dependent natural line metrics.
% Native 10.5pt SimSun/TNR calibration: CJK ~14.98pt, Latin ~13.28pt.
% Explicit strut dimensions make nested/tabularx initialization idempotent.
% Paragraph spacing is separate: 7.8pt at boundaries, 7.8pt between paragraphs.
\newif\ifcau@intable
\newcommand\cau@tablecellsetup{\cau@tablefont
  \setlength\extrarowheight{0pt}%
  \setbox\strutbox=\hbox{\vrule height18.6bp depth11.98bp width0pt}%
  \setlength\aboverulesep{0pt}\setlength\belowrulesep{0pt}%
  \setlength\abovetopsep{0pt}\setlength\belowbottomsep{0pt}%
  \ifcau@intable\else
    \let\cau@savedparboxrestore\@arrayparboxrestore
    \def\@arrayparboxrestore{\cau@savedparboxrestore\setlength\parskip{7.8bp}}%
    \cau@intabletrue
  \fi}
\AtBeginEnvironment{tabular}{\cau@tablecellsetup}
\AtBeginEnvironment{tabular*}{\cau@tablecellsetup}
\AtBeginEnvironment{tabularx}{\cau@tablecellsetup}
\AtBeginEnvironment{longtable}{\cau@tablecellsetup}
% Apply within a pure-Latin p/X cell, or in a >{...} column declaration.
\newcommand\cautablelatin{\fontsize{10.5bp}{13.28bp}\selectfont
  \setbox\@arstrutbox=\hbox{\vrule height17.76bp depth11.12bp width0pt}}
\AtBeginEnvironment{figure}{\cau@legendfont}
% Word's note paragraph has a two-character (9bp each) first-line indent.
% Lower rule -> note baseline ~16bp; note -> body baseline ~20bp.
\newcommand\tablenote[1]{\cau@hasnotetrue\par\vspace{7.5bp}{\raggedright\cau@smallfont
  \noindent\hspace*{18bp}表注：#1\par}}
\newcommand\figurenote[1]{\par{\centering\cau@legendfont
  \noindent 注：#1\par}}

% The upstream AY style intentionally replaces two inherited macros but uses
% newbibmacro. Use the matching renewal interface within this file only;
% preserve both definitions and all unrelated diagnostics.
% biblatex inputs .cbx files with primitive input; use its own file hooks.
\csappto{blx@filehook@preload@gb7714-2015ay.cbx}{%
  \let\cau@newbibmacro\newbibmacro
  \RenewDocumentCommand\newbibmacro{s m}{%
    \ifboolexpr{(test {\ifstrequal{#2}{textcite}} or
      test {\ifstrequal{#2}{textcite:postnote}}) and
      test {\ifcsdef{abx@macro@#2}}}
      {\IfBooleanTF{#1}{\renewbibmacro*{#2}}{\renewbibmacro{#2}}}
      {\IfBooleanTF{#1}{\cau@newbibmacro*{#2}}{\cau@newbibmacro{#2}}}}}
\csappto{blx@filehook@postload@gb7714-2015ay.cbx}{%
  \let\newbibmacro\cau@newbibmacro}
\RequirePackage[backend=biber,style=gb7714-2015ay,sorting=gb7714-2015,
  sortlocale=zh__pinyin,gblanorder=chineseahead,gbcitelocal=gb7714-2015,
  gbcitelabel=quanjiao,maxcitenames=3,mincitenames=1,
  maxbibnames=3,minbibnames=3,uniquelist=false,gbnamefmt=uppercase,
  doi=true,url=true,isbn=false]{biblatex}
\renewcommand\bibfont{\cau@legendfont}
% All foreign languages form ONE alphabetic group, not six language groups.
% This style-level map runs after the base style's language inference.
\DeclareStyleSourcemap{\maps[datatype=bibtex]{%
  \map[overwrite]{\step[fieldset=lansortorder,fieldvalue={2}]}%
  \map[overwrite]{\step[fieldsource=language,match=\regexp{(?i)^chinese$},final]
    \step[fieldset=lansortorder,fieldvalue={1}]}}}
% Preserve the upstream full-date renderer. Only an ambiguous patent appends
% its citation letter after that complete date (e.g. 2024-01-02a). Placement
% is an explicit template convention: the school gives no such patent example.
\csletcs{abx@macro@cau:newsdate}{abx@macro@newsdate}
\AtEveryBibitem{\ifentrytype{patent}{%
  \renewbibmacro*{date+extradate}{}% local to this item; preserve citation dates
  \renewbibmacro*{newsdate}{\usebibmacro{cau:newsdate}\printfield{extradate}}%
  % The generic no-author fallback consumes the title before patenttitle runs.
  \ifnameundef{author}{\renewbibmacro*{author}{}}{}%
}{}\ifentrytype{periodical}{%
  \renewbibmacro*{title+issuetitle}{\usebibmacro{cau:periodical}}}{}% 
}
% Whole periodical: year/range is already printed after the editor.
% Do not erase date fields or alter journal-article drivers.
\newbibmacro*{cau:periodical}{%
  \usebibmacro{periodical}\newunit\newblock
  \printfield{series}\newunit
  \def\multivolfirst{}\def\multivolsecond{}%
  \def\multinumberfirst{}\def\multinumbersecond{}%
  \iffieldundef{volume}{}{\multivolparser{\thefield{volume}}}%
  \iffieldundef{number}{}{\multinumberparser{\thefield{number}}}%
  \ifboolexpr{not test {\iffieldundef{volume}} or not test {\iffieldundef{number}}}{%
    \printtext{\multivolfirst\ifdefempty{\multinumberfirst}{}{\mkbibparens{\multinumberfirst}}}%
    \printtext{\bibrangedash\multivolsecond
      \ifdefempty{\multinumbersecond}{}{\mkbibparens{\multinumbersecond}}}%
  }{}%
  \setunit{\addcomma\space}\printfield{eid}%
  \newunit\usebibmacro{issue}\newunit}
\setlength\bibitemsep{0pt}
% The official Word reference-entry paragraphs clear first-line indentation.
% Keep every line flush left; no numeric labels in this author-year baseline.
% Own the list geometry; upstream bibitemindent has changed semantics.
\setlength\bibhang{0pt}
\defbibenvironment{bibliography}
  {\list{}{\setlength\leftmargin{0pt}\setlength\rightmargin{0pt}%
      \setlength\itemindent{0pt}\setlength\listparindent{0pt}%
      \setlength\labelwidth{0pt}\setlength\labelsep{0pt}%
      \setlength\itemsep{\bibitemsep}\setlength\parsep{\bibparsep}}}
  {\endlist}
  {\item}
\defbibheading{bibintoc}[参考文献]{\caustarchapter{#1}}
% The school asks for an appropriate space before Chinese "and others";
% its 12bp citation example measures 6bp. Keep bibliography delimiters and
% English word spaces unchanged. Follow biblatex's punctuation-space protocol.
\newrobustcmd*{\cau@addandothersspace}{%
  \unspace\blx@postpunct\nobreak\hskip0.5em\relax
  \blx@imc@resetpunctfont}
\DeclareDelimFormat[cite,parencite,textcite,citep,citet,authornumcite,pagescite]{andothersdelim}{%
  \iffieldequalstr{userf}{chinese}{\cau@addandothersspace}{\addspace}}
\DeclareDelimFormat[cite,parencite,textcite]{multinamedelim}{，}
\DeclareDelimFormat[cite,parencite,textcite]{finalnamedelim}{，}
\AtEveryCitekey{\defcounter{maxnames}{3}\defcounter{minnames}{1}%
  \iftoggle{abx@bool@morelabelname}
    {\defcounter{maxnames}{1}\defcounter{minnames}{1}}{}}
% Do not inherit authoryear-comp's hash/year compression or deferred closing
% delimiters. Each entry is independent, while biblatex still handles notes,
% sorting, name limits, hyperlinks and citation tracking.
\newbibmacro*{cau:cite:name}{%
  \ifnameundef{labelname}{\usebibmacro{cite:label}}{%
    \printtext[bibhyperref]{\printnames{labelname}}}}
\newbibmacro*{cau:cite}{%
  \iffieldundef{shorthand}{%
    \usebibmacro{cau:cite:name}\setunit{，}%
    \usebibmacro{cite:labeldate+extradate}%
  }{\usebibmacro{cite:shorthand}}}
\newbibmacro*{cau:textcite}{%
  \iffieldundef{shorthand}{%
    \usebibmacro{cau:cite:name}\setunit{\addthinspace}%
    \printtext{\mkbibleftborder}\setunit{}%
    \usebibmacro{cite:labeldate+extradate}\setunit{}%
    \printtext{\mkbibrightborder}%
  }{\usebibmacro{cite:shorthand}}}
\newbibmacro*{cau:postnote}{\iffieldundef{postnote}{}{%
  \iffieldundef{multipostnote}{}{\iffieldequalstr{multipostnote}{}{}{%
    \ClassError{cauthesis}{Conflicting citation page notes}{Use either
      per-group [page] notes or a global (page) note, not both.
      Otherwise adjacent superscripts could be read as one page number.}}}%
  \setunit{}\printtext{\mkbibsuperscript{\thefield{postnote}}}}}
\newcommand\cau@declareparencite[1]{%
  \DeclareCiteCommand{#1}
    {\printtext{\mkbibleftborder}\usebibmacro{prenote}}
    {\usebibmacro{citeindex}\usebibmacro{cau:cite}}
    {\setunit{\multicitedelim}}
    {\setunit{}\printtext{\mkbibrightborder}\usebibmacro{cau:postnote}}%
  \DeclareCiteCommand*{#1}
    {\printtext{\mkbibleftborder}\usebibmacro{prenote}}
    {\usebibmacro{citeindex}\usebibmacro{cite:labeldate+extradate}}
    {\setunit{\multicitedelim}}
    {\setunit{}\printtext{\mkbibrightborder}\usebibmacro{cau:postnote}}}
\newcommand\cau@declaretextcite[1]{%
  \DeclareCiteCommand{#1}
    {\usebibmacro{prenote}}
    {\usebibmacro{citeindex}\usebibmacro{cau:textcite}}
    {\setunit{\multicitedelim}}
    {\usebibmacro{cau:postnote}}}
\cau@declareparencite{\parencite}
\cau@declareparencite{\cite}
\cau@declareparencite{\citep}
\cau@declaretextcite{\textcite}
\cau@declaretextcite{\citet}
\cau@declaretextcite{\authornumcite}
\DeclareDelimcontextAlias{citep}{parencite}
\DeclareDelimcontextAlias{citet}{textcite}
\DeclareDelimcontextAlias{authornumcite}{textcite}
% Each multicite argument is a separate note-bearing group. No outer wrapper:
% (author, year)^page ; (author, year)^page. Emit separators BEFORE the next
% opening parenthesis rather than leaving them in biblatex's punctuation buffer.
\newcommand\cau@multicite[1]{\begingroup
  \renewbibmacro*{multipostnote}{\iffieldundef{multipostnote}{}{%
    \setunit{}\printtext{\mkbibsuperscript{\thefield{multipostnote}}}}}%
  #1\endgroup}
\DeclareMultiCiteCommand{\parencites}[\cau@multicite]{\parencite}{\multicitedelim}
\DeclareMultiCiteCommand{\cites}[\cau@multicite]{\cite}{\multicitedelim}
\DeclareMultiCiteCommand{\textcites}[\cau@multicite]{\textcite}{\multicitedelim}
\DeclareMultiCiteCommand{\citets}[\cau@multicite]{\citet}{\multicitedelim}
\DeclareMultiCiteCommand{\authornumcites}[\cau@multicite]{\authornumcite}{\multicitedelim}

% Editable metadata is deliberately separate from all page styling.
\def\cau@title{学位论文中文题目}
\def\cau@spinetitle{}
\def\cau@entitle{English Title of the Thesis}
\def\cau@author{作者姓名}
\def\cau@supervisor{导师姓名及职称}
\def\cau@cosupervisor{}
\def\cau@degreename{学位门类及级别}
\def\cau@major{专业名称}
\def\cau@direction{研究方向}
\def\cau@college{学院名称}
\def\cau@studentid{学籍编号}
\def\cau@classification{}
\def\cau@secrecy{}
\def\cau@date{XXXX年XX月}
\def\cau@wordmark{assets/cau-wordmark.png}
\define@key{cauinfo}{title}{\def\cau@title{#1}}
\define@key{cauinfo}{spine-title}{\def\cau@spinetitle{#1}}
\define@key{cauinfo}{title-en}{\def\cau@entitle{#1}}
\define@key{cauinfo}{author}{\def\cau@author{#1}}
\define@key{cauinfo}{supervisor}{\def\cau@supervisor{#1}}
\define@key{cauinfo}{co-supervisor}{\def\cau@cosupervisor{#1}}
\define@key{cauinfo}{degree-name}{\def\cau@degreename{#1}}
\define@key{cauinfo}{major}{\def\cau@major{#1}}
\define@key{cauinfo}{direction}{\def\cau@direction{#1}}
\define@key{cauinfo}{college}{\def\cau@college{#1}}
\define@key{cauinfo}{student-id}{\def\cau@studentid{#1}}
\define@key{cauinfo}{classification}{\def\cau@classification{#1}}
\define@key{cauinfo}{secrecy}{\def\cau@secrecy{#1}}
\define@key{cauinfo}{date}{\def\cau@date{#1}}
\define@key{cauinfo}{wordmark}{\def\cau@wordmark{#1}}
\newcommand\thesissetup[1]{\setkeys{cauinfo}{#1}}
\newcommand\cau@coverrow[2]{\noindent
  \makebox[49.5mm][s]{\xeCJKsetup{CJKglue={\hskip 0pt plus 1fill}}#1：}%
  \underline{\parbox[t]{67mm}{\centering\strut#2\strut}}\par\vspace{1.6mm}}
\newsavebox\cau@coverbox
\newcommand\makecover{%
  \clearpage\thispagestyle{empty}\hypersetup{pageanchor=false}
  \expandafter\causetpdftitle\expandafter{\cau@title}%
  \begin{lrbox}{\cau@coverbox}\begin{minipage}{\textwidth}
  \setlength\parindent{0pt}\songti\fontsize{12bp}{15.6bp}\selectfont
  \hspace*{24bp}\makebox[270bp][l]{分类号：\cau@classification}单位代码：10019\par
  \hspace*{24bp}\makebox[270bp][l]{密\quad 级：\cau@secrecy}学\quad 号：\cau@studentid\par
  \vspace{7.83mm}
  \begin{center}
    \IfFileExists{\cau@wordmark}{\includegraphics[width=103.5mm]{\cau@wordmark}}{%
      \ClassError{cauthesis}{School wordmark not found}{See README.md and NOTICE.md. Do not silently replace the school wordmark.}}\par
    \vspace{6mm}{\songti\fontsize{18bp}{24bp}\selectfont\cau@level 学位论文\par}
    \vspace{13.4mm}
    {\heiti\fontsize{22bp}{22bp}\selectfont\cau@title\par}
    \vspace{4.2mm}
    {\rmfamily\bfseries\fontsize{16bp}{18bp}\selectfont\cau@entitle\par}
  \end{center}
  \vspace{10mm}
  \noindent\hspace*{41.95bp}\begin{minipage}{116.5mm}
    \songti\fontsize{14bp}{21bp}\selectfont
    \cau@coverrow{研究生}{\cau@author}
    \cau@coverrow{指导教师}{\cau@supervisor}
    \cau@coverrow{合作指导教师}{\cau@cosupervisor}
    \cau@coverrow{申请学位门类级别}{\cau@degreename}
    \cau@coverrow{\cau@majorlabel}{\cau@major}
    \cau@coverrow{研究方向}{\cau@direction}
    \cau@coverrow{所在学院}{\cau@college}
  \end{minipage}\par
  \end{minipage}\end{lrbox}
  \ifdim\dimexpr\ht\cau@coverbox+\dp\cau@coverbox\relax>220mm
    \ClassError{cauthesis}{Cover content is too tall}{Shorten the title or metadata. Do not shrink the specified font sizes.}
  \fi
  \noindent\usebox\cau@coverbox\par
  \vfill\begin{center}\fontsize{14bp}{20bp}\selectfont\cau@date\end{center}\vspace*{28.85bp}
  \clearpage}

% The following institutional declaration is not relicensed under MIT.
% Source: the university's 2025 winter Word template. Preserve its wording.
\newcommand\makedeclaration{%
  \clearpage\thispagestyle{empty}\begingroup\cau@bodyfont
  \sbox\cau@coverbox{\makebox[\textwidth][c]{{\heiti\fontsize{22bp}{26bp}\selectfont
    独\enspace 创\enspace 性\enspace 声\enspace 明}}}%
  \noindent\rule{0pt}{\dimexpr\ht\cau@coverbox+4bp\relax}\usebox\cau@coverbox\par
  \vspace{6bp}
  \noindent\hspace*{24bp}本人声明所呈交的学位论文是我个人在导师指导下进行的研究工作及取得的研究成果。尽我所知，除了文中已经注明引用、已经声明生成式人工智能使用情况和致谢的内容外，论文中不包含其他人已经发表或撰写过的研究成果，不包含使用生成式人工智能直接生成的内容，也不包含本人为获得中国农业大学或其他教育机构的学位或证书而使用过的材料。与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表达了谢意。\par
  \vspace{32bp}\cau@signrow{学位论文作者签名}
  \vspace{72bp}
  \noindent\makebox[\textwidth][c]{{\heiti\fontsize{22bp}{26bp}\selectfont
    关于学位论文使用授权的说明}}\par
  \vspace{6bp}
  \noindent\hspace*{24bp}本人完全了解中国农业大学有关保留、使用学位论文的规定。本人同意中国农业大学有权保存及向国家有关部门和机构送交论文的纸质版和电子版，允许论文被查阅和借阅。\par
  \vspace{3.2bp}\noindent\hspace*{26.1bp}{\bfseries\fontsize{13bp}{20bp}\selectfont
    (保密的学位论文在解密后应遵守此协议)}\par
  \vspace{60.8bp}\cau@signrow{学位论文作者签名}
  \vspace{32bp}\cau@signrow{导师签名}
  \endgroup\clearpage\hypersetup{pageanchor=true}}
\newcommand\cau@signrow[1]{\noindent\hspace*{24bp}%
  \makebox[249bp][l]{#1：}时间：\hspace{60bp}年\hspace{18bp}月\hspace{18bp}日\par}

\ExplSyntaxOn
\tl_new:N \l_cau_vertical_tl
\tl_new:N \l_cau_pdf_title_tl
\cs_new_protected:Npn \cau_clear_layout:Nn #1#2
  {
    \regex_replace_all:nnN { \c{\\} \*? ( \[ [^\]]* \] )? } {#2} #1
    \regex_replace_all:nnN { \c{newline} } {#2} #1
  }
\cs_new_protected:Npn \causetpdftitle #1
  {
    \tl_set:Nn \l_cau_pdf_title_tl {#1}
    \cau_clear_layout:Nn \l_cau_pdf_title_tl {\c{space}}
    \hypersetup{pdftitle={\l_cau_pdf_title_tl},pdfauthor={\cau@author}}
  }
\cs_new_protected:Npn \cauvertical #1
  {
    \tl_set:Nn \l_cau_vertical_tl {#1}
    % Remove only documented cover-layout line breaks, including optional
    % spacing. Do not expand arbitrary title commands or strip grouped symbols.
    \cau_clear_layout:Nn \l_cau_vertical_tl {}
    \tl_map_inline:Nn \l_cau_vertical_tl {##1\par}
  }
\ExplSyntaxOff
\newcommand\causpine{\thispagestyle{empty}\centering
  \songti\fontsize{10.5bp}{14bp}\selectfont
  \ifdefempty{\cau@spinetitle}
    {\expandafter\cauvertical\expandafter{\cau@title}}
    {\expandafter\cauvertical\expandafter{\cau@spinetitle}}\vfill
  \expandafter\cauvertical\expandafter{\cau@author}\par}
% Word uses a 28bp first-line indent for these left-aligned labels.
% At the chapter opening, Word collapses the label's before-space into the
% chapter after-space. Formal-font calibration: title/label baselines differ
% by 31.92bp. A fixed 14+6bp line strut removes label-glyph-height variation;
% its 4.27bp correction applies ONLY to this opening label, not later labels.
\newcommand\cau@biographyheading[1]{\par
  {\if@nobreak
     \vspace{-4.27bp}%
     \def\cau@biographystrut{\rule[-6bp]{0pt}{20bp}}%
   \else
     \addvspace{6bp}\let\cau@biographystrut\relax
   \fi
   \raggedright\heiti\mdseries\fontsize{14bp}{20bp}\selectfont
   \noindent\hspace*{28bp}\cau@biographystrut #1：\par}\nobreak}
\newcommand\biographyitem[2]{\cau@biographyheading{#1}%
  {\cau@bodyfont\setlength\parindent{24bp}\indent #2\par}}
% Personal works use real bibliography drivers in a separate reference set.
% Do not restyle ordinary biography text or change the generic fullcite API.
\newcommand\biographypublications[2]{%
  \begin{refsection}\cau@biographyheading{#1}%
    \nocite{#2}\printbibliography[heading=none]%
  \end{refsection}}
\endinput
