;;; ~/tod/.doom.d/+general.el -*- lexical-binding: t; -*-
(load! "+functions")
(general-define-key
 "RET" 'newline-and-indent
 ;; expand region
 "C-v" 'er/expand-region
 "C-S-v" 'er/contract-region
 ;; search
 "M-s" 'counsel-grep-or-swiper
 "M-S" '+ivy/project-search
 "M-i" 'imenu
 "M-I" 'imenu-anywhere
 ;; new lines
 "C-o" 'new_line_down
 "C-S-o" 'new_line_above
 "M-l" 'copy-eol
 ;; make things with lines
 "M-W" 'copy-whole-line
 "C-k" 'kill-and-join-forward
 "C-S-k" 'join-next-line
 "<C-S-backspace>" 'join-line
 "C-y" 'yank-and-indent
 "C-M-l" 'select-whole-line
 ;; project
 "M-p" 'project-find-file
 "C-x C-b" 'switch-to-buffer
 )
(general-define-key
 "C-*" 'iedit-mode
 "C-;" 'iedit-toggle-selection
 )

(general-define-key
 :prefix "C-x"
 "k" 'kill-current-buffer
 "C-k" 'doom/kill-other-buffers
 "f" 'find-file-other-window)

(defvar master-key "C-ç")

(general-create-definer master-def
  :prefix master-key)

(master-def
  "y" 'counsel-yank-pop
  "s" 'embrace-commander
  "p" '+default/find-in-config
  "g s" 'magit-status
  "g p" 'magit-push-popup
  "g c" 'magit-commit
  "f p" 'projectile-switch-project)

(master-def
  "q r" 'restart-emacs)


(general-setq auto-revert-interval 10)
