%=======================================================================
% UNISINOSmonografia v0.2
%
% Classe LaTeX elaborada com base nas orientações dadas no documento
% ``GUIA PARA ELABORAÇÃO DE TRABALHOS ACADÊMICOS''
% disponível no site da biblioteca da Unisinos
% (http://www.unisinos.br/biblioteca)
% Comentários abaixo colocados entre aspas (`` '') foram
% extraídos diretamente do documento da biblioteca.
%
% Copyright (C) 2011, 2012 Rafael Bohrer Ávila
%
% Trechos deste código foram extraídos/adaptados do pacote 'iiufrgs'
% de classes para documentos do Instituto de Informática da UFRGS,
% mantido pelo grupo UTUG (http://www.inf.ufrgs.br/utug).
% Copyright (C) 2001-2005 UFRGS TeX Users Group
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
%=======================================================================

%=======================================================================
% Identificacao
%=======================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UCSmonografia}[8/8/2015]

%=======================================================================
% Declaracoes básicas
%=======================================================================
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[a4paper,12pt,openright]{report}
\RequirePackage{babel}
\RequirePackage{times}
\RequirePackage{indentfirst}
\RequirePackage{setspace}
\RequirePackage{lastpage}
\usepackage[toc,titletoc]{appendix}


%=======================================================================
% Comandos para definições principais.
% Exemplos de uso:
%   \autor{Sobrenome}{Nomes Iniciais}
%   \orientador[Prof.~Dr.]{Sobrenome}{Nomes Iniciais}
%   \coorientador[Profa.~Dra.]{Sobrenome}{Nomes Iniciais}
%   \unidade{Unidade Acadêmica de Pesquisa e Pós-Graduação}
%   \natureza{Dissertação apresentada como requisito parcial etc etc...}
%   \local{Caxias do Sul} (default)
%   \ano{2012} (default = ano corrente)
%=======================================================================
\DeclareRobustCommand{\autor}[2]{
	\gdef\@authorlast{#1}
	\gdef\@authorfirst{#2}
}
\DeclareRobustCommand{\titulo}[1]{
	\gdef\@title{#1}
}
\DeclareRobustCommand{\subtitulo}[1]{
	\gdef\@subtitle{#1}
}
\DeclareRobustCommand{\orientador}[3][]{
	\gdef\@advisortitle{#1}
	\gdef\@advisorlast{#2}
	\gdef\@advisorfirst{#3}
}
\DeclareRobustCommand{\coorientador}[3][]{
	\gdef\@coadvisortitle{#1}
	\gdef\@coadvisorlast{#2}
	\gdef\@coadvisorfirst{#3}
}
\DeclareRobustCommand{\unidade}[1]{
	\gdef\@unidade{#1}
}
\DeclareRobustCommand{\curso}[1]{
	\gdef\@curso{#1}
}
\DeclareRobustCommand{\nivel}[1]{
	\gdef\@nivel{#1}
}
\DeclareRobustCommand{\natureza}[1]{
	\gdef\@natureza{#1}
}
\DeclareRobustCommand{\local}[1]{
	\gdef\@local{#1}
}
\DeclareRobustCommand{\ano}[1]{
	\gdef\@ano{#1}
}
\DeclareRobustCommand{\cip}[2]{
	\gdef\@ciptipo{#1}
	\gdef\@cipcdu{#2}
}
\DeclareRobustCommand{\bibliotecario}[2]{
	\gdef\@bibliotecarionome{#1}
	\gdef\@bibliotecariocrb{#2}
}
\local{Caxias do Sul} % p/ ter um default
\ano{\number\year} % idem

%=======================================================================
% Comando para indicação das palavras-chave, em cada idioma usado.
% Deve-se usar várias vezes o comando para cada palavra-chave a ser
% relacionada.
%
% Exemplos de uso:
%   \palavrachave{brazilian}{Sistemas Operacionais}
%   \palavrachave{brazilian}{Redes de Computadores}
%   ...
%   \palavrachave{english}{Operating Systems}
%   \palavrachave{english}{Computer Networks}
%=======================================================================
\DeclareRobustCommand{\palavrachave}[2]{
	\@ifundefined{c@@kw#1}{\newcounter{@kw#1}}{}
	\stepcounter{@kw#1}
	\expandafter\gdef\csname @kw#1\alph{@kw#1}\endcsname{#2}
}

%=======================================================================
% Comando para gerar o "placeholder" da folha de aprovação.  Isso facilita
% para manter correta a numeração de páginas.
%
% Exemplo de uso:
%   \folhadeaprovacao % isto vai logo após a folha de rosto
%=======================================================================

%=======================================================================
% Folha de Aprovação
%=======================================================================
\DeclareRobustCommand{\folhadeaprovacao}{%
%=======================================================================
% Margens e espaçamentos
% Ajuste das medidas verticais
\setlength{\topmargin}{20mm}
\setlength{\headheight}{2ex}
\setlength{\headsep}{10mm}
	\addtolength{\headsep}{-\headheight}
\setlength{\textheight}{\paperheight}
	\addtolength{\textheight}{-\topmargin}
	\addtolength{\textheight}{-\headheight}
	\addtolength{\textheight}{-\headsep}
	\addtolength{\textheight}{-20mm}
\setlength{\topskip}{0pt}
\addtolength{\topmargin}{-1in}
\flushbottom
% Ajuste das medidas horizontais
\setlength{\oddsidemargin}{30mm}
\setlength{\evensidemargin}{20mm}
\setlength{\textwidth}{\paperwidth}
	\addtolength{\textwidth}{-\oddsidemargin}
	\addtolength{\textwidth}{-\evensidemargin}
\addtolength{\oddsidemargin}{-1in}
\addtolength{\evensidemargin}{-1in}
	\cleardoublepage%
    
	\begingroup
		\centering%
		\vbox to 6cm{%
			\textbf{\@authorfirst~\@authorlast}\\
			\vfill
			\textbf{\uppercase\expandafter{\@title}}%
			\@ifundefined{@subtitle}{\\}{:\\\textbf{\@subtitle\\}}%
		}
	\endgroup
	\vspace{1cm}
	\begin{flushright}
		\parbox{.5\textwidth}{%
			\raggedright\sloppy%
			\@natureza\\[4ex]
%			\orientadorname:\\
			%\@advisortitle~\@advisorfirst\ %\@advisorlast
\			\@ifundefined{@coadvisorlast}{}{%
				\\[4ex]
				\coorientadorname:\\
				\@coadvisortitle~\@coadvisorfirst\ \@coadvisorlast
			}
            \\[4ex]
            \vbox{\textbf{Aprovado em  10/12/2020}}
		}
	\end{flushright}
	\vfill
    \begin{flushleft}
		\vbox{\textbf{Banca Examinadora}}
        \vspace{1cm}
        \vbox{\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\\
          Prof. Dr. Guilherme Holsbach Costa \\
        Universidade de Caxias do Sul - UCS}
        \vspace{1cm}
        \vbox{\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\\
        Eng. Gustavo de Camargo \\
        Universidade de Caxias do Sul - UCS}
        \vspace{1cm}
        \vbox{\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\\
        Prof. Dr. Andre Luis Martinotto \\
        Universidade de Caxias do Sul - UCS}
        \vspace{1cm}
	\end{flushleft}
	
}

% página da ficha catalográfica
\def\@cip{%
	\clearpage%
	\begin{center}
		DADOS INTERNACIONAIS DE CATALOGA{\c{C}}{\~A}O NA PUBLICA{\c{C}}{\~A}O (CIP)\\[2ex]
		\@cipwindow\\[2ex]
		\@bibliotecarionome\ --- CRB~\@bibliotecariocrb
	\end{center}
}

% definição do quadro
\def\@cipwindow{%
	\framebox[120mm]{%
	\begin{minipage}{110mm}%
		\vspace*{0.5ex}%
		\setlength{\parindent}{1em}%
		\setlength{\parskip}{1ex}%
		\noindent\@authorlast, \@authorfirst

		\@title%
		\@ifundefined{@subtitle}{}{: \MakeLowercase{\@subtitle}}
		/ \@authorfirst\ \@authorlast\ --- \@ano.

		\pageref{LastPage}~f.: il.; 30~cm.

		\@ciptipo\ --- Universidade de Caxias do Sul, \@curso,
		\@local, \@ano.

		``\orientadorname: \@advisortitle\ \@advisorfirst\ \@advisorlast, \@unidade''.

		\@cipkw I.~T\'{\i}tulo.

		\hspace*{\fill}CDU~\@cipcdu\par
		\vspace{1ex}
	\end{minipage}%
	}%
}

% montagem da lista de palavras-chave
\DeclareRobustCommand{\@cipkw}{%
	\setcounter{@kwi}{0}%
	\loop%
		\stepcounter{@kwi}%
		\arabic{@kwi}.~\csname @kw\languagename\alph{@kwi}\endcsname.\,
	\ifnum\value{@kwi} < \value{@kw\languagename}\repeat%
}

%=======================================================================
% Environments para dedicatória, agradecimentos e epígrafe.
% Exemplos de uso:
%   \begin{dedicatoria}
%     Aos queridos professores.
%   \end{dedicatoria}
%
%   \begin{agradecimentos}
%     Obrigado a todo mundo. :-)
%   \end{agradecimentos}
%
%   \begin{epigrafe}
%     ``\textit{Keep walking}''.\\(Johnnie Walker)
%   \end{epigrafe}
%=======================================================================

%=======================================================================
% Dedicatória
%=======================================================================
\newenvironment{dedicatoria}{%
	\cleardoublepage%
	\vspace*{\fill} % faz o texto aparecer na parte de baixo da página
	\raggedleft % alinha o texto à direita
}{%
	\par
}
%=======================================================================
% Agradecimentos
%=======================================================================
\newenvironment{agradecimentos}
	{\chapter*{\ackname}}
	{}
%=======================================================================
% Epígrafe
%=======================================================================
\newenvironment{epigrafe}{%
	\cleardoublepage%
	\vspace*{\fill} % faz o texto aparecer na parte de baixo da página
	\raggedleft % alinha o texto à direita
}{%
	\par
}

%=======================================================================
% Environment para redação do resumo em Português e no idioma
% estrangeiro.
%
% Exemplos de uso:
%   \begin{abstract}
%     Este trabalho etc etc.
%   \end{abstract}
%
%   \begin{otherlanguage}{english}
%   \begin{abstract}
%     This work etc. etc.
%   \end{abstract}
%   \end{otherlanguage}
%=======================================================================
\newcounter{@kwi}
\DeclareRobustCommand{\@abstractkw}{%
	\setcounter{@kwi}{0}%
	\loop%
		\stepcounter{@kwi}%
		\csname @kw\languagename\alph{@kwi}\endcsname.\,
	\ifnum\value{@kwi} < \value{@kw\languagename}\repeat%
}
\renewenvironment{abstract}{%
	\chapter*{\abstractname}
}{%
	\par\vspace{4ex}
	\noindent\textbf{\palavraschavename:} \@abstractkw
}

%=======================================================================
% Comandos para apresentação das listas de abreviaturas, siglas e símbolos.
% Exemplos de uso:
%   \begin{listadeabreviaturas}{prof., profa.}
%     \item[prof., profa.] professor, -a
%     \item[ampl.]         ampliado, -a
%   \end{listadeabreviaturas}
%
%   \begin{listadesiglas}{UNISINOS}
%     \item[ABNT]     Associação Brasileira de Normas Técnicas
%     \item[UNISINOS] Universidade do Vale do Rio dos Sinos
%   \end{listadesiglas}
%=======================================================================
\newenvironment{listof}[2]{
	\chapter*{\csname list#1name\endcsname}
	\begin{list}{\textbf{??}}{
		\settowidth{\labelwidth}{#2}
		\setlength{\labelsep}{4em}
		\setlength{\itemindent}{0mm}
		\setlength{\leftmargin}{\labelwidth}
		\addtolength{\leftmargin}{\labelsep}
		\setlength{\rightmargin}{0mm}
		\setlength{\itemsep}{.1\baselineskip}
		\renewcommand{\makelabel}[1]{\makebox[\labelwidth][l]{##1}}
	}
}{
	\end{list}
}

\newenvironment{listadeabreviaturas}[1]
	{\begin{listof}{abbrv}{#1}}
	{\end{listof}}

\newenvironment{listadesiglas}[1]
	{\begin{listof}{acr}{#1}}
	{\end{listof}}

\newenvironment{listadesimbolos}[1]
	{\begin{listof}{sym}{#1}}
	{\end{listof}}

%=======================================================================
% Comando para citações longas.
% Exemplos de uso:
%
% \begin{quote}
%   Ó dia, ó vida, ó azar! (HARDY, 1980)
% \end{quote}
%
% (O exemplo acima não é exatamente "longo"... mas é só um exemplo. :-))
%=======================================================================
\renewenvironment{quote}{%
	\par\addvspace{\baselineskip}%
	\begin{list}{}{
		\setlength{\leftmargin}{40mm}
		\setlength{\parsep}{0em}
		\item\relax
	}
		\small\singlespacing%
}{%
	\end{list}%
	\addvspace{\baselineskip}%
}

%=======================================================================
% Comando para criação de epígrafe nos inícios de capítulos.
%
% Exemplo de uso:
%   \epigrafecap{Grenal é Grenal, e vice-versa.}{Jardel}
%=======================================================================
\DeclareRobustCommand{\epigrafecap}[2]{%
	\addvspace{\baselineskip}%
	\begin{list}{}{
		\setlength{\leftmargin}{40mm}
		\setlength{\parsep}{0em}
		\item\relax
	}
		\raggedleft\small{\itshape\singlespacing``#1''\\}
		#2\par
	\end{list}%
	\addvspace{\baselineskip}%
}

%=======================================================================
% Environment para criação de alíneas.
%
% Exemplo de uso:
%   \begin{alineas}
%      \item texto da primeira alínea (inicia sempre em minúsculas);
%      \item texto da segunda alínea;
%      \item texto da última alínea.
%   \end{alineas}
%=======================================================================
\newcounter{alineas}
\newenvironment{alineas}{%
	\begin{list}{\alph{alineas})}{
		\usecounter{alineas}
		\advance\@itemdepth\@ne
	}
}{%
	\end{list}%
}

%=======================================================================
% Comandos para criação de Apêndices e Anexos.
% Exemplos de uso:
%   % isto vai imediatamente após as referências bibliográficas
%   % (ou após o glossário, se este existir)
%   \appendix
%   \chapter{Informações Complementares} % primeiro apendice
%     Bla bla bla...
%     ...
%
%   \chapter{Mais Informações} % segundo apendice
%     Bla bla bla...
%     ...
%
%   \annex
%   \chapter{Artigos Publicados} % primeiro anexo
%     ...
%
% O comando \appendix tem que ser redefinido para fazer aumentar a
% indentação à esquerda no sumário, e também para reformatar os títulos
% dos capítulos (tem que incluir um hífen...)
%
% O comando \annex basicamente chama o comando \appendix passando outro nome.
%=======================================================================
\DeclareRobustCommand{\appendix}[1][\appendixname]{%
	\setcounter{chapter}{0}%
	\renewcommand{\thechapter}{\Alph{chapter}}%
	\setcounter{tocdepth}{0}%
	\gdef\@chapapp{\MakeUppercase{#1}\space}%
	\gdef\@makechapterhead##1{%
		\reset@font\centerline{%
			\@chapterfont%
			\@chapapp\thechapter~--~\MakeUppercase{##1}%
		}%
		\addvspace{\baselineskip}

	}
	\gdef\@chapter[##1]##2{%
		\refstepcounter{chapter}%
		\addcontentsline{toc}{chapter}{%
			\protect\numberline{\@chapapp\thechapter\hfill--\hfill}##1%
		}%
		\@makechapterhead{##2}\@afterheading
	}
	\addtocontents{toc}{%
		\protect
		\settowidth{\@chapnumindent}{\textbf{\@chapapp}}
		\addtolength{\@chapnumindent}{1.8em}
	}%
}
\DeclareRobustCommand{\annex}{\appendix[\annexname]}

%=======================================================================
% Comandos/definições para habilitar o uso do abnt.bst.
%=======================================================================
\DeclareRobustCommand{\abntbst}{%
	\usepackage{natbib}
	\bibliographystyle{abnt}
	\renewenvironment{thebibliography}[1]{%
		\chapter*{\bibname}
		\begin{list}{}{
			\renewcommand{\makelabel}[1]{}
			\setlength{\leftmargin}{0em}
			\sloppy\raggedright\singlespacing%
		}
	}{%
		\end{list}
	}
	\setlength{\bibhang}{0pt}
	\setlength{\bibsep}{\baselineskip}
	\let\cite\citep
	\DeclareRobustCommand{\citetexto}[2][]{\citet*[##1]{##2}}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FIM DOS COMANDOS PARA USUÁRIOS
% As definições abaixo servem somente para colocar o documento dentro
% do formato esperado e não são destinadas a utilização pelo usuário final.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%=======================================================================
% Margens e espacamentos
%=======================================================================
% ajuste das medidas verticais
\setlength{\topmargin}{20mm}
\setlength{\headheight}{2ex}
\setlength{\headsep}{10mm}
	\addtolength{\headsep}{-\headheight}
\setlength{\textheight}{\paperheight}
	\addtolength{\textheight}{-\topmargin}
	\addtolength{\textheight}{-\headheight}
	\addtolength{\textheight}{-\headsep}
	\addtolength{\textheight}{-20mm}
\setlength{\topskip}{0pt}
\addtolength{\topmargin}{-1in}
\flushbottom

% ajuste das medidas horizontais
\setlength{\oddsidemargin}{30mm}
\setlength{\evensidemargin}{20mm}
\setlength{\textwidth}{\paperwidth}
	\addtolength{\textwidth}{-\oddsidemargin}
	\addtolength{\textwidth}{-\evensidemargin}
\addtolength{\oddsidemargin}{-1in}
\addtolength{\evensidemargin}{-1in}

% indentação dos parágrafos
% 1,25 cm fica feio :-(
%\setlength{\parindent}{1.25cm}

%=======================================================================
% Fontes
%=======================================================================
% 1 		SEÇÃO PRIMÁRIA 		(maiúsculas, negrito)
% 1.1 		SEÇÃO SECUNDÁRIA 	(maiúsculas, sem negrito)
% 1.1.1 	Seção terciária 	(minúsculas com exceção da 1ª letra, negrito)
% 1.1.1.1 	Seção quaternária 	(minúsculas com exceção da 1ª letra, sem negrito)
% 1.1.1.1.1 Seção quinária 		(minúsculas com exceção da 1ª letra, itálico)


\def\@chapterfont{\normalfont\sc\bfseries}		% 1
\def\@sectionfont{\normalfont\sc}				% 1.1
\def\@subsectionfont{\normalfont\bfseries}		% 1.1.1		
\def\@subsubsectionfont{\normalfont}			% 1.1.1.1
\def\@paragraphfont{\normalfont}
\def\@subparagraphfont{\normalfont}
\let\emph\textbf

%=======================================================================
% Cabeçalho e rodapé
%=======================================================================
\def\ps@UNISINOSmonografia{
	\def\@oddhead{\hfil\thepage}
	\def\@evenhead{\thepage\hfil}
	\let\@oddfoot\@empty
	\let\@evenfoot\@empty
}
\pagestyle{empty}
\let\ps@plain\ps@empty

%=======================================================================
% Capa
% Deve estar toda em negrito
%=======================================================================
\DeclareRobustCommand{\capa}{%
	\begingroup
	\centering%
	\vbox to 6cm{
		\textbf{UNIVERSIDADE DE CAXIAS DO SUL\\}
			\textbf{\'AREA DO CONHECIMENTO DE CI\^ENCIAS EXATAS E ENGENHARIAS\\}
	\uppercase\expandafter{\textbf{\@unidade}}\\
		\@ifundefined{@curso}{}
        {\uppercase\expandafter{\textbf{\@curso}}\\}%
		\@ifundefined{@nivel}{}
        {\uppercase\expandafter{\textbf{\@nivel}}\\}%
	}
	\vbox to 6cm{%
		\MakeUppercase{\textbf{\@authorfirst~\@authorlast}}\\
		\vfill
		\textbf{\uppercase\expandafter{\@title}}%
		\@ifundefined{@subtitle}%
		{\\}%
		{:\\\textbf{\uppercase\expandafter{\@subtitle\\}}}%
	}
	\vfill
        \textbf{\@local}\\
		\textbf{\@ano}\par
	\endgroup
}

%=======================================================================
% Folha de rosto
% Deve conter as mesmas informações da capa;
% Deve ser acrecido a natureza do trabalho e nome do orientador. 
% Não deve constar o nome da instituição
%=======================================================================
\DeclareRobustCommand{\folhaderosto}{%
	\cleardoublepage%
	%\vspace*{3cm}
	\begingroup
		\centering%
		\vbox to 13cm{%
			\textbf{\@authorfirst~\@authorlast}\\
			\vfill
			\textbf{\uppercase\expandafter{\@title}}%
			\@ifundefined{@subtitle}{\\}{:\\\textbf{\@subtitle\\}}%
		}
	\endgroup
	
    \vspace{3cm}
	\begin{flushright}
		\parbox{.5\textwidth}{%
			\raggedright\sloppy%
			\@natureza\\[4ex]
			\orientadorname:\\
			\@advisortitle~\@advisorfirst\ \@advisorlast
			\@ifundefined{@coadvisorlast}{}{%
				\\[4ex]
				\coorientadorname:\\
				\@coadvisortitle~\@coadvisorfirst\ \@coadvisorlast
			}
    	}
	\end{flushright}
	\vfill
	\begingroup
		\centering%
		\textbf{\@local}\\
		\textbf{\@ano}\par
	\endgroup
	\setcounter{page}{1}%
	\@ifundefined{@ciptipo}{}{\@cip}%
}

% página da ficha catalográfica
\def\@cip{%
	\
	clearpage%
	%\begin{center}
Ficha catalogr\'afica.\\[2ex]
		\@cipwindow\\[2ex]
		%\@bibliotecarionome\ --- CRB~\@bibliotecariocrb
	%\end{center}
}

% definição do quadro
\def\@cipwindow{%
	\framebox[120mm]{%
	\begin{minipage}{110mm}%
		\vspace*{0.5ex}%
		%\setlength{\parindent}{1em}%
		\setlength{\parskip}{1ex}%
\noindent\MakeUppercase{\@authorlast}, \@authorfirst

\@title%
\@ifundefined{@subtitle}{}{: \MakeLowercase{\@subtitle}}
/ \@authorfirst\ \@authorlast; orientador: Guilherme Holsbach Costa, Caxias do Sul: UCS, Centro de Ci\^encias Exatas e Tecnologia, \@ano.

		\pageref{LastPage}~folhas, 30~cm.

Trabalho de conclus\~ao do curso de Engenharia de Computa\c{c}\~ao\ --- Universidade de Caxias do Sul, Centro de Ci\^encias Exatas e Tecnologia, \@ano %\@curso,
%		\@local, \@ano.
%		``\orientadorname: \@advisortitle\ \@advisorfirst\ \@advisorlast, \@unidade''.
		
Inclui refer\^encias bibliogr\'aficas.

\@cipkw I. Costa, Guilherme H. II. Universidade de Caxias do Sul. III. \@title.

		%\hspace*{\fill}CDU~\@cipcdu\par
		\vspace{1ex}
	\end{minipage}%
	}%
}

% montagem da lista de palavras-chave
\DeclareRobustCommand{\@cipkw}{%
	\setcounter{@kwi}{0}%
	\loop%
		\stepcounter{@kwi}%
		\arabic{@kwi}.~\csname @kw\languagename\alph{@kwi}\endcsname.\,
	\ifnum\value{@kwi} < \value{@kw\languagename}\repeat%
}

%=======================================================================
% Formatação dos capítulos e das seções.
%
% Os comandos \@makechapterhead e \@makeschapterhead fazem a
% formatação dos títulos propriamente ditos (numerados e não numerados,
% respectivamente).
%
% O comando \@chapter é redefinido porque a ocorrência do primeiro
% capítulo numerado determina algumas mudanças:
% - o número da página passa a ser mostrado;
% - o espaçamento passa a ser 1,5.
% A redefinição do comando serve, portanto, para incluir os comandos que
% causam essas mudanças.  O restante da definição é igual ao padrão.
%
% O comando \@schapter é redefinido para que só inclua entradas no
% sumário depois que o primeiro capítulo numerado foi criado.  Isso serve
% para atender a exigência de que os elementos pré-textuais não devem
% aparecer no sumário.
%
% Deve ser apresentado da seguinte forma:
% 1 		SEÇÃO PRIMÁRIA 			(maiúsculas, negrito)
% 1.1 		SEÇÃO SECUNDÁRIA 		(maiúsculas, sem negrito)
% 1.1.1 	Seção terciária 		(minúsculas com exceção da 1ª letra, negrito)
% 1.1.1.1 	Seção quaternária 		(minúsculas com exceção da 1ª letra, sem negrito)
% 1.1.1.1.1 Seção quinária 			(minúsculas com exceção da 1ª letra, itálico)

% 2 		SEÇÃO PRIMÁRIA 			(maiúsculas, negrito)
% 2.1 		SEÇÃO SECUNDÁRIA 		(maiúsculas, sem negrito)
% 2.2.1 	Seção terciária 		(minúsculas com exceção da 1ª letra, negrito)
% 2.2.1.1 	Seção quaternária 		(minúsculas com exceção da 1ª letra, sem negrito)
% 2.2.1.1.1 Seção quinária 			(minúsculas com exceção da 1ª letra, itálico)
%=======================================================================
\def\@chapapp{}
\def\@makechapterhead#1{%
	\reset@font\noindent%
	{%
		\@chapterfont%
		\@chapapp\thechapter\hspace{1em}\MakeUppercase{#1}\par%
	}%
	\addvspace{\baselineskip}
}
\def\@makeschapterhead#1{%
	\reset@font%
	\centerline{\@chapterfont\MakeUppercase{#1}}%
	\addvspace{\baselineskip}
}
\def\@chapter[#1]#2{%
	\pagestyle{UNISINOSmonografia}\let\ps@plain\ps@UNISINOSmonografia%
	\onehalfspacing%
	\refstepcounter{chapter}%
	\addcontentsline{toc}{chapter}{%
		\protect\numberline{\@chapapp\thechapter}#1%
	}%
	\@makechapterhead{#2}\@afterheading
}
\def\@schapter#1{%
	\ifnum\c@chapter>0%
		\addcontentsline{toc}{chapter}{#1}%
	\fi%
	\@makeschapterhead{#1}\@afterheading
}
\DeclareRobustCommand{\section}{%
	\@startsection{section}{1}{\z@}{\baselineskip}{\baselineskip}%
		{\@sectionfont}%
}
\DeclareRobustCommand{\subsection}{%
	\@startsection{subsection}{2}{\z@}{\baselineskip}{\baselineskip}%
		{\@subsectionfont}%
}
\DeclareRobustCommand{\subsubsection}{%
	\@startsection{subsubsection}{3}{\z@}{\baselineskip}{\baselineskip}%
		{\@subsubsectionfont}%
}
\DeclareRobustCommand{\paragraph}{%
	\@startsection{paragraph}{4}{\z@}{\baselineskip}{\baselineskip}%
		{\@paragraphfont}%
}
\DeclareRobustCommand{\subparagraph}{%
	\@startsection{subparagraph}{5}{\z@}{\baselineskip}{\baselineskip}%
		{\@subparagraphfont}%
}
\setcounter{secnumdepth}{6}%

%=======================================================================
% Ajustes no sumário.
%
% \@chapnumindent é uma medida criada para definir o espaço destinado ao
% número do capítulo ou da seção no sumário.  Esse número é
% consideravelmente aumentado a partir do momento em que se declara
% um Apêndice ou Anexo, pois nesse caso a palavra "Apêndice" ou "Anexo" é
% incluída junto à numeração.
%
% O comando \l@chapter é redefinido para levar essa medida em
% consideração e, juntamente com as redefinições de \l@section e
% \l@subsection, corresponder às seguintes regras de apresentação:

% 1 		SEÇÃO PRIMÁRIA 			(maiúsculas, negrito)
% 1.1 		SEÇÃO SECUNDÁRIA 		(maiúsculas, sem negrito)
% 1.1.1 	Seção terciária 		(minúsculas com exceção da 1ª letra, negrito)
% 1.1.1.1 	Seção quaternária 		(minúsculas com exceção da 1ª letra, sem negrito)
% 1.1.1.1.1 Seção quinária 			(minúsculas com exceção da 1ª letra, itálico)

% 2 		SEÇÃO PRIMÁRIA 			(maiúsculas, negrito)
% 2.1 		SEÇÃO SECUNDÁRIA 		(maiúsculas, sem negrito)
% 2.2.1 	Seção terciária 		(minúsculas com exceção da 1ª letra, negrito)
% 2.2.1.1 	Seção quaternária 		(minúsculas com exceção da 1ª letra, sem negrito)
% 2.2.1.1.1 Seção quinária 			(minúsculas com exceção da 1ª letra, itálico)


%=======================================================================
\newlength{\@chapnumindent}\setlength{\@chapnumindent}{1.5em}
\renewcommand*{\l@chapter}[2]{
  \addpenalty{-\@highpenalty}
  \vskip -1ex \@plus\p@
  \leavevmode%\sffamily\bfseries\small
  \@dottedtocline{0}{0em}{3em}%
    {{\@chapterfont\uppercase\expandafter{#1}}}%
    {\hss\textbf{#2}}%
  \penalty\@highpenalty%
}
\renewcommand*{\l@section}[2]{%
  \@dottedtocline{1}{0em}{3em}{{\@sectionfont\uppercase{#1}}}{\hss #2}%
}
\renewcommand*{\l@subsection}[2]{%
  \@dottedtocline{2}{0em}{3em}{{\@subsectionfont#1}}{\hss\textbf{#2}}%
}
\renewcommand*{\l@subsubsection}[2]{%
  \@dottedtocline{3}{0em}{3em}{{\@subsubsectionfont#1}}{\hss #2}%
}
\setcounter{tocdepth}{4}

%=======================================================================
% Ajuste das legendas das figuras e tabelas.
%
% O comando \@makecaption é o que formata a legenda como ela aparece
% no texto.
%
% O \@caption trata, entre outras coisas, de incluir uma referência à
% figura ou tabela na respectiva lista (a que fica no início do documento).
% É para mexer nisso que o comando é redefinido aqui.
%
% O \l@figure é o comando que inclui a linha na lista de figuras com
% o devido espaçamento.  O \l@table é o equivalente para tabelas.
%
% Ao final, os contadores de figuras e tabelas são redefinidos para
% usarem numeração simples, ao invés de dependente do capítulo
% (ou seja, Fig 1, Fig 2, etc. ao invés de Fig 1.1, 1.2, 2.1, etc.). ECA.
%=======================================================================
\long\def\@makecaption#1#2{%
	\vskip\abovecaptionskip
	\sbox\@tempboxa{#1~-- #2}%
	\ifdim \wd\@tempboxa >\hsize
		{#1~-- #2\par}
	\else
		\global \@minipagefalse
		\hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
	\fi
	\vskip\belowcaptionskip%
}

\long\def\@caption#1[#2]#3{%
	\par
	\addcontentsline{\csname ext@#1\endcsname}{#1}{%
		\protect%
		\numberline{\csname fnum@#1\endcsname\hfill--\hfill}{\ignorespaces #2}
	}%
	\addtocontents{\csname ext@#1\endcsname}{\protect\addvspace{3\p@}}%
	\begingroup
		\@parboxrestore
		\if@minipage
			\@setminipage
		\fi
		\small
		\@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
	\endgroup%
}
\renewcommand*{\l@figure}{\@dottedtocline{1}{0em}{5em}}
\let\l@table\l@figure

% Precisamos desativar o reset dos contadores de figuras e tabelas a
% cada capítulo. A definição abaixo faz isso. (Inspirada no pacote
% "remreset.sty" de David Carlisle.)
\def\cl@chapter{\@elt{section}\@elt{equation}\@elt{footnote}}

\renewcommand{\thefigure}{\arabic{figure}}
\renewcommand{\thetable}{\arabic{table}}
\DeclareRobustCommand{\fonte}[1]{%
	\vskip.2\abovecaptionskip%
	\parbox{\textwidth}{\footnotesize\fontename: #1}%
}
\setlength{\abovecaptionskip}{\baselineskip}
%\setlength{\belowcaptionskip}{\baselineskip}

%=======================================================================
% Definições dependentes do idioma.
%=======================================================================
\@namedef{captionsbrazilian}{
	\def\bibname{Refer{\^e}ncias}
	\def\abstractname{Resumo}
	\def\appendixname{Ap{\^e}ndice}
	\def\chaptername{Cap\'{\i}tulo}
	\def\contentsname{Sum{\'a}rio}
	\def\listfigurename{Lista de Figuras}
	\def\listtablename{Lista de Tabelas}
	\def\listdefname{Lista de Defini\c{c}\~{o}es}
	\def\listtheoremsname{Lista de Teoremas}
	\def\corollaryname{Corol\'{a}rio}
	\def\propositionname{Proposi\c{c}\~{a}o}
	\def\definitionname{Defini\c{c}\~{a}o}
	\def\conjecturename{Conjectura}
	\def\examplename{Exemplo}
	\def\exercisename{Exerc\'{\i}cio}
	\def\propertyname{Propriedade}
	\def\remarknamek{Observa\c{c}\~{a}o}
	\def\lemmaname{Lema}
	\def\theoremname{Teorema}
	\def\proofname{Prova}
	\def\figurename{Figura}
	\def\tablename{Tabela}
	\def\orientadorname{Orientador}
	\def\coorientadorname{Coorientador}
	\def\ackname{Agradecimentos}
	\def\listabbrvname{Lista de Abreviaturas}
	\def\listacrname{Lista de Siglas}
	\def\listsymname{Lista de S{\'\i}mbolos}
	\def\annexname{Anexo}
	\def\palavraschavename{Palavras-chave}
	\def\fontename{Fonte}
}

\@namedef{captionsenglish}{
	\def\bibname{References}
	\def\abstractname{Abstract}
	\def\appendixname{Appendix}
	\def\chaptername{Chapter}
	\def\contentsname{Contents}
	\def\listfigurename{List of Figures}
	\def\listtablename{List of Tables}
	\def\listdefname{List of Definitions}
	\def\listtheoremsname{List of Theorems}
	\def\corollaryname{Corollary}
	\def\propositionname{Proposition}
	\def\definitionname{Definition}
	\def\conjecturename{Conjecture}
	\def\examplename{Example}
	\def\exercisename{Exercise}
	\def\propertyname{Property}
	\def\remarknamek{Remark}
	\def\lemmaname{Lemma}
	\def\theoremname{Theorem}
	\def\proofname{Proof}
	\def\figurename{Figure}
	\def\tablename{Table}
	\def\orientadorname{Advisor}
	\def\coorientadorname{Co-advisor}
	\def\ackname{Acknowledgements}
	\def\listabbrvname{List of Abbreviations}
	\def\listacrname{List of Acronyms}
	\def\listsymname{List of Symbols}
	\def\annexname{Annex}
	\def\palavraschavename{Keywords}
	\def\fontename{Source}
}