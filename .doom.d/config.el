;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; (setq doom-font (font-spec :family "iosevka ss08" :size 16)
;;       doom-variable-pitch-font (font-spec :family "iosevka ss08")
;;       doom-big-font (font-spec :family "iosevka ss08" :size 19))
(setq doom-font (font-spec :family "Inconsolata" :size 17)
      doom-variable-pitch-font (font-spec :family "Inconsolata")
      doom-big-font (font-spec :family "Inconsolata" :size 20))
;; (setq doom-theme 'gotham)
(setq doom-theme 'kaolin-dark)
;; (setq doom-theme 'doom-sourcerer)
;; (setq company-idle-delay 0.2
;;       company-minimum-prefix-length 2)
(map! :gnvime "C-p" nil)
(map! :nv "M-F" #'+ivy/project-search
      :gnvime "C-p" #'projectile-find-file
      :gnvime "M-p" #'projectile-find-file
      :nv "M-s" #'imenu
      :nv "M-S" #'imenu-anywhere
      )
(add-hook 'rust-mode-hook #'rainbow-delimiters-mode-enable)
(add-hook 'prog-mode-hook #'+format|enable-on-save)
(setq display-line-numbers-type 'relative)
(setq lsp-highlight-symbol-at-point nil)

(map! :leader
      :desc "Find file in project" :nv "SPC" #'avy-goto-char-2
      )

(load! "+ranger") ;; File manager stuff
