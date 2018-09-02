;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Inconsolata" :size 17)
      doom-variable-pitch-font (font-spec :family "iosevka ss08")
      doom-big-font (font-spec :family "iosevka ss08" :size 17))
;; (setq doom-themes-enable-bold nil)
;; (setq doom-themes-enable-italic nil)
;; (setq doom-theme 'doom-sourcerer)
;;
(setq doom-theme 'kaolin-dark)
(map! :gnvime "C-p" nil)
(map! :nv "M-F" #'+ivy/project-search
      ;; :gnvime "C-p" #'projectile-find-file
      :gnvime "M-p" #'projectile-find-file
      :nv "M-s" #'imenu
      )
(global-set-key (kbd "C-p") 'projectile-find-file)
(global-set-key (kbd "C-ç") 'persp-switch-to-buffer)
(add-hook 'rust-mode-hook #'rainbow-delimiters-mode-enable)
(add-hook 'prog-mode-hook #'+format|enable-on-save)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq display-line-numbers-type 'relative)
(setq lsp-highlight-symbol-at-point nil)
;; (setq which-key-idle-delay 0.3)
(map! :leader
      :desc "Find file in project" :nv "SPC" #'avy-goto-char-2
      )
;; (setq evil-escape-key-sequence "kj")
(load! "+ranger") ;; File manager stuff
(load! "+key-chord") ;; File manager stuff

;; (setq lsp-ui-doc-position 'at-point)
