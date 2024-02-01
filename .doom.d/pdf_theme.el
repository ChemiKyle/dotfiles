;;; Commentary:
;;; C-x C-e
;;; Does not work until load-theme has been used

(setq pdf-view-midnight-colors

      `(
        ,(nth 1 (assoc 'fg doom-themes--colors))
        .
        ,(nth 1 (assoc 'bg doom-themes--colors))
        )
      )

;;; pdf_theme.el ends here
