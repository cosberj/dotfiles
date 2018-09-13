;; -*- no-byte-compile: t; -*-
;;; completion/lsp/packages.el

(when (package! lsp-mode)
  (package! lsp-ui)
  (package! company-lsp)
  (when (featurep! +rust)
    (package! lsp-rust)
    (package! racer :disable t)))
