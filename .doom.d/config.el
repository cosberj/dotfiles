;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; theme
(setq doom-theme
      ;; 'kaolin-light
      ;; kaolin-themes-hl-line-colored t
      ;; kaolin-themes-underline-wave t
      ;; kaolin-themes-italic-comments t
      ;; kaolin-themes-distinct-company-scrollbar t
      ;; kaolin-themes-distinct-fringe t
      ;; 'creamsody
      ;; 'doom-nord-light
      ;; 'eclipse
      'paper
      )

;; (load-theme 'paper)


(setq
 ;; text-scale-mode-step 1.0
 doom-variable-pitch-font (font-spec :family "IBM Plex Sans" :size 15 :weight 'medium)
 doom-font (font-spec :family "IBM Plex Mono" :size 15 :weight 'medium)
 doom-big-font (font-spec :family "IBM Plex Mono" :size 18 :weight 'light)
 doom-themes-enable-bold t
 doom-themes-enable-italic t
 doom-treemacs-enable-variable-pitch t)

;; settings for paper-theme looks more nice
(set-face-background 'show-paren-match "#8C0D40")
(add-hook 'after-init-hook (lambda () (hl-line-mode -1)))

;; (setq
;;  ;; text-scale-mode-step 1.0
;;  doom-variable-pitch-font (font-spec :family "Source Code Pro" :size 15 :weight 'medium)
;;  doom-font (font-spec :family "Source Code Pro" :size 15 :weight 'medium)
;;  doom-big-font (font-spec :family "Source Code Pro" :size 18 :weight 'light)
;;  doom-themes-enable-bold t
;;  doom-themes-enable-italic t
;;  doom-treemacs-enable-variable-pitch t)

;; default frame
(add-to-list 'default-frame-alist '(height . 100))
(add-to-list 'default-frame-alist '(width . 100))
(set-frame-parameter (selected-frame) 'alpha '(100 . 100))

(global-subword-mode 1)

;; when use vim keybinds again
;; (setq display-line-numbers-type 'relative)

;; (setq-default cursor-type 'bar)


;; (setq-hook! 'after-init-hook blink-cursor-mode nil)
;; modes
(after! lsp-mode
  (setq lsp-highlight-symbol-at-point nil)
  (setq lsp-eldoc-render-all nil)
  )


(setq-local fill-column 100)


(add-hook 'prog-mode-hook #'rainbow-delimiters-mode-enable)
(add-hook 'prog-mode-hook #'+format|enable-on-save)
(delete-selection-mode)
;; (load! "+ranger") ;; File manager stuff
(load! "+general") ;; File manager stuff
;; (load! "+key-chord") ;; Key Chord stuff
(load! "+hydra")


;; (global-set-key (kbd "C-ç") 'evil-escape)
;; (global-set-key (kbd "C-g") 'evil-escape)
;; (global-set-key (kbd "C-a") 'doom/backward-to-bol-or-indent)
;; (global-set-key (kbd "C-e") 'doom/forward-to-last-non-comment-or-eol)
;; (global-set-key (kbd "C-s") 'swiper)
;; (global-set-key (kbd "C-p") 'previous-line)
;; (global-set-key (kbd "C-n") 'next-line)
