;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.

;; this was user-full-name and user-mail-address
;; moved this to an untracked file
(load! "private_info.el")

;; prevent $HOME from being a project root
;; (after! projectile (setq projectile-project-root-files-bottom-up (remove ".git"
          ;; projectile-project-root-files-bottom-up)))

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
 ;; (setq doom-font (font-spec :family "monospace" :size 14)
 ;;       doom-variable-pitch-font (font-spec :size 15))

;; (setq doom-font (font-spec :family "fixed" :size 14))

(setq doom-font (font-spec :family "Iosevka Extended" :size 14 :weight 'semi-bold))
;; (setq doom-font (font-spec :family "iosevka" :size 14 :weight 'semi-bold :width 'semi-expanded))
;; (setq doom-variable-pitch-font (font-spec :size 15))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'base16-gruvbox-light-soft)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; MacOS overrides
(cond
 (IS-MAC
  (setq mac-command-modifier      'super
        ns-command-modifier       'super
        mac-option-modifier       'meta
        ns-option-modifier        'meta
        ;; *Don't* free up the right option for character composition
        ;; Seriously, who wants that?
        mac-right-option-modifier 'meta
        ns-right-option-modifier  'meta)))

;; 2 spaces of indent is plenty
(setq standard-indent 2)
(setq doom-output-indent-increment 2)

;; word wrap by default
(setq! word-wrap t)

;; vim sneak sucks, swiper is cool
;; (define-key evil-normal-state-map (kbd "s") 'swiper)
(define-key evil-normal-state-map (kbd "s") 'yas-insert-snippet)
;;(global-set-key (kbd "C-m") (kbd "C-1")) ;; make

;; give me back my increments!
;; usually on g= in DOOM
;; C-a is the same as 0/w
(define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
;; visual block g C-a increments in order of line number
(define-key evil-normal-state-map (kbd "g C-a") 'evil-numbers/inc-at-pt-incremental)

(setq scroll-margin 5)

(set-frame-parameter (selected-frame) 'alpha '(98 . 85))

;; make ASCII binds rebindable
;; TODO: only in GUI mode
(define-key input-decode-map [?\C-m] [C-m]) ;; remove C-m = Enter
;(define-key input-decode-map [?\C-i] [C-i]) ;; remove C-i = Tab ;; explicitly not done for vim jumps

;; language support and customization
;; NOTE: private dir doesn't seem to be needed, but leaving this in case that changes
;; (load (concat doom-private-dir "langs/R.el"))
(load! "langs/R.el")
(load! "langs/latex.el")
(load! "langs/py.el")
(load! "langs/php.el")

;; TODO: figure out how to just set this without error
;(doom/increase-font-size)

;;(set-frame-parameter (selected-frame) 'alpha '(92 . 90))
;(setq initial-frame-alist
;      '('alpha '(92 . 90)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;                EMAIL                ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu/mu4e")
(add-load-path! "/usr/local/share/emacs/site-lisp/mu/mu4e")
(set-email-account! "ufl"
                    '(
                      ;; (mu4e-sent-folder . "/ufl/Sent Mail")
                      ;; (mu4e-drafts-folder     . "/ufl/Drafts")
                      ;; (mu4e-trash-folder      . "/ufl/Trash")
                      ;; (mu4e-refile-folder     . "/ufl/All Mail")
                      (smtpmail-smtp-user     . user-mail-address)
                      ;; (mu4e-compose-signature . "")
                      )
                    t)

;; email color
(setq! shr-use-colors nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;                 NAV                 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-key evil-normal-state-map (kbd "SPC d") 'ranger)

(after! ispell
  (setq ispell-dictionary "en_US")
  (setq ispell-local-dictionary "en_US")
  (setq ispell-local-dictionary-alist
        '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)
          )))
