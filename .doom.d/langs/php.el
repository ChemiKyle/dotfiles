;;; langs/php.el -*- lexical-binding: t; -*-

;; help reduce size of TAGS by excluding libraries from composer
(after! php-mode
  (push '"^vendor$" projectile-globally-ignored-directories)
  )

(set-lookup-handlers! 'php-mode
  ;; TODO: use whatever built in thing is instead of opening a web page
  :documentation #'+lookup/dash
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;          LSP customizations         ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq! lsp-intelephense-format-braces 'k&r)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;       REDCap Environment Setup      ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq
 redcap-version "1414"
 redcap-modules-dir (concat (getenv "HOME") "/projects/modules"))


; DAP configuration, requires lsp
;; NOTE: using dap mode requires vscode php extenstion appear in emacs
;; ln -s ~/.vscode-oss/extensions/$EXTENSION/* ~/.emacs.d/.local/etc/dap-extension/vscode/$EXTENSION/extension/.
;; NOTE: you can also set up a launch.json in the project root which will appear in dap-debug options
;; NOTE: possible that dap-php-setup must be run
(defun redcap-setup-debug (v)
  "setup dap template for redcap-version"
  (interactive (list (read-string "Version: " redcap-version)))
  (setq redcap-docker-root (concat (getenv "HOME") "/projects/redcap-docker-compose/" v "/www"))

  (require 'dap-php)
  (dap-register-debug-template "REDCap"
    (list :type "php"
          :cwd nil
          :request "launch"
          :name "A REDcap PHP"
          ;; [...]/redcap-docker-compose/redcap-version/redcap-overrides/web/php/80-xdebug.ini
          ;; xdebug.client_port
          :port "9003"
          :pathMappings (ht
                         ('/var/www/html/modules redcap-modules-dir)
                         ('/var/www/html redcap-docker-root)
                         )
          :xdebugSettings (ht
                         ('max_children '128)
                         ('max_depth '5)
                         )
          :sourceMaps t))
  (message "M-x dap-debug to start")
)


;; php debugging
;; not working properly
(if IS-MAC
    (setq! geben-path-mappings '(
                                 ;; redcap modules
                                 (redcap-modules-dir "/var/www/html/modules")
                                 ;; redcap root
                                 (redcap-docker-root "/var/www/html")
                                 )
           )
  ;; prevent stall on first command
  (setq! geben-pause-at-entry-line nil)

  (set-docsets! php-mode "PHP")
  )
