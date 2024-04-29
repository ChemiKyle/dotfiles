;;; langs/R.el -*- lexical-binding: t; -*-


; https://emacs.stackexchange.com/questions/8041/how-to-implement-the-piping-operator-in-ess-mode
(defun then_R_operator ()
  "R - |> operator or 'then' pipe operator"
  (interactive)
  (just-one-space 1)
  ;; old and busted
  ;; (insert "%>%")
  ;; new hotness
  (insert "|>")
  (reindent-then-newline-and-indent))

(defun ess-non_interactive-test ()

  R -e "devtools::test('~/projects/redcapcustodian')"

  )

(after! ess-mode
  ;; TODO: check if this was remapped first
  ; Bind C-m to pipe
  (define-key ess-mode-map (kbd "<C-m>") 'then_R_operator)
  (define-key inferior-ess-mode-map (kbd "<C-m>") 'then_R_operator)
  (setq! flycheck-lintr-linters
         "with_defaults(line_length_linter = line_length_linter(120), object_length_linter = object_length_linter(80))")

  ;; TODO: limit print length

  ; prevent emacs from hanging when R output is slow
  ; https://emacs.stackexchange.com/a/53316/32189
  (setq ess-eval-visibly 'nowait) 

  ;; This defaults to ~10^18
  ;; Assuming these units are seconds, that's 10^13 days
  ;; (setq ess--command-default-timeout 30)

  ;; Auto styling
  ;; prevent odd spacing with comments in R
  (setq! ess-indent-with-fancy-comments nil)

  ;; Make evil-indent
  ;; (setq! ess-set_s nil)
  ;; (ess-set-default-style 'RStudio)
  ;; same as styler::tidyverse_style()
  (setq! ess-default-style 'RStudio)

  ;; TODO: fix halting issue in iESS
  ;; https://stackoverflow.com/a/41466688
  (defun ess-abort ()
    (interactive)
    (interrupt-process (ess-get-process)))
  (define-key ess-mode-map (kbd "C-c C-a") 'ess-abort)
  (define-key inferior-ess-mode-map (kbd "C-c C-a") 'ess-abort)

  ;; TODO: make a keybind for sinew::makeOxygen() to autotemplate docstrings
  )

