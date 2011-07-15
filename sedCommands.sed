{
	s/^par{}//g  # Removes all instances of par{} from lines that start with par{} from outputFile.tex
	
	s/^\\par{}//g  # Removes all instances of \par{} from lines that start with \par{} from outputFile.tex
	
	s/\\par$//g  # Replaces lines that start with par and end with par(line just containing par)
	
	s/par{}$//g  # Replaces lines that start with par and end with par(line just containing par)

	s/^oindent{}/\\par\\noindent{}/g  # Replaces all instances of oindent{} with \par{}\noindent{}  from lines that start with oindent{} from outputFile.tex 

	s/^begin{/\\\begin{/g  # Replaces all instances of begin{ with \begin{ in outputFile.tex
	
	s/minisec{/\\\minisec{/g  # Replaces all instances of minisec{ with \minisec{ in outputFile.tex

	s/href{/\\\href{/g  # Replaces all instances of href{ with \href{ in outputFile.tex

	s/emph{/\\\emph{/g  # Replaces all instances of emph{ with \emph{ in outputFile.tex

	s/label{/\\\llabel{/g  # Replaces all instances of label{ with \label{ in outputFile.tex # note need 2 letters l

	s/hypertarget{/\\\hypertarget{/g  # Replaces all instances of hypertarget{ with \hypertarget{ in outputFile.tex

	s/hyperlink{/\\\hyperlink{/g  # Replaces all instances of hyperlink{ with \hyperlink{ in outputFile.tex

	s/^]$//g  # Removes all lines that are just ] from outputFile.tex 

	s/^\\item\[/\\item \[/g  # Replaces all instances of \item[ with \item [ in outputFile.tex
	
	s/ule{/\\rule{/g  # Replaces all instances of ule{ with \rule{ in outputFile.tex
	
	s/ule\[/\\rule\[/g  # Replaces all instances of ule{ with \rule{ in outputFile.tex
	
	s/^ewcommand{/\\newcommand{/g  # Replaces all instances of ule{ with \rule{ in outputFile.tex
	
	s/^[\\]$//g  # Removes lines that start with \ and end with \(line just containing \)
	
	s/^includegraphics/\\includegraphics/g  # Replaces all instances of \	extbf{ with \textbf{ in outputFile.tex
	
	s/@textsubscript{/\\@textsubscript{/g  # Replaces all instances of @textsubscript{ with \@textsubscript{ in outputFile.tex
	
	s/extsubscript\[/\\textsubscript[/g  # Replaces all instances of extsubscript[ with \textsubscript[ in outputFile.tex
	
	s/{linewidth}/{\\linewidth}/g  # Replaces all instances of extsubscript[ with \textsubscript[ in outputFile.tex
}