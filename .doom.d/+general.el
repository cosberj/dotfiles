;;; ~/tod/.doom.d/+general.el -*- lexical-binding: t; -*-
;;; code:
(load! "+functions")
(general-define-key
 "RET" 'newline-and-indent
 "C-v" 'er/expand-region
 "C-S-v" 'er/contract-region
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
 "C-x C-b" 'switch-to-buffer
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
 "<C-backspace>" 'doom/delete-backward-char
 [M-backspace] 'doom/backward-kill-to-bol-and-indent
 ;; "C-S-j" 'scroll-up-command
 ;; "C-S-k" 'scroll-down-command
 )


;; should remember
;; c-x c-u -> upcase region
;; c-x c-l -> downcase region


(general-define-key
 "C-*" 'iedit-mode
 "M-;" 'iedit-toggle-selection)

(general-define-key
 :prefix "C-x"
 "k" 'kill-current-buffer
 "C-k" 'doom/kill-other-buffers
 "f" 'find-file-other-window
 "C-d" '+lookup/definition
 "C-S-d" '+lookup/references)

(defvar master-key "C-ç")

(general-create-definer master-def
  :prefix master-key)

(master-def
  "s" 'embrace-commander
  "p" '+default/find-in-config
  "i s" 'yas-insert-snippet
  "i y" 'counsel-yank-pop
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
  "g c" 'magit-commit)
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
