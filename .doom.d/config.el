;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Inconsolata" :size 17)
      doom-variable-pitch-font (font-spec :family "Inconsolata")
      doom-big-font (font-spec :family "Inconsolata" :size 17))
(setq doom-theme 'doom-sourcerer)
(map! :gnvime "C-p" nil)
(map! :nv "M-F" #'+ivy/project-search
      :gnvime "C-p" #'projectile-find-file
      :gnvime "M-p" #'projectile-find-file
      :nv "M-s" #'imenu
      )
(add-hook 'rust-mode-hook #'rainbow-delimiters-mode-enable)
(add-hook 'prog-mode-hook #'+format|enable-on-save)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq display-line-numbers-type 'relative)
(setq lsp-highlight-symbol-at-point nil)
;; (setq which-key-idle-delay 0.3)
(map! :leader
      :desc "Find file in project" :nv "SPC" #'avy-goto-char-2
      )
(load! "+ranger") ;; File manager stuff
