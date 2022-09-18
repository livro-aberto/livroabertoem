\def\fileversion{v2.0}
\def\filename{livroabertoem}
\def\filetitle{Livro Aberto class}
\def\filedate{2021/07/21}
\def\docdate{2021/07/21}
\def\aluno{1}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{\filename}

\pdfvariable minorversion=6

\LoadClass{memoir}

\def\input@path{
	{definitions/}
		{class-options}
		{figures}
		{resources}
		{resources/figures}
		{resources/fonts}
}

% \RequirePackage{multicol}
\RequirePackage{xstring}
\RequirePackage{comment} % Comando excludecomment para remover os comandos do material do professor
\RequirePackage{xpatch}
\RequirePackage{paracol}
\RequirePackage{ragged2e}

\newif\iffonts\fontstrue
\newif\ifdraft\draftfalse
\newif\ifparacol\paracolfalse
\newif\ifteacher\teacherfalse
\newif\ifnofooter\nofooterfalse
\newif\iftcolorbox\tcolorboxfalse
\newif\ifteacherpage\teacherpagefalse
\newif\ifteacherpnum\teacherpnumfalse
\newif\ifsinglechapter\singlechapterfalse
\newif\ifpnumberswitch\pnumberswitchfalse
\newif\ifteachersection\teachersectionfalse
\newif\ifafterteacherintroduction\afterteacherintroductionfalse

\DeclareOption{draft}{
	\nofootertrue\drafttrue
}
\DeclareOption{rascunho}{
	\nofootertrue\drafttrue
}
\DeclareOption{nofonts}{
	\fontsfalse
}
\DeclareOption{singlechapter}{
  \singlechaptertrue
}

\ProcessOptions%

\input{definitions/la-color.tex}
\input{definitions/la-pageconfig.tex}
\input{definitions/la-section.tex}
\input{definitions/la-toc.tex}
\input{definitions/la-environments.tex}
\input{definitions/la-credits.tex}
\input{definitions/la-chapter.tex}
\input{definitions/la-volume.tex}
\input{definitions/la-fonts.tex}
\input{definitions/la-floats.tex}

\DeclareOption{teacher}{
	\teachertrue
	\input{class-options/la-professor.tex}
}
\DeclareOption{professor}{
	\teachertrue
	\input{class-options/la-professor.tex}
}
\DeclareOption{nofooter}{%
  \nofootertrue%
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
