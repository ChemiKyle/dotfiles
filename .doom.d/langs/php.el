;;; langs/php.el -*- lexical-binding: t; -*-

;; NOTE: using dap mode requires vscode php extenstion appear in emacs
;; ln -s ~/.vscode-oss/extensions/$EXTENSION/* ~/.emacs.d/.local/etc/dap-extension/vscode/$EXTENSION/extension/.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;       REDCap Environment Setup      ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq
 redcap-version "13101"
 redcap-docker-root (concat (getenv "HOME") "/projects/redcap-docker-compose/" redcap-version "/www")
 redcap-modules-dir (concat (getenv "HOME") "/projects/modules"))


; DAP configuration, requires lsp

(require 'dap-php)
(dap-php-setup)
;; NOTE: you can also set up a launch.json in the project root which will appear in dap-debug options
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
