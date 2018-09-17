;;; ~/tod/.doom.d/+general.el -*- lexical-binding: t; -*-
(load! "+functions")
(general-define-key
 "RET" 'newline-and-indent
 "C-v" 'er/expand-region
 "C-S-v" 'er/contract-region
 "M-s" 'counsel-grep-or-swiper
 "C-o" 'new_line_down
 "C-S-o" 'new_line_above
 ;; "M-d" 'kill-whole-word
 "M-W" 'copy-whole-line
 "C-k" 'kill-and-join-forward
 "C-S-k" 'join-next-line
 "<C-S-backspace>" 'join-line
 "C-y" 'yank-and-indent
 "M-p" 'project-find-file
 "M-i" 'imenu
 "M-I" 'imenu-anywhere
 )


(general-define-key
 :prefix "C-x"
 "k" 'kill-current-buffer)

(defvar master-key "C-ç")

(general-create-definer master-def
  :prefix master-key)

(master-def
  "y" 'counsel-yank-pop
  "s" 'embrace-commander
  "p" '+default/find-in-config
  "g" 'magit-status
  "f" 'projectile-switch-project)

(master-def
  "q r" 'restart-emacs)


(general-setq auto-revert-interval 10)
