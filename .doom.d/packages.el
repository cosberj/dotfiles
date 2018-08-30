;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el
(package! emacs-snippets
  :recipe (:fetcher github
                    :repo "hlissner/emacs-snippets"
                    :files ("*")))
;; Filestuff
(package! ranger)
