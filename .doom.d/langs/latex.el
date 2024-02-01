;;; langs/latex.el -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;                LATEX                ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; LaTeX code highlighting of src blocks
;; using the minted package
;; (setq! org-latex-packages-alist
;;        '(("" "listingsutf8")
;;          ("" "color")
;;          ("cache=false" "minted"))
;;        )
;; (setq! org-latex-listings 'minted)
;; (setq! org-latex-pdf-process
;;       '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;         "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;         "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; Add LaTeX classes
;; General:
;; https://emacs.stackexchange.com/a/53352/32189
;; (add-to-list 'org-latex-classes
;;            '("letter"
;;          "\\documentclass{letter}"
;;          ("\\section{%s}" . "\\section*{%s}")
;;          ("\\subsection{%s}" . "\\subsection*{%s}")
;;          ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

;; moderncv specific
;; https://tex.stackexchange.com/a/428046
(with-eval-after-load 'ox-latex
   (add-to-list 'org-latex-classes
            '("moderncv"
              "\\documentclass{moderncv}"
              ("\\section{%s}" . "\\section*{%s}")
              ("\\subsection{%s}" . "\\subsection*{%s}"))))
