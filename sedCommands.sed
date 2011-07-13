{
	s/par{}$//g  # Removes all instances of par{} from lines that end with par{} from outputFile.tex

	s/^oindent{}//g  # Removes all instances of oindent{} from lines that start with oindent{} from outputFile.tex 

	s/^begin{/\\\begin{/g  # Replaces all instances of begin{ with \begin{ in outputFile.tex
	
	s/minisec{/\\\minisec{/g  # Replaces all instances of minisec{ with \minisec{ in outputFile.tex

	s/href{/\\\href{/g  # Replaces all instances of href{ with \href{ in outputFile.tex

	s/emph{/\\\emph{/g  # Replaces all instances of emph{ with \emph{ in outputFile.tex

	s/label{/\\\llabel{/g  # Replaces all instances of label{ with \label{ in outputFile.tex # note need 2 letters l

	s/hypertarget{/\\\hypertarget{/g  # Replaces all instances of hypertarget{ with \hypertarget{ in outputFile.tex

	s/hyperlink{/\\\hyperlink{/g  # Replaces all instances of hyperlink{ with \hyperlink{ in outputFile.tex

	s/^\\par$//g  # Removes lines that start with par and end with par(line just containing par)

	s/^]$//g  # Removes all lines that are just ] from outputFile.tex 
	
}