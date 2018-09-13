;;; completion/lsp/config.el -*- lexical-binding: t; -*-


(def-package! lsp-mode
  ;; :hook (lsp-mode . lsp-enable-imenu)
  :commands (lsp-mode lsp-define-stdio-client)
  :config
  (require 'lsp-imenu)
  (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)
  )

;; (def-package! lsp-ui
;;   :hook (lsp-mode . lsp-ui-mode)
;;   :config
;;   (set-lookup-handlers! 'lsp-ui-mode
;;     :definition #'lsp-ui-peek-find-definitions
;;     :references #'lsp-ui-peek-find-references)
;;   (setq lsp-ui-sideline-enable nil)
;;   ;; (setq lsp-ui-sideline-ignore-duplicate t)
;;   ;; )
;;   (setq
;;    lsp-ui-doc-max-height 10
;;    lsp-ui-doc-max-width 50
;;    lsp-ui-doc-border "Gray"
;;    lsp-ui-doc-include-signature t
;;    lsp-ui-doc-position 'at-point
;;    )
;;   )
(def-package! company-lsp
  :after lsp-mode
  :config
  (set-company-backend! 'lsp-mode 'company-lsp)
  (setq company-lsp-enable-recompletion t)
  (setq company-lsp-async t)
  (setq company-lsp-cache-candidates t)
  )


(def-package! lsp-rust
  :when (featurep! +rust)
  :hook (rust-mode . lsp-rust-enable)
  :init
  (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls")))
