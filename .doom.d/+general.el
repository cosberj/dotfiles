;;; ~/tod/.doom.d/+general.el -*- lexical-binding: t; -*-
;;; code:
(load! "+functions")

(general-define-key
 "RET" 'newline-and-indent
 "C-." 'er/expand-region
 "C-," 'er/contract-region
 "M-s" 'counsel-grep-or-swiper
 "M-S" '+ivy/project-search
 "M-i" 'imenu
 "M-I" 'imenu-anywhere
 "C-o" 'new-line-down
 "C-S-o" 'new-line-above
 "M-l" 'copy-eol
 "M-W" 'copy-whole-line
 "C-k" 'kill-and-join-forward
 "C-S-k" 'join-next-line
 "<C-S-backspace>" 'join-line
 "C-y" 'yank-and-indent
 "C-M-l" 'select-whole-line
 "M-p" 'project-find-file
 "C-x C-b" 'persp-switch-to-buffer
 "M-U" 'redo
 "M-u" 'undo
 "C-'" '+workspace/switch-to
 "M-+"   (λ! (text-scale-set 0))
 "M-="   'text-scale-increase
 "M--" 'text-scale-decrease
 [C-tab] '+company/complete
 "C-a" 'doom/backward-to-bol-or-indent
 "C-e" 'doom/forward-to-last-non-comment-or-eol
 "C-u" 'doom/backward-kill-to-bol-and-indent
 "<backspace>" 'doom/delete-backward-char
 [M-backspace] 'doom/backward-kill-to-bol-and-indent
 "M-j" 'scroll-up-command
 "M-k" 'scroll-down-command
 "M-g" 'goto-line
 "C-s" 'isearch-from-buffer-start
 "M-r" 'query-replace-from-buffer-start
 "M-R" 'query-replace-regexp-from-buffer-start
 "C-u" 'doom/backward-kill-to-bol-and-indent
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

 "C-o" 'ace-window)



(global-set-key "\C-j" nil)
(defvar master-key "C-j")


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
  "C-b" 'list-buffers
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
  "q r" '+workspace/restart-emacs-then-restore)
;; workspaces
(master-def
  "' n" '+workspace/new
  "' d" '+workspace/delete)

(general-def swiper-map
  [backtab] '+ivy/wgrep-occur)

(general-setq auto-revert-interval 10)
