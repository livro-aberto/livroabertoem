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
		{resources}
		{resources/figures}
		{resources/fonts}
}

\RequirePackage{multicol}
\RequirePackage{xstring}
\RequirePackage{comment} % Comando excludecomment para remover os comandos do material do professor
\RequirePackage{xpatch}
\RequirePackage{paracol}

\newif\ifdraft\draftfalse
\newif\ifparacol\paracolfalse
\newif\ifteacher\teacherfalse
\newif\iffonts\fontstrue
\newif\ifteacherpage\teacherpagefalse
\newif\ifteachersection\teachersectionfalse

\DeclareOption{draft}
{
	\drafttrue
}

\DeclareOption{rascunho}
{
	\drafttrue
}

\DeclareOption{nofonts}
{
	\fontsfalse
}

\ProcessOptions%

\input{definitions/la-color.tex}
\input{definitions/la-pageconfig.tex}
\input{definitions/la-section.tex}
\input{definitions/la-toc.tex}
\input{definitions/la-environments.tex}
\input{definitions/la-chapter.tex}
\input{definitions/la-volume.tex}
\input{definitions/la-fonts.tex}

\DeclareOption{teacher}
{
	\teachertrue
	\input{class-options/la-professor.tex}
}

\DeclareOption{professor}
{
	\teachertrue
	\input{class-options/la-professor.tex}
}
\ProcessOptions%


\ifteacher\else
	\excludecomment{teacherpage}
	\excludecomment{teacher}
	\excludecomment{teacher*}
	\excludecomment{teachersection}
	\excludecomment{teacherintroduction}
\fi

\endinput
