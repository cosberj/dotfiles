;;; completion/lsp/config.el -*- lexical-binding: t; -*-

(def-package! lsp-mode
  :commands (lsp-mode lsp-define-stdio-client))

(def-package! lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :config
  ;; (set-lookup-handlers! 'lsp-ui-mode
  ;;   :definition #'lsp-ui-peek-find-definitions
  ;;   :references #'lsp-ui-peek-find-references)
  (setq lsp-ui-sideline-ignore-duplicate t)
  ;; )
  (setq lsp-ui-doc-max-height 8
        lsp-ui-doc-max-width 40
        lsp-ui-doc-border "Gray"
        )
  )


(def-package! company-lsp
  :after lsp-mode
  :config
  (set-company-backend! 'lsp-mode 'company-lsp)
  (setq company-lsp-enable-recompletion t))


(def-package! lsp-rust
  :when (featurep! +rust)
  :hook (rust-mode . lsp-rust-enable)
  :init
  (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls")))
