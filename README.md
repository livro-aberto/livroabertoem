# Classe livroabertoem.cls

Este repositório contém uma classe de LaTeX que serve de modelo para a coleção de Ensino Médio do 
[Livro Aberto de Matemática](https://umlivroaberto.org/).
A produção dos módulos se encontra no repositório 
[`tex-design-development`](https://github.com/livro-aberto/tex-design-development).

Caso haja algum problema no processo de instalação ou na utilização do pacote, registre uma *Issue*
ou contate `tarsobcaldas@gmail.com`

## Instalação

### Dependências

Para utilizar este modelo é necessário uma distribuição de LaTeX (recomendamos utilizar 
[TeX Live](https://www.tug.org/texlive/acquire-netinstall.html)), e os seguintes pacotes 
(já vêm junto de uma distribuição completa do TeX Live ou MiKTeX):

* `xstring`
* `comment` 
* `xpatch`
* `paracol`
* `xcolor`
* `tikz`
* `enumitem`
* `colortbl`
* `graphicx`
* `calc`
* `makecell`
* `xurl`
* `hyperref`
* `titlesec`
* `pagecolor`
* `anyfontsize`
* `fontspec`
* `multicol`

Além destes pacotes é também necessária a classe `memoir`, que é utilizada como interface para a 
definição dos comandos de paginação.

### Instalação dos arquivos

Antes de clonar o repositório, é necessário encontrar a pasta em que os arquivos TeX são lidos, a 
partir da distribuição de sua escolha.

#### TeXLive
Com o TeXLive instalado, é preciso clonar o repositório e colocá-lo 
[no diretório `texmf`](https://tex.stackexchange.com/questions/1137/where-do-i-place-my-own-sty-or-cls-files-to-make-them-available-to-all-my-te). 
Ele pode ser encontrado usando no Terminal, ou Command Prompt, ou Powershell, o comando
```
kpsewhich -var-value=TEXMFHOME
```

No Windows, este diretório se encontra normalmente em `C:/Users/usuario/texmf`. No Linux, ou Unix, 
é comum ficar em `~/texmf`.

**Observação**: É possível que este diretório não exista, portanto é necessário criá-lo para 
adicionar pacotes.

#### MiKTeX
Se sua distribuição for instalada a partir do MiKTeX, é necessário 
[definir um diretório para a adição de pacotes](https://docs.miktex.org/manual/localadditions.html).
Por exemplo
```
set TEXINPUTS=C:/Users/usuario/texmf
```
irá definir a pasta `C:/Users/usuario/texmf` como um diretório em que os pacotes serão procurados. 
Caso esta pasta não exista, recomendamos a criação dela.

#### Clonando o repositório

No Windows (substitua `usuario` pelo seu usuário no Windows)
```
git clone https://github.com/livro-aberto/livroabertoem C:/Users/usuario/texmf/tex/latex
```

No Linux ou Unix
```
git clone https://github.com/livro-aberto/livroabertoem ~/texmf/tex/latex
```

## Funcionamento

Esta classe de documento tem como objetivo criar uma interface para a criação de material com 
versões para o professor e para o aluno, utilizando um mesmo documento, bastando escolher a versão 
a partir da opção da classe `professor` (ou `teacher`). Isto é,

```latex
\documentclass{livroaberto}
```
gerará o material do aluno, enquanto

```latex
\documentclass[professor]{livroaberto}
```
gera o material do professor.

Isto é feito utilizando os pacotes `paracol` e `comment`. O pacote `paracol` cria as colunas 
laterais onde o material do professor é colocado, e o pacote `comment` exclui os ambientes do 
professor quando só queremos que o material do aluno seja mostrado. 

### Volumes

A classe foi feita pensando nos múltiplos volumes da coleção do Livro Aberto de Matemática para o 
Ensino Médio, sendo assim, o título mais alto na hierarquia é obtido através do comando `\volume`.
Este comando cria uma página com a cor escolhida para o volume determinado, que pode ser escolhida 
através do comando `\volumecolor{<cor>}`. Temos 4 cores de volumes pré-definidas, com os nomes 
`volume1` até `volume4`.

O arquivo a ser utilizado como imagem de capa deve estar no formato `pdf`, com o nome na
forma `ilustracao-volicon.pdf` com e fundo invisível. No arquivo `tex`, podemos escolher a imagem
de capa com o comando `\volumeillustration{<ilustracao>}`, sendo <ilustracao> o mesmo nome do 
arquivo em `pdf`, **sem o sufixo `-volicon.pdf`**. Estas definições devem estar presentes antes 
do comando `\volume{<titulo>}`, que cria a imagem de capa.

É possível também definir um ícone para o rodapé da página baseado no volume. Isto deve ser feito
antes do preâmbulo, e o ícone, que deve estar no formado `icone-footericon.pdf`. 
O comando para escolher o ícone é `\footericon{<icone>}`, e assim como a ilustracao do volume,
deve estar sem o sufixo.

### Capítulos

Os capítulos criam uma nova página com o nome dos autores, o nome do capítulo e uma figura 
posicionada à direita. Esta figura pode ser inserida com o comando 
`\chapterillustration{<ilustracao>}`.

Para o nome dos autores, pode ser definidos por `\autor{<nome>}` (Quando só houver um autor), ou por
`\autores{<nomes>}`. Os nomes dos autores devem ser separados por `\\`. Por exemplo

```latex
\autores{
  nome1 \\
  nome2 \\
  nome3 
}
```

### Headers

A partir da sintaxe da coleção de ensino médio do Livro Aberto de Matemática, com os títulos de 
seções sendo estes
* Explorando (`\explore{<título>}`, cor azul);
* Organizando (`\arrange{<título>}`, cor vermelha);
* Praticando (`\practice{<título>}`, cor verde);
* Para Saber + (`\know{<título>}`, cor vermelha);
* Exercícios (`\exercise`, cor azul escuro) e 
* Material Suplementar (`\additionalmaterial`, cor azul escuro).

As cores dos headers possuem influência nas cores do conteúdo posterior a elas, isto é feito a 
partir do comando `\currentcolor`.Todos estes *headers* possuem nível de hierarquia abaixo do 
comando `\section`. 

O comando `\section` aparece sempre na frente da folha, enquanto `\explore` começa na página de 
frente, a menos que precedido por uma página de início de seção.

### Ambientes

A classe possui dois tipos de ambientes (com exceção do material do professor, que será explicado 
mais à frente): com banners e com caixas (produzidas utilizando o 
pacote `tcolorbox`).

O único ambiente criado a partir do banner é o de atividade (`\begin{task}{<título>}`).
Todos os outros ambientes são feitos a partir de `tcolorbox`, e entre eles temos três tipos 
de configurações:

* `la@volumebox`: Caixas com a coloração do volume. Podem ter um ícone ao lado da caixa,
definido a partir do comando `\boxicon` (mais informações na documentação em progresso), mas não 
aceitam título. Os ambientes pré-definidos são
	- Refletindo (`\begin{reflection}`). Possui um ícone de cérebro ao lado.
	- Você Sabia? (`\begin{knowledge}`). Possui um ícono de lupa ao lado.
	- Notas (`\begin{research}`). Possui um bloco de notas ao lado.

* `la@chapterbox`: Caixas com a coloração principal da coleção (azul escuro).
Não recebem título, e são utilizadas apenas nas caixas `O quê?` e `Por quê?`,
definidas no início do capítulo com os comandos `\chapterwhat{<texto>}` e `\chapterbecause{<texto}`.

* `la@sectionbox`: Caixas com a coloração da seção atual, podendo receber título. Os ambientes são
	- Exemplo (`\begin{example}{<título>}`). Além de título possui numeração.
	- Observação (`\begin{observation}{<título>}`)

Além destas caixas, temos um último ambiente que é o Projeto Aplicado (`\begin{project}{<título>}`}.
A caixa deste ambiente foi criada exclusivamente para ele.



## Material do Professor

No material do professor, a largura da página é aumentada a fim de se ter uma coluna reservada para
o material do professor. Esta coluna é criada usando o pacote `paracol`, que permite colunas 
digitadas em paralelo.

O texto para o professor pode ser criado usando o ambiente `\begin{teacher}`. Quando chamado, este 
ambiente passa a digitar na coluna reservada ao material do professor. Este texto é inserido ao 
na linha em paralelo ao material do aluno, isto é, o texto aparecerá ao lado do parágrafo em que o 
ambiente é colocado, a menos que haja outro texto para o professor no lugar, o que faz com que o 
texto entre como continuação do anterior.

**Observação**: O pacote paracol pode criar conflitos com o design do material do aluno, criando 
espaços em branco não-desejados. Caso isso aconteça, tente mudar a posição do ambiente do professor 
no código. 

### Headers para o professor

O material do professor tem como principal objetivo trazer considerações para o professor e soluções
para as atividades. Para isso, temos três títulos criados especificamente para este ambiente. São
* Objetivos específicos (`\objectives{<título>}`)
* Sugestões e discussões (`\sugestions{<título>}`)
* Solução (`\answer`)

Estes ambientes não podem ser usados fora do ambiente do professor, e é recomendado seu uso para 
a descrição das atividades, portanto, um uso comum do ambiente do professor é
```latex
\begin{task}{título da atividade}

\begin{teacher}
  \objectives{título da atividade}

    objetivos específicos

  \sugestions{título da atividade}

    sugestões e discussões

  \answer{título da atividade}

    solução
\end{teacher}

conteúdo da atividade
\end{task}
```

### Notas ao final do capítulo (`endnotes`)

O conteúdo desejado pode não caber todo na coluna lateral, portanto, temos a possibilidade de 
colocar conteúdo adicional em uma página de notas que aparece ao final do capítulo. Isto pode ser
feito utilizando o comando `\teachernotes[<opções>]{<título>}{<conteúdo>}`.

As opções para este comando são `objectives`, `sugestions`, `answer`, que utilizam os mesmos headers
da coluna lateral. É possível também utilizar qualquer outro nome para o título, basta escrevêlo no
argumento da opção. Por exemplo,
```latex
\teachernotes[Observações]{Nome da atividade}{conteúdo da observação}
```
irá criar uma nota com o título primário "Observações" e subtítulo "Nome da atividade". Caso o campo de opções fique vazio, o <título> ficará destacado no lugar.

Estas notas são feitas a partir do comando `\pagenotes` da classe `memoir`. Caso queira criar outras
notas finais, é possível também utilizar comando (sua definição pode ser encontrada na página 251 da
[documentação da classe `memoir`](https://ctan.dcc.uchile.cl/macros/latex/contrib/memoir/memman.pdf) )

