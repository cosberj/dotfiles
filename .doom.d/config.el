;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "iosevka ss08" :size 16)
      doom-big-font (font-spec :family "iosevka ss08" :size 17))
;; (setq doom-themes-enable-bold nil)
;; (setq doom-themes-enable-italic nil)
;; (setq doom-theme 'kaolin-dark)
(setq doom-theme 'gotham)
(setq kaolin-themes-hl-line-colored t)
(setq kaolin-themes-underline-wave t)
(setq kaolin-themes-italic-comments t)
(map! :nv "M-F" #'+ivy/project-search
      ;; :gnvime "C-p" #'projectile-find-file
      :gnvime "C-ç" #'persp-switch-to-buffer
      :gnvime "M-p" #'projectile-find-file
      :nv "M-s" #'imenu
      )
(global-set-key (kbd "C-p") nil)
(global-set-key (kbd "C-p") 'projectile-find-file)
(global-set-key (kbd "C-ç") 'persp-switch-to-buffer)
(add-hook 'rust-mode-hook #'rainbow-delimiters-mode-enable)
(add-hook 'prog-mode-hook #'+format|enable-on-save)
(add-to-list 'default-frame-alist '(fullscreen . maximized))






(setq display-line-numbers-type 'relative)
(map! :leader
      :desc "Find file in project" :nv "SPC" #'avy-goto-char-2
      )
(after! lsp-mode
  (setq lsp-highlight-symbol-at-point nil)
  )
(def-package! all-the-icons-ivy
  :config
  (setq all-the-icons-ivy-file-commands
        '(counsel-find-file counsel-file-jump counsel-recentf counsel-projectile-find-file counsel-projectile-find-dir))
  (setq all-the-icons-ivy-buffer-commands '(persp-switch-to-buffer +ivy/switch-workspace-buffer))
  (all-the-icons-ivy-setup)
  )

(load! "+ranger") ;; File manager stuff
(load! "+key-chord") ;; Key Chord stuff
