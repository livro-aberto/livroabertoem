\def\fileversion{v2.0}
\def\filename{livroabertoem}
\def\filetitle{Livro Aberto class}
\def\filedate{2021/07/21}
\def\docdate{2021/07/21}
\def\aluno{1}


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{\filename}

\LoadClass{memoir}


\def\input@path{
	{definitions/}
	{class-options}
	{figures}
}


\RequirePackage{geometry}
\RequirePackage{xurl}
\RequirePackage{microtype}
\RequirePackage[low-sup]{subdepth}
\RequirePackage[dvips]{attachfile2}
\RequirePackage[export]{adjustbox}
\RequirePackage{marginfix}

\RequirePackage{multicol}
\RequirePackage{xstring}
\RequirePackage{mfirstuc} %To capitalize just the inicial letter of each word. There is a command to exclude specific words to captalize such like a, an, the, etc.
\RequirePackage{endnotes}
\RequirePackage{comment} % Comando excludecomment para remover os comandos do material do professor
\RequirePackage{xpatch}


\input{la-color-fonts.def}
\input{la-pageconfig.def}
\input{la-environments.def}
\input{la-titles.def}
\input{la-chapter.def}
\input{la-tikzconfig.sty}
\input{la-credits.def}
\input{la-lists.def}
\input{la-tables.def}
\input{la-hypersetup.def}



\newcommand{\sub}{\textsubscript}
\newcommand{\super}{\textsuperscript}


\newcommand{\semihuge}{\@setfontsize\semiHuge{16.72}{21.38}}


\tikzstyle{box} = [inner sep=3mm, inner ysep=3mm]

\newskip\libroskip{}

\libroskip= 4pt plus 1pt minus 1pt
\hfuzz=4pt


%Cor Explorando

\newcommand{\scexplore}[1]{\hypersetup{linkcolor=session1}\paragraph{\color{session1}\normalfont\Large\bfseries#1}\hypersetup{linkcolor=linkscolor}}
\newcommand{\scarrange}[1]{\hypersetup{linkcolor=session4}\paragraph{\color{session4}\normalfont\Large\bfseries#1}\hypersetup{linkcolor=linkscolor}}
\newcommand{\scpractice}[1]{\hypersetup{linkcolor=session2}\paragraph{\color{session2}\normalfont\Large\bfseries#1}\hypersetup{linkcolor=linkscolor}}
\newcommand{\scknow}[1]{\hypersetup{linkcolor=session2}\paragraph{\color{session3}\normalfont\Large\bfseries#1}\hypersetup{linkcolor=linkscolor}}
\newcommand{\scexercise}[1]{\hypersetup{linkcolor=cor1}\paragraph{\color{cor1}\normalfont\Large\bfseries#1}\hypersetup{linkcolor=linkscolor}}


\newcommand{\subexplore}[1]{\paragraph{\color{session1}\normalfont\Large\bfseries#1}}
\newcommand{\subarrange}[1]{\paragraph{\color{session4}\normalfont\Large\bfseries#1}}
\newcommand{\subpractice}[1]{\paragraph{\color{session2}\normalfont\Large\bfseries#1}}
\newcommand{\subknow}[1]{\paragraph{\color{session3}\normalfont\Large\bfseries#1}}
\newcommand{\subexercise}[1]{\paragraph{\color{cor1}\normalfont\Large\bfseries#1}}

		



% Define asymptote picture preamble

\RequirePackage[inline, attach]{asymptote}

\begin{asydef}
	import three;
	import graph3;
	import solids;
	import math;
	import labelpath3;
	import labelpath;
	settings.render=16;
	//attach=true;

	pen azul = rgb (0,94/255,176/255); //azul
	pen verde = rgb (75/255,173/255,49/255); //verde
	pen vinho = rgb (183/255,13/255,40/255); //vinho
	pen laranja = rgb (236/255,107/255,16/255); //laranja
	pen agua = rgb (0,165/255,157/255); //verde agua
	pen box2 = rgb (240/255,238/255,201/255);


	texpreamble("
		\usepackage{fontspec}
		\setmainfont{Exo2-Light.ttf}[
			BoldFont = Exo2-Medium.ttf,
			ItalicFont = Exo2-LightItalic.ttf,
			BoldItalicFont = Exo2-MediumItalic.ttf
		]
	");
\end{asydef}





%Seção 7 - Livro Aberto Professor
%***************************************************************************************
%
%This section configures the aluno document to be able to compile the professor material
%


%%%%%%%%%%%%%%% ENDNOTES





%Caixa de Obetivos gerais
\newtcolorbox{habilities}[1]{}

%Caixa de Objetivos Específicos
\newenvironment{objectives}[4]{}{}{}

%Caixa de Sugestões e recomendações
\newenvironment{sugestions}[4]{}{}{}

%Caixa de Respostas
\newenvironment{answer}[3]{}{}

%Caixa de Texto
\newenvironment{texto}[1]{}

\newcommand{\notarodape}[1]{
	\footnotemark\footnotetext{
		\belowbaseline[-\ht\strutbox]{
			\begin{tcolorbox}[
				colback=grafite!90!white,
				colbacktitle=grafite!90!white,
				colframe=grafite!90!white,
				colupper=white, 
				left=0pt, 
				right=0pt,
				top=-2pt,
				bottom=-2pt, 
				hbox, 
				sharp corners = northeast, 
				sharp corners = southwest
			]{\textbf{#1}}
			\end{tcolorbox}
		}
	}
}





%%%%%%%%%%%% Material do professor

\DeclareOption{professor}
{

\def\aluno=0

%%%%%%%%%%%%%%% ENDNOTES

\newcommand{\@endnotebox}[1]{%
	\tikz[baseline =(numbereditem.base)]{%
		\node[shape=enumbox,text=linkscolor, font=\fontsize{11pt}{0}\selectfont\bfseries,
			fill=box2!70, drop shadow,
			minimum width=4.00mm, minimum height=3.00mm,sharp corners] (numbereditem) {#1};
	}
}

\newcommand{\notebox}[1]{%
	\tikz[baseline = (numbereditem.base)]{%
		\node[shape=enumbox,text=linkscolor, font=\fontsize{11pt}{0}\selectfont\bfseries,
			fill=box2!70, drop shadow,
			minimum width=16.0mm, minimum height=3.00mm,sharp corners, align=left] (numbereditem) {#1};
	}
}

\def\enotesize{\normalsize}
%%% hyperendnotes.sty
\newif\ifenotelinks
\newcounter{Hendnote}
% Redefining portions of endnotes-package:
\let\savedhref\href
\let\savedurl\url
\def\endnotemark{%
\@ifnextchar[\@xendnotemark{%
	\stepcounter{endnote}%
	\protected@xdef\@theenmark{\textbf{Nota \theendnote}}%
	\protected@xdef\@theenvalue{\number\c@endnote}%
	\@endnotemark
}%
}%
\def\@xendnotemark[#1]{%
	\begingroup\c@endnote#1\relax
	\unrestored@protected@xdef\@theenmark{\theendnote}%
	\unrestored@protected@xdef\@theenvalue{\number\c@endnote}%
	\endgroup
	\@endnotemark
}%
\def\endnotetext{%
\@ifnextchar[\@xendnotenext{%
	\protected@xdef\@theenmark{\theendnote}%
	\protected@xdef\@theenvalue{\number\c@endnote}%
	\@endnotetext
}%
}%
\def\@xendnotenext[#1]{%
	\begingroup
	\c@endnote=#1\relax
	\unrestored@protected@xdef\@theenmark{\theendnote}%
	\unrestored@protected@xdef\@theenvalue{\number\c@endnote}%
	\endgroup
	\@endnotetext
}%
\def\endnote{%
\@ifnextchar[\@xendnote{%
	\stepcounter{endnote}%
	\protected@xdef\@theenmark{\theendnote}%
	\protected@xdef\@theenvalue{\number\c@endnote}%
	\@endnotemark\@endnotetext
}%
}%
\def\@xendnote[#1]{%
	\begingroup
	\c@endnote=#1\relax
	\unrestored@protected@xdef\@theenmark{\theendnote}%
	\unrestored@protected@xdef\@theenvalue{\number\c@endnote}%
	\show\@theenvalue
	\endgroup
	\@endnotemark\@endnotetext
}%
\def\@endnotemark{%
\leavevmode
\ifhmode
	\edef\@x@sf{\the\spacefactor}\nobreak
\fi
\ifenotelinks
	\expandafter\@firstofone
\else
	\expandafter\@gobble
\fi
{%
\Hy@raisedlink{%
	\hyper@@anchor{Hendnotepage.\@theenvalue}{\empty}%
}%
}%
\hyper@linkstart{link}{Hendnote.\@theenvalue}%
\makeenmark
\hyper@linkend
\ifhmode
	\spacefactor\@x@sf
\fi
\relax
}%
\long\def\@endnotetext#1{%
	\if@enotesopen
	\else
		\@openenotes
	\fi
	\immediate\write\@enotes{%
		\@doanenote{\@theenmark}{\@theenvalue}%
	}%
	\begingroup
	\def\next{#1}%
	\newlinechar='40
	\immediate\write\@enotes{\meaning\next}%
	\endgroup
	\immediate\write\@enotes{%
		\@endanenote
	}%
}%
\def\theendnotes{%
\immediate\closeout\@enotes
\global\@enotesopenfalse
\begingroup
\edef\@tempa{`\string>}%
\ifnum\catcode\@tempa=12
	\let\@ResetGT\relax
\else
	\edef\@ResetGT{\noexpand\catcode\@tempa=\the\catcode\@tempa}%
	\@makeother\>%
\fi
\def\@doanenote##1##2##3>{%
\def\@theenmark{##1}%
\def\@theenvalue{##2}%
\par
\smallskip %<-small vertical gap between endnotes
\begingroup
\def\href{\expandafter\savedhref}%
\def\url{\expandafter\savedurl}%
\@ResetGT
\edef\@currentlabel{\csname p@endnote\endcsname\@theenmark}%
\enoteformat
}%
\def\@endanenote{%
	\par\endgroup
}%
% Redefine, how numbers are formatted in the endnotes-section:
\renewcommand\@makeenmark{%
	\normalfont\protect\@endnotebox{\@theenmark}~%
}%
% header of endnotes-section
% \enoteheading
% font-size of endnotes
\enotesize
\input{\jobname.ent}%
\endgroup
}%
\def\enoteformat{%
\rightskip\z@
\leftskip1.8em
\parindent\z@
\leavevmode\llap{%
\setcounter{Hendnote}{\@theenvalue}%
\addtocounter{Hendnote}{-1}%
\refstepcounter{Hendnote}%
\ifenotelinks
	\expandafter\@secondoftwo
\else
	\expandafter\@firstoftwo
\fi
{\@firstofone}%
{\hyperlink{Hendnotepage.\@theenvalue}}%
{\makeenmark}%
}%
}%

% Toggle switch in order to turn on/off back-links in the
% endnote-section:
\enotelinkstrue
%\enotelinksfalse



\renewcommand{\notesname}{Notas}

%\def\@makeenmark{\hbox{\@textsuperscript{\normalfont\@theenmark}}}
\def\@makeenmark{\hbox{\normalfont\@theenmark}}

\newcommand\notasfig[1]{
	\notebox{\textcolor{white}{\textbf{\endnotemark}}}
	\endnotetext
	{\adjustbox{valign=t}
		{
			\begin{minipage}{\linewidth}
				#1
			\end{minipage}
		}}}

\newcommand{\notas}[1]{
	\notebox{\textcolor{white}{\textbf{\endnotemark}}}
	\endnotetext
	{#1}}

\newcommand{\mnotas}[1]{
	\marginpar{
		\notebox{\textcolor{white}{\textbf{\endnotemark}}}
		\endnotetext
		{\adjustbox{valign=t}{#1}}}}


\newcommand{\notasfinais}{
	\def\currentcolor{cor1}
	\newgeometry{textwidth=840pt,outer=50pt, top=2cm, bottom=2cm}
	\pagestyle{plain}	
	\section{\huge Notas}

	\setlength{\columnsep}{1cm}
	\begin{multicols}{2}
		\raggedcolumns
		\theendnotes
		\clearpage
	\end{multicols}
	\restoregeometry
}

\newenvironment{paginanotas}{
	\newgeometry{textwidth=840pt,outer=50pt}
	\pagestyle{empty}
	\begin{multicols}{4}
}
{
	\clearpage
	\end{multicols}
	\pagebreak
	\restoregeometry
}

%%%%%%%%%%%%%%%%  PÁGINA DE TEXTO

\newcounter{mypresentation}
\setcounter{mypresentation}{0}

\newenvironment{apresentacao}[1]
{
	\setcounter{mypresentation}{\value{page}}
	\def\currentcolor{cor1}
	\newgeometry{textwidth=840pt,outer=50pt, bottom=17mm, top=17mm}
	\pagestyle{plain}
	\setlist[enumerate]{wide, label=\titem{\alph*)},itemsep=0pt,topsep=2.5pt}
	\setlist[itemize]{wide, label=\textcolor{\currentcolor}{\small$\blacksquare$}, topsep=5pt}
	\section{#1}
	\begin{multicols}{2}}
		{\clearpage\end{multicols}
	\setlist[enumerate]{label=\protect\enumbox{\alph*)}}
	%\setlist[itemize]{label=\protect\itembox}
	\setlist[itemize]{label=\protect\itemcoloredsquare}
	\pagebreak\restoregeometry
	\mainmatter
	\def\currentcolor{session1}
	\cleardoublepage
	\setcounter{page}{\value{mypresentation}}
}

\newcounter{mypagecount}
\setcounter{mypagecount}{0}

\newenvironment{paginatexto}[1]
{
	\clearpage
	\setcounter{mypagecount}{\value{page}}
	\cleardoublepage
	\setcounter{mypagecount}{\value{page}}
	\def\currentcolor{session1}
	\newgeometry{textwidth=840pt,outer=50pt, bottom=17mm, top=17mm}

	\thispagestyle{empty}\pagestyle{empty}
	\setlist[enumerate]{wide, label=\titem{\alph*)},itemsep=0pt,topsep=2.5pt}
	\setlist[itemize]{wide, label=\textcolor{\currentcolor}{\small$\blacksquare$}, topsep=5pt}
	\section{#1}
	\begin{multicols}{2}
}{
	\clearpage
	\end{multicols}
	\setlist[enumerate]{label=\protect\enumbox{\alph*)}}
	%\setlist[itemize]{label=\protect\itembox}
	\setlist[itemize]{label=\protect\itemcoloredsquare}
	\def\currentcolor{session1}\pagebreak\restoregeometry\cleardoublepage\setcounter{page}{\value{mypagecount}}
}



%%%%%%%%%%%%% CAIXA DE TEXTO


\renewenvironment{texto}[1]
{\marginpar{
		\setlength\parskip{6pt}
		\vspace{.05em}
		\setlist[enumerate]{label=OE\arabic*,wide}
		\setlist[itemize,1]{wide, label=\textcolor{\currentcolor}{\small$\blacksquare$}, topsep=5pt}

		#1}
}



%%%%%%%%%%%%% CAIXA DE OBJETIVO ESPECÍFICO

\renewenvironment{objectives}[4]
{\ifnum #3=1
		{\ifnum #4=1

			\marginpar{\vspace{.05em}\begin{tcolorbox}[blanker, enhanced, enforce breakable, before skip = 5mm, after skip = 5mm, colframe=\currentcolor, left=3mm, top=6mm,segmentation style={draw=none,fill=none}, bottom=3mm, colback=white, %colframe=box1,
						borderline east={2mm}{0pt}{white}, toprule=1pt, bottomrule=1pt, leftrule=1pt, rightrule=-1pt, outer arc = 3mm, arc = 3mm,
						fonttitle=\bfseries\large,  % Should be 12 pt. Don't know how to set this.
						title= Objetivos Específicos,
						boxed title style={empty,arc=0pt,outer arc=0pt,boxrule=0pt},
						attach boxed title to top right={yshift=.5mm-.8pt},
						underlay boxed title={
								\draw[line width=3pt,white] ($(frame.north east)+(0,-1pt)$)--($(frame.north east)+(-15pt,-1pt)$);
								\filldraw [\currentcolor] ($(title.north west) + (0 mm,-3.50mm)$) -- ++(0.00mm,2.5mm) arc [start angle=180, end angle=90, y radius=2.00mm, x radius=2.00mm] -| ($(title.north east)+(0,-5mm)$) arc [start angle=0, end angle=-90, x radius=2.00mm, y radius=2.00mm] -| cycle;
							}, after={\setlist[enumerate]{label=\protect\enumbox{\alph*)}}
								%\setlist[itemize]{label=\protect\itembox}
								\setlist[itemize]{label=\protect\itemcoloredsquare}},
						before upper={\setlength{\parskip}{6pt}\vspace{-15pt}\tcbsubtitle{#1}
								\normalfont\setlist[enumerate]{label=OE\arabic*,wide}\setlist[itemize,1]{wide, label=\textcolor{\currentcolor}{\small$\blacksquare$}, topsep=2.5pt, itemsep=0pt}},
						% {\boxtitlefont\setlist[enumerate]{label=OE\arabic*,wide}\setlist[itemize,1]{wide, label=\textcolor{penaqua}{\small$\blacksquare$}}
						% {\vspace{1em}\large\textbf{Levar o aluno a}}\normalsize},
						subtitle style = {
								frame empty,
								fontupper = \bfseries\large,
								colback = white,
								coltext = \currentcolor,
								arc = 8pt,
								top=0pt,
								bottom=0pt
							},
						middle=5pt,
						break at=-\baselineskip/0pt] #2 \end{tcolorbox}}


		\else

			\marginpar{\vspace{.05em}\begin{tcolorbox}[blanker, enhanced, enforce breakable, before skip = 5mm, after skip = 5mm, colframe=\currentcolor, right=3mm, top=6mm,segmentation style={draw=none,fill=none}, bottom=3mm, colback=white, %colframe=box1,
						borderline west={2mm}{0pt}{white}, toprule=1pt, bottomrule=1pt, rightrule=1pt, leftrule=-1pt, outer arc = 3mm, arc = 3mm,
						fonttitle=\bfseries\large,  % Should be 12 pt. Don't know how to set this.
						title= Objetivos Específicos,
						boxed title style={empty,arc=0pt,outer arc=0pt,boxrule=0pt},
						attach boxed title to top left={yshift=.5mm-.8pt},
						underlay boxed title={
								\draw[line width=3pt,white] ($(frame.north west)+(0,-1pt)$)--($(frame.north west)+(15pt,-1pt)$);
								\filldraw [\currentcolor] ($(title.north west) + (0 mm,-3.50mm)$) -- ++(0.00mm,2.5mm) arc [start angle=180, end angle=90, y radius=2.00mm, x radius=2.00mm] -| ($(title.north east)+(0,-5mm)$) arc [start angle=0, end angle=-90, x radius=2.00mm, y radius=2.00mm] -| cycle;
							}, after={\setlist[enumerate]{label=\protect\enumbox{\alph*)}}
								%\setlist[itemize]{label=\protect\itembox}
								\setlist[itemize]{label=\protect\itemcoloredsquare}},
						before upper={\setlength{\parskip}{6pt}\vspace{-15pt}\tcbsubtitle{#1}
								\normalfont\setlist[enumerate]{label=OE\arabic*,wide}\setlist[itemize,1]{wide, label=\textcolor{\currentcolor}{\small$\blacksquare$}, topsep=2.5pt, itemsep=0pt}},
						% {\boxtitlefont\setlist[enumerate]{label=OE\arabic*,wide}\setlist[itemize,1]{wide, label=\textcolor{penaqua}{\small$\blacksquare$}}
						% {\vspace{1em}\large\textbf{Levar o aluno a}}\normalsize},
						subtitle style = {
								frame empty,
								fontupper = \bfseries\large,
								colback = white,
								coltext = \currentcolor,
								arc = 8pt,
								top=0pt,
								bottom=0pt
							},
						middle=5pt,
						break at=-\baselineskip/0pt] #2 \end{tcolorbox}}

		\fi}


	\else

		{\ifnum #4=9

				\marginpar{\notebox{\textcolor{white}{\textbf{\endnotemark}}}}



				\endnotetext{\vspace{-1.75\baselineskip}
					\begin{tcolorbox}[blanker, breakable, enhanced, before skip = 5mm, after skip = 5mm, colframe=\currentcolor,left=3mm, right=3mm, top=6mm,segmentation style={draw=none,fill=none}, bottom=3mm, colback=white, %colframe=box1,
							borderline west={3mm}{0pt}{white}, toprule=1pt, bottomrule=1pt, rightrule=1pt, leftrule=-1pt, outer arc = 3mm, arc = 3mm,
							fonttitle=\bfseries\large,  % Should be 12 pt. Don't know how to set this.
							title= Objetivos Específicos,
							boxed title style={empty,arc=0pt,outer arc=0pt,boxrule=0pt},
							attach boxed title to top left={xshift=3mm , yshift=.5mm-.8pt},
							underlay boxed title={
									\draw[line width=3pt,white] ($(frame.north west)+(0,-1pt)$)--($(frame.north west)+(15pt,-1pt)$);
									\filldraw [\currentcolor] ($(title.north west) + (0 mm,-3.50mm)$) -- ++(0.00mm,2.5mm) arc [start angle=180, end angle=90, y radius=2.00mm, x radius=2.00mm] -| ($(title.north east)+(0,-5mm)$) arc [start angle=0, end angle=-90, x radius=2.00mm, y radius=2.00mm] -| cycle;
								},  after={\setlist[enumerate]{label=\protect\enumbox{\alph*)}}
									%\setlist[itemize]{label=\protect\itembox}
									\setlist[itemize]{label=\protect\itemcoloredsquare}},
							before upper={\setlength{\parskip}{6pt}\vspace{-15pt}\tcbsubtitle{#1}
									\normalfont\setlist[enumerate]{label=OE\arabic*,wide}\setlist[itemize,1]{wide, label=\textcolor{\currentcolor}{\small$\blacksquare$}, , topsep=2.5pt, itemsep=0pt}},
							% {\boxtitlefont\setlist[enumerate]{label=OE\arabic*,wide}\setlist[itemize,1]{wide, label=\textcolor{penaqua}{\small$\blacksquare$}}
							% {\vspace{1em}\large\textbf{Levar o aluno a}}\normalsize},
							subtitle style = {
									frame empty,
									fontupper = \bfseries\large,
									colback = white,
									coltext = \currentcolor,
									arc = 8pt,
									top=0pt,
									bottom=0pt
								},
							middle=5pt,
							break at=-\baselineskip/0pt] #2 \end{tcolorbox}

				}

			\else

				\marginpar{\notebox{\textcolor{white}{\textbf{\endnotemark}}}}


				\endnotetext{\adjustbox{valign=t}
					{\begin{tcolorbox}[blanker, breakable, enhanced, before skip = 5mm, after skip = 5mm, colframe=\currentcolor,left=3mm, right=3mm, top=6mm,segmentation style={draw=none,fill=none}, bottom=3mm, colback=white, %colframe=box1,
								borderline west={3mm}{0pt}{white}, toprule=1pt, bottomrule=1pt, rightrule=1pt, leftrule=-1pt, outer arc = 3mm, arc = 3mm,
								fonttitle=\bfseries\large,  % Should be 12 pt. Don't know how to set this.
								title= Objetivos Específicos,
								boxed title style={empty,arc=0pt,outer arc=0pt,boxrule=0pt},
								attach boxed title to top left={xshift=3mm , yshift=.5mm-.8pt},
								underlay boxed title={
										\draw[line width=3pt,white] ($(frame.north west)+(0,-1pt)$)--($(frame.north west)+(15pt,-1pt)$);
										\filldraw [\currentcolor] ($(title.north west) + (0 mm,-3.50mm)$) -- ++(0.00mm,2.5mm) arc [start angle=180, end angle=90, y radius=2.00mm, x radius=2.00mm] -| ($(title.north east)+(0,-5mm)$) arc [start angle=0, end angle=-90, x radius=2.00mm, y radius=2.00mm] -| cycle;
									},  after={\setlist[enumerate]{label=\protect\enumbox{\alph*)}}
										%\setlist[itemize]{label=\protect\itembox}
										\setlist[itemize]{label=\protect\itemcoloredsquare}},
								before upper={\setlength{\parskip}{6pt}\vspace{-15pt}\tcbsubtitle{#1}
										\normalfont\setlist[enumerate]{label=OE\arabic*,wide}\setlist[itemize,1]{wide, label=\textcolor{\currentcolor}{\small$\blacksquare$}, , topsep=2.5pt, itemsep=0pt}},
								% {\boxtitlefont\setlist[enumerate]{label=OE\arabic*,wide}\setlist[itemize,1]{wide, label=\textcolor{penaqua}{\small$\blacksquare$}}
								% {\vspace{1em}\large\textbf{Levar o aluno a}}\normalsize},
								subtitle style = {
										frame empty,
										fontupper = \bfseries\large,
										colback = white,
										coltext = \currentcolor,
										arc = 8pt,
										top=0pt,
										bottom=0pt
									},
								middle=5pt,
								break at=-\baselineskip/0pt] #2 \end{tcolorbox}}

				}
			\fi}
	\fi}
{\setlist[enumerate]{label=\protect\enumbox{\alph*)}}
	%\setlist[itemize]{label=\protect\itembox}
	\setlist[itemize]{label=\protect\itemcoloredsquare}}



%%%%%%%%%%%%% CAIXA DE ORIENTAÇÃO


\renewenvironment{sugestions}[4]
{\ifnum #3=1
		{\ifnum #4=1

			\marginpar{\vspace{.05em}\begin{tcolorbox}[blanker, enhanced, enforce breakable, before skip = 5mm, after skip = 5mm, colframe=\currentcolor, left=3mm, top=6mm,segmentation style={draw=none,fill=none}, bottom=3mm, colback=white, %colframe=box1,
						borderline east={2mm}{0pt}{white}, toprule=1pt, bottomrule=1pt, leftrule=1pt, rightrule=-1pt, outer arc = 3mm, arc = 3mm,
						fonttitle=\bfseries\large,  % Should be 12 pt. Don't know how to set this.
						title= Sugestões e discussões,
						boxed title style={empty,arc=0pt,outer arc=0pt,boxrule=0pt},
						attach boxed title to top right={ , yshift=.5mm-.2pt},
						underlay boxed title={
								\draw[line width=3pt,white] ($(frame.north east)+(0,-1pt)$)--($(frame.north east)+(-15pt,-1pt)$);
								\filldraw [\currentcolor] ($(title.north west) + (0 mm,-3.50mm)$) -- ++(0.00mm,2.5mm) arc [start angle=180, end angle=90, y radius=2.00mm, x radius=2.00mm] -| ($(title.north east)+(0,-5mm)$) arc [start angle=0, end angle=-90, x radius=2.00mm, y radius=2.00mm] -| cycle;
							},  after={\setlist[enumerate]{label=\protect\enumbox{\alph*)}}
								%\setlist[itemize]{label=\protect\itembox}
								\setlist[itemize]{label=\protect\itemcoloredsquare}},
						before upper={\setlength{\parskip}{6pt}\vspace{-15pt}\tcbsubtitle{#1}
								\normalfont\setlist[enumerate]{wide}\setlist[itemize,1]{wide, label=\textcolor{\currentcolor}{\small$\blacksquare$}, , topsep=2.5pt, itemsep=0pt}},
						% {\boxtitlefont\setlist[enumerate]{label=OE\arabic*,wide}\setlist[itemize,1]{wide, label=\textcolor{penaqua}{\small$\blacksquare$}}
						% {\vspace{1em}\large\textbf{Levar o aluno a}}\normalsize},
						subtitle style = {
								frame empty,
								fontupper = \bfseries\large,
								colback = white,
								coltext = \currentcolor,
								arc = 8pt,
								top=0pt,
								bottom=0pt
							},
						middle=5pt,
						break at=-\baselineskip/0pt] #2 \end{tcolorbox}}


		\else


			\marginpar{\vspace{.05em}\begin{tcolorbox}[blanker, enhanced, enforce breakable, before skip = 5mm, after skip = 5mm, colframe=\currentcolor, right=3mm, top=6mm,segmentation style={draw=none,fill=none}, bottom=3mm, colback=white, %colframe=box1,
						borderline west={2mm}{0pt}{white}, toprule=1pt, bottomrule=1pt, rightrule=1pt, leftrule=-1pt, outer arc = 3mm, arc = 3mm,
						fonttitle=\bfseries\large,  % Should be 12 pt. Don't know how to set this.
						title= Sugestões e discussões,
						boxed title style={empty,arc=0pt,outer arc=0pt,boxrule=0pt},
						attach boxed title to top left={ , yshift=.5mm-.2pt},
						underlay boxed title={
								\draw[line width=3pt,white] ($(frame.north west)+(0,-1pt)$)--($(frame.north west)+(15pt,-1pt)$);
								\filldraw [\currentcolor] ($(title.north west) + (0 mm,-3.50mm)$) -- ++(0.00mm,2.5mm) arc [start angle=180, end angle=90, y radius=2.00mm, x radius=2.00mm] -| ($(title.north east)+(0,-5mm)$) arc [start angle=0, end angle=-90, x radius=2.00mm, y radius=2.00mm] -| cycle;
							},  after={\setlist[enumerate]{label=\protect\enumbox{\alph*)}}
								%\setlist[itemize]{label=\protect\itembox}
								\setlist[itemize]{label=\protect\itemcoloredsquare}},
						before upper={\setlength{\parskip}{6pt}\vspace{-15pt}\tcbsubtitle{#1}
								\normalfont\setlist[enumerate]{wide}\setlist[itemize,1]{wide, label=\textcolor{\currentcolor}{\small$\blacksquare$}, , topsep=2.5pt, itemsep=0pt}},
						% {\boxtitlefont\setlist[enumerate]{label=OE\arabic*,wide}\setlist[itemize,1]{wide, label=\textcolor{penaqua}{\small$\blacksquare$}}
						% {\vspace{1em}\large\textbf{Levar o aluno a}}\normalsize},
						subtitle style = {
								frame empty,
								fontupper = \bfseries\large,
								colback = white,
								coltext = \currentcolor,
								arc = 8pt,
								top=0pt,
								bottom=0pt
							},
						middle=5pt,
						break at=-\baselineskip/0pt] #2 \end{tcolorbox}}
		\fi}


	\else
		{\ifnum #4=9

				\marginpar{\notebox{\textcolor{white}{\textbf{\endnotemark}}}\vspace{.05em}}

				\endnotetext{
					{\vspace{-2\baselineskip}
							\begin{tcolorbox}[blanker, enhanced, breakable, before skip = 5mm, after skip = 5mm, colframe=\currentcolor,left=3mm, right=4mm, top=6mm,segmentation style={draw=none,fill=none}, bottom=3mm, colback=white, %colframe=box1,
									borderline west={3mm}{0pt}{white}, toprule=1pt, bottomrule=1pt, rightrule=1pt, leftrule=-1pt, outer arc = 3mm, arc = 3mm,
									fonttitle=\bfseries\large,  % Should be 12 pt. Don't know how to set this.
									title= Sugestões e discussões,
									boxed title style={empty,arc=0pt,outer arc=0pt,boxrule=0pt},
									attach boxed title to top left={xshift=3mm , yshift=.5mm-.2pt},
									underlay boxed title={
											\draw[line width=3pt,white] ($(frame.north west)+(0,-1pt)$)--($(frame.north west)+(15pt,-1pt)$);
											\filldraw [\currentcolor] ($(title.north west) + (0 mm,-3.50mm)$) -- ++(0.00mm,2.5mm) arc [start angle=180, end angle=90, y radius=2.00mm, x radius=2.00mm] -| ($(title.north east)+(0,-5mm)$) arc [start angle=0, end angle=-90, x radius=2.00mm, y radius=2.00mm] -| cycle;
										},
									after={\setlist[enumerate]{label=\protect\enumbox{\alph*)}}
											%\setlist[itemize]{label=\protect\itembox}
											\setlist[itemize]{label=\protect\itemcoloredsquare}},
									before upper={\setlength{\parskip}{6pt}\vspace{-15pt}\tcbsubtitle{#1}
											\normalfont\setlist[enumerate]{wide}\setlist[itemize,1]{wide, label=\textcolor{\currentcolor}{\small$\blacksquare$}, , topsep=2.5pt, itemsep=0pt}},
									% {\boxtitlefont\setlist[enumerate]{label=OE\arabic*,wide}\setlist[itemize,1]{wide, label=\textcolor{penaqua}{\small$\blacksquare$}}
									% {\vspace{1em}\large\textbf{Levar o aluno a}}\normalsize},
									subtitle style = {
											frame empty,
											fontupper = \bfseries\large,
											colback = white,
											coltext = \currentcolor,
											arc = 8pt,
											top=0pt,
											bottom=0pt
										},
									middle=5pt,
									break at=-\baselineskip/0pt] #2 \end{tcolorbox}}


				}

			\else

				\marginpar{\notebox{\textcolor{white}{\textbf{\endnotemark}}}}

				\endnotetext{\adjustbox{valign=t}
					{
						\begin{tcolorbox}[blanker, enhanced, breakable, before skip = 5mm, after skip = 5mm, colframe=\currentcolor,left=3mm, right=3mm, top=6mm,segmentation style={draw=none,fill=none}, bottom=3mm, colback=white, %colframe=box1,
								borderline west={3mm}{0pt}{white}, toprule=1pt, bottomrule=1pt, rightrule=1pt, leftrule=-1pt, outer arc = 3mm, arc = 3mm,
								fonttitle=\bfseries\large,  % Should be 12 pt. Don't know how to set this.
								title= Sugestões e discussões,
								boxed title style={empty,arc=0pt,outer arc=0pt,boxrule=0pt},
								attach boxed title to top left={xshift=3mm , yshift=.5mm-.2pt},
								underlay boxed title={
										\draw[line width=3pt,white] ($(frame.north west)+(0,-1pt)$)--($(frame.north west)+(15pt,-1pt)$);
										\filldraw [\currentcolor] ($(title.north west) + (0 mm,-3.50mm)$) -- ++(0.00mm,2.5mm) arc [start angle=180, end angle=90, y radius=2.00mm, x radius=2.00mm] -| ($(title.north east)+(0,-5mm)$) arc [start angle=0, end angle=-90, x radius=2.00mm, y radius=2.00mm] -| cycle;
									},  after={\setlist[enumerate]{label=\protect\enumbox{\alph*)}}
										%\setlist[itemize]{label=\protect\itembox}
										\setlist[itemize]{label=\protect\itemcoloredsquare}},
								before upper={\setlength{\parskip}{6pt}\vspace{-15pt}\tcbsubtitle{#1}
										\normalfont\setlist[enumerate]{wide}\setlist[itemize,1]{wide, label=\textcolor{\currentcolor}{\small$\blacksquare$}, , topsep=2.5pt, itemsep=0pt}},
								% {\boxtitlefont\setlist[enumerate]{label=OE\arabic*,wide}\setlist[itemize,1]{wide, label=\textcolor{penaqua}{\small$\blacksquare$}}
								% {\vspace{1em}\large\textbf{Levar o aluno a}}\normalsize},
								subtitle style = {
										frame empty,
										fontupper = \bfseries\large,
										colback = white,
										coltext = \currentcolor,
										arc = 8pt,
										top=0pt,
										bottom=0pt
									},
								middle=5pt,
								break at=-\baselineskip/0pt] #2 \end{tcolorbox}}
				}
			\fi}
	\fi}{\setlist[enumerate]{label=\protect\enumbox{\alph*)}}
	%\setlist[itemize]{label=\protect\itembox}
	\setlist[itemize]{label=\protect\itemcoloredsquare}}


\setlist[enumerate]{label=\protect\bfseries\textcolor{\currentcolor}{\alph*)}}



%%%%%%%%%%%%% CAIXA DE RESPOSTA
\renewenvironment{answer}[3]
{\ifnum #3=1
		\marginpar{\begin{tcolorbox}[enhanced, breakable,empty, coltitle=penazul, colback=white!50, left=0mm, right=0mm, boxrule=0mm, boxsep=0mm, colframe=penaqua,colbacktitle=white, before title ={\boxtitlefont \textcolor{\currentcolor}{Solução: }}, title= \textcolor{grafite}{#1},
					before upper={ \setlength{\parskip}{6pt}\setlist[enumerate]{label=wide,left=0pt,label=\protect\bfseries\textcolor{\currentcolor}{\alph*)}}},
					subtitle style = {
							frame empty,
							fontupper = \boxtitlefont,
							colback = white,
							coltext = grafite,
							top=1em,
							before upper = \boxtitlefont \textcolor{\currentcolor}{Solução: }}]
				#2\end{tcolorbox}}
	\else
		{\ifnum #3=9

				\marginpar{\notebox{\textcolor{white}{\textbf{\endnotemark}}}}

				\endnotetext{\vspace{-1.35\baselineskip}
					\begin{tcolorbox}[enhanced, breakable,empty, coltitle=penazul, colback=white, left=0mm, right=0mm, boxrule=0mm, boxsep=0mm, colframe=penaqua,colbacktitle=white, before title ={\boxtitlefont \textcolor{\currentcolor}{Solução: }}, title= \textcolor{grafite}{#1}, before upper={\setlength{\parskip}{6pt}\vspace{.3em}
									\setlist[enumerate]{label=wide,left=0pt,label=\protect\bfseries\textcolor{\currentcolor}{\alph*)}}
									\setlist[enumerate,2]{label=\protect\bfseries\textcolor{\currentcolor}{\roman*)}}
								},
							subtitle style = {
									frame empty,
									fontupper = \boxtitlefont,
									colback = white,
									coltext = grafite,
									top=1em,
									before upper = \boxtitlefont \textcolor{\currentcolor}{Solução: }}]
						#2\end{tcolorbox}}

			\else
				\marginpar{\notebox{\textcolor{white}{\textbf{\endnotemark}}}}

				\endnotetext{\adjustbox{valign=t}
					{

						\begin{tcolorbox}[enhanced, breakable,empty, coltitle=penazul, colback=white, left=0mm, right=0mm, boxrule=0mm, boxsep=0mm, colframe=penaqua,colbacktitle=white, before title ={\boxtitlefont \textcolor{\currentcolor}{Solução: }}, title= \textcolor{grafite}{#1}, before upper={\setlength{\parskip}{6pt}\vspace{.3em}
										\setlist[enumerate]{label=wide,left=0pt,label=\protect\bfseries\textcolor{\currentcolor}{\alph*)}}
										\setlist[enumerate,2]{label=\protect\bfseries\textcolor{\currentcolor}{\roman*)}}
									},
								subtitle style = {
										frame empty,
										fontupper = \boxtitlefont,
										colback = white,
										coltext = grafite,
										top=1em,
										before upper = \boxtitlefont \textcolor{\currentcolor}{Solução: }}]
							#2\end{tcolorbox}}
				}

			\fi}
	\fi
}{\setlist[enumerate]{label=\protect\enumbox{\alph*)}}
	%\setlist[itemize]{label=\protect\itembox}
	\setlist[itemize]{label=\protect\itemcoloredsquare}}




%%%%%%%%%%%%% CAIXA DE HABILIDADES
\renewtcolorbox{habilities}[1]{ breakable,colback=penaqua!20!white,colbacktitle=penaqua!20!white,
	colframe=penaqua!20!white, left =2mm, right=2mm, boxrule=0pt, top=1mm, arc=3mm, toptitle=2mm, coltitle=black, fonttitle=\bfseries, arc is angular = northwest, sharp corners = northeast, sharp corners = southwest, arc is angular = southeast, subtitle style={coltitle=black,fonttitle=\bfseries},
	title=#1}

\newenvironment{OES}{\begin{enumerate}[label=\titem{OE \arabic*} -, topsep=2.5pt,itemsep=0pt]}{\end{enumerate}}

%%%%%%%%%%%%%%% NOTA DE RODAPÉ

\geometry{reset, paperwidth=950pt,paperheight=275mm,
	marginparsep=30pt,headsep=19pt,top=17mm, bottom=17mm ,inner=50pt,outer=440pt,
	marginparwidth=350pt}




%Ambiente marginfigure para figuras na margem
\newfloat{marginfigure}{htp}{Figura}[chapter]
\floatname{marginfigure}{Figura}
\renewcommand\themarginfigure{\thechapter.\Roman{marginfigure}}	
}

\ProcessOptions


%Páginas de texto
\ifnum\aluno=1
\excludecomment{paginatexto}
\excludecomment{apresentacao}
\else
\fi


\endinput