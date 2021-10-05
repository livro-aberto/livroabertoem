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
\RequirePackage{microtype}
\RequirePackage[low-sup]{subdepth}
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

		

% Define asymptote picture preamble






%%%%%%%%%%%% Material do professor

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

\DeclareOption{professor}
{
	\input{la-professor.clo}
}

\DeclareOption{html}
{
	\input{la-html.clo}
}

\ProcessOptions%


%Páginas de texto
\ifnum\aluno=1
\excludecomment{paginatexto}
\excludecomment{apresentacao}
\else
\fi


\endinput