;;; ~/tod/.doom.d/+general.el -*- lexical-binding: t; -*-
;;; code:
(load! "+functions")
;; (global-set-key "\C-j" nil)
(general-define-key
 "RET" 'newline-and-indent
 ;; "C-j" 'newline-and-indent
 "C-."'er/expand-region
 "C-," 'er/contract-region
 "M-i" 'imenu
 "M-I" 'imenu-anywhere
 "C-o" 'new-line-down
 "C-S-o" 'new-line-above
 "C-l" 'copy-eol
 "M-l" 'recenter-top-bottom
 "M-W" 'copy-whole-line
 "C-k" 'kill-and-join-forward
 "C-S-k" 'join-next-line
 "<C-S-backspace>" 'join-line
 "C-y" 'yank-and-indent
 "C-M-l" 'select-whole-line
 "M-U" 'redo
 "M-u" 'undo
 "M-h" '+lookup/documentation
 "M-+"   (λ! (text-scale-set 0))
 "M-="   'text-scale-increase
 "M--" 'text-scale-decrease
 [C-tab] '+company/complete
 "C-a" 'doom/backward-to-bol-or-indent
 "C-e" 'doom/forward-to-last-non-comment-or-eol
 "C-u" 'doom/backward-kill-to-bol-and-indent
 "<S-backspace>" 'doom/backward-kill-to-bol-and-indent
 ;; "<backspace>" 'doom/delete-backward-char
 [M-backspace] 'doom/backward-kill-to-bol-and-indent
 "M-j" 'scroll-up-command
 "M-k" 'scroll-down-command
 "M-g" 'goto-line
 "C-s" 'counsel-grep-or-swiper
 "C-S-s" '+ivy/project-search
 "M-S" '+ivy/project-search-from-cwd
 "M-r" 'query-replace-from-buffer-start
 "M-R" 'query-replace-regexp-from-buffer-start
 "C-u" 'doom/delete-backward-char
 "C-S-u" 'backward-kill-word
 "C-S-M-u" 'doom/backward-kill-to-bol-and-indent
 "M-f" 'forward-to-word
 "C-M-f" 'forward-word
 "C-M-b" 'backward-to-word
 "M-P" 'backward-paragraph
 "M-N" 'forward-paragraph
 "M-+"   (λ! (text-scale-set 0))
 "M-="   'text-scale-increase
 "M--" 'text-scale-decrease
 "C-t" 'avy-goto-char-in-line
 "C-M-p" 'backward-sexp
 "C-M-n" 'forward-sexp
 ;; "C-'" 'project-file-file
 "C-'" '+ivy/projectile-find-file
 "C-~" '+workspace/switch-to
 "C-´" '+ivy/tasks
 "M-1"   (λ! (+workspace/switch-to 0))
 "M-2"   (λ! (+workspace/switch-to 1))
 "M-3"   (λ! (+workspace/switch-to 2))
 "M-4"   (λ! (+workspace/switch-to 3))
 "M-5"   (λ! (+workspace/switch-to 4))
 "M-6"   (λ! (+workspace/switch-to 5))
 "M-7"   (λ! (+workspace/switch-to 6))
 "M-8"   (λ! (+workspace/switch-to 7))
 "M-9"   (λ! (+workspace/switch-to 8))
 "M-0" #'+workspace/switch-to-last

 )

(general-define-key
 "C-*" 'iedit-mode
 "M-;" 'iedit-toggle-selection)

(general-define-key
 :prefix "C-x"
 "k" 'kill-current-buffer
 "C-k" 'kill-current-buffer
 "C-S-k" 'doom/kill-other-buffers
 "f" 'find-file-other-window
 "C-o" 'ace-window
 "b" 'ivy-switch-buffer-other-window
 "C-b" 'ivy-switch-buffer
 ;; "C-b" '+ivy/switch-workspace-buffer
 "C-r" 'hydra-rectangle/body
 "m" 'multiple-cursors-hydra/body
 )

(global-set-key "\M-v" nil)
(global-set-key "\C-r" nil)


;; (defvar master-key "C-r")
(defvar master-key "C-ç")

(general-create-definer master-def
  :prefix master-key)

(master-def
  "s" 'embrace-commander
  "p" '+default/find-in-config
  "i s" 'yas-insert-snippet
  "i y" 'counsel-yank-pop
  "C-j" 'avy-goto-char-2
  "C-d" '+lookup/definition
  "d" '+lookup/references
  "b" 'ivy-switch-buffer
  "C-b" 'list-buffers
  "C-t" 'avy-goto-char-in-line
  )

;; file stuff
(master-def
  "f y" '+default/yank-buffer-filename
  "f p" 'projectile-switch-project
  "f k" 'doom/delete-this-file
  "f s" 'doom/sudo-this-file
  "f x" 'doom/open-scratch-buffer)

;; git stuff
(master-def
  "g s" 'magit-status
  "g p" 'magit-push-popup
  "g c" 'magit-commit
  "g b" 'magit-blame)
;; quiting
(master-def
  "q R" '+workspace/restart-emacs-then-restore
  "q r" 'restart-emacs)
;; workspaces
(master-def
  "C-' n" '+workspace/new
  "C-' d" '+workspace/delete)

(master-def
  "o T" '+term/open
  "o t" '+term/open-popup-in-project
  "o p t" '+term/open-popup
  "o i" 'imenu-list-smart-toggle)

(general-def swiper-map
  [backtab] '+ivy/wgrep-occur)

(general-def clojure-mode-map
  "C-x m e b" 'cider-eval-buffer
  "C-x m e r" 'cider-eval-region
  "C-x m e p" 'cider-eval-sexp-at-point
  )

(general-setq auto-revert-interval 10)

(general-def company-active-map
  "C-n" 'company-select-next
  "C-p" 'company-select-previous
  "C-h" 'company-show-doc-buffer
  "C-SPC" 'counsecounsel-company
  [tab]     #'company-complete-common-or-cycle
  [backtab] #'company-select-previous
  )
