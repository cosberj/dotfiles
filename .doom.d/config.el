;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; (setq text-scale-mode-step 1.0
;;       doom-variable-pitch-font (font-spec :family "Source Code Pro" :size 14 :weight 'medium)
;;       doom-font (font-spec :family "Source Code Pro" :size 14 :weight 'medium)
;;       doom-big-font (font-spec :family "Source Code Pro" :size 21 :weight 'light)
;;       doom-themes-enable-bold t
;;       doom-themes-enable-italic t
;;       doom-treemacs-enable-variable-pitch t)
;; theme
;;
(setq doom-theme
      ;; 'doom-sourcerer-personal
      ;; 'doom-sourcerer
      'doom-sourcerer-personal
      doom-themes-padded-modeline nil
      doom-treemacs-use-generic-icons nil)

;; (setq-default line-spacing 0.1)
;; (add-hook 'magit-revision-mode-hook (lambda () (setq line-spacing 0)))
;; fonts
(setq text-scale-mode-step 1.0
      doom-variable-pitch-font (font-spec :family "IBM Plex Sans" :size 14 :weight 'medium)
      doom-font (font-spec :family "IBM Plex Mono" :size 14 :weight 'medium)
      doom-big-font (font-spec :family "IBM Plex Mono" :size 18 :weight 'light)
      doom-themes-enable-bold t
      doom-themes-enable-italic t
      doom-treemacs-enable-variable-pitch t)


;; default frame
(add-to-list 'default-frame-alist '(height . 100))
(add-to-list 'default-frame-alist '(width . 100))
;; (set-frame-parameter (selected-frame) 'alpha '(100 . 100))
;; (set-frame-parameter (selected-frame) 'alpha '(99 . 97))

;; (setq kaolin-themes-hl-line-colored t)
;; (setq kaolin-themes-underline-wave t)
;; (setq kaolin-themes-italic-comments t)
(map! :nv "M-F" #'+ivy/project-search
      ;; :gnvime "M-p" #'counsel-projectile-find-file
      :gnvime "M-p"  #'projectile-find-file
      :nv "M-s" #'imenu
      )
(add-hook 'rust-mode-hook #'rainbow-delimiters-mode-enable)
(add-hook 'prog-mode-hook #'+format|enable-on-save)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq display-line-numbers-type 'relative)
(map! :leader
      :desc "Find file in project" :nv "SPC" #'avy-goto-char-2
      )
(after! lsp-mode
  (setq lsp-highlight-symbol-at-point nil)
  (setq lsp-eldoc-render-all nil)
  )

(load! "+ranger") ;; File manager stuff
(load! "+key-chord") ;; Key Chord stuff
