;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el
(package! emacs-snippets
  :recipe (:fetcher github
                    :repo "hlissner/emacs-snippets"
                    :files ("*")))
(package! gotham-theme)
(package! kaolin-themes)
(package! key-chord)
(package! all-the-icons-ivy)
;; Filestuff
(package! ranger)
