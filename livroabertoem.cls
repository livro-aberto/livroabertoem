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

\RequirePackage{multicol}
\RequirePackage{xstring}
\RequirePackage{comment} % Comando excludecomment para remover os comandos do material do professor
\RequirePackage{xpatch}
\RequirePackage{paracol}


\input{definitions/la-color.tex}
\input{definitions/la-lists.tex}
\input{definitions/la-tables.tex}
\input{definitions/la-pageconfig.tex}
\input{definitions/la-credits.tex}
\input{definitions/la-hypersetup.tex}
\input{la-tikzconfig.sty}
% \input{la-commands.tex}



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
\else\fi

\newtoggle{nofonts}
\togglefalse{nofonts}

\iftoggle{html}{
	\input{class-options/la-html.tex}
}{
	\input{definitions/la-section.tex}
	\input{definitions/la-environments.tex}
	\input{definitions/la-chapter.tex}
	\input{definitions/la-volume.tex}
}

\DeclareOption{draft}
{
  \toggletrue{draft}
  \togglefalse{draft}
  \input{class-options/la-draft.tex}
}

\DeclareOption{rascunho}
{
  \toggletrue{draft}
  \togglefalse{draft}
  \input{class-options/la-draft.tex}
}

\DeclareOption{nofonts}
{
  \toggletrue{nofonts}
  \togglefalse{nofonts}
}

\DeclareOption{teacher}
{	
	\togglefalse{student}
	\toggletrue{teacher}
	\input{class-options/la-professor.tex}
}

\DeclareOption{professor}
{	
	\togglefalse{student}
	\toggletrue{teacher}
	\input{class-options/la-professor.tex}
}
\ProcessOptions%

\iftoggle{nofonts}{}
{
	\input{definitions/la-fonts.tex}
}

\iftoggle{teacher}{}{
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

	\excludecomment{teacherpage}
	\excludecomment{apresentacao}
	\excludecomment{teacher}
	\excludecomment{teacher*}
	\excludecomment{teachersection}
}

\endinput
