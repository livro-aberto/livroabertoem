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
	{fonts}
}


% \RequirePackage{geometry}
\RequirePackage[low-sup]{subdepth} % ajusta altura do subscript quando há superscript junto
\RequirePackage[export]{adjustbox}
% \RequirePackage{marginfix} %?
\RequirePackage{multicol}
\RequirePackage{xstring}
% \RequirePackage{endnotes} %?
\RequirePackage{comment} % Comando excludecomment para remover os comandos do material do professor
\RequirePackage{xpatch}
\RequirePackage{environ} % retirar?
\RequirePackage{paracol}
\RequirePackage{tcolorbox} % retirar depois
\RequirePackage{marginfix}

\input{definitions/la-color.tex}
\input{la-tikzconfig.sty}
\input{definitions/la-lists.tex}
\input{definitions/la-tables.tex}
\input{definitions/la-pageconfig.tex}
\input{definitions/la-credits.tex}
\input{definitions/la-hypersetup.tex}
% \input{la-commands.tex}

\newcommand{\sub}{\textsubscript}
\newcommand{\super}{\textsuperscript}



%Cor Explorando

\newcommand{\scexplore}[1]{
	\hypersetup{linkcolor=session1}\paragraph{\color{session1}\normalfont\Large\bfseries#1}\hypersetup{linkcolor=linkscolor}
}
\newcommand{\scarrange}[1]{\hypersetup{linkcolor=session4}\paragraph{\color{session4}\normalfont\Large\bfseries#1}\hypersetup{linkcolor=linkscolor}}
\newcommand{\scpractice}[1]{\hypersetup{linkcolor=session2}\paragraph{\color{session2}\normalfont\Large\bfseries#1}\hypersetup{linkcolor=linkscolor}}
\newcommand{\scknow}[1]{\hypersetup{linkcolor=session2}\paragraph{\color{session3}\normalfont\Large\bfseries#1}\hypersetup{linkcolor=linkscolor}}
\newcommand{\scexercise}[1]{\hypersetup{linkcolor=cor1}\paragraph{\color{cor1}\normalfont\Large\bfseries#1}\hypersetup{linkcolor=linkscolor}}


\newcommand{\subexplore}[1]{\paragraph{\color{session1}\normalfont\Large\bfseries#1}}
\newcommand{\subarrange}[1]{\paragraph{\color{session4}\normalfont\Large\bfseries#1}}
\newcommand{\subpractice}[1]{\paragraph{\color{session2}\normalfont\Large\bfseries#1}}
\newcommand{\subknow}[1]{\paragraph{\color{session3}\normalfont\Large\bfseries#1}}
\newcommand{\subexercise}[1]{\paragraph{\color{cor1}\normalfont\Large\bfseries#1}}


%%%%%%%%%%%% Material do professor


\newtoggle{student}
\toggletrue{student}

\newtoggle{paracol}
\togglefalse{paracol}

\newtoggle{teacher}
\togglefalse{teacher}

\newtoggle{html}
\togglefalse{html}


\ifdefined\HCode
	\toggletrue{html}
	\input{class-options/la-html.clo}
\else
	\input{definitions/la-environments.tex}
	\input{definitions/la-titles.tex}
	\input{definitions/la-chapter.tex}
\fi
	\input{definitions/la-fonts.tex}



\DeclareOption{professor}
{	
	\togglefalse{student}
	\toggletrue{teacher}
	\input{class-options/la-professor.clo}
}


\ProcessOptions%


\iftoggle{teacher}{
	
}{
	%Caixa de Obetivos gerais
	\newenvironment{habilities}[1]{}{}{}
	%Caixa de Objetivos Específicos
	\newenvironment{objectives}[4]{}{}{}
	%Caixa de Sugestões e recomendações
	\newenvironment{sugestions}[4]{}{}{}
	%Caixa de Respostas
	\newenvironment{answer}[3]{}{}
	%Caixa de Texto
	\newenvironment{texto}[1]{}{}

	\excludecomment{paginatexto}
	\excludecomment{apresentacao}
	\excludecomment{teacher}
}





\endinput
