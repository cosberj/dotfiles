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
 "C-o" 'new_line_down
 "C-S-o" 'new_line_above
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
 "f" 'find-file-other-window)

(defvar master-key "C-ç")

(general-create-definer master-def
  :prefix master-key)

(master-def
  "s" 'embrace-commander
  "p" '+default/find-in-config
  "i s" 'yas-insert-snippet
  "i y" 'counsel-yank-pop
  "f p" 'projectile-switch-project)
;; git stuff
(master-def
  "g s" 'magit-status
  "g p" 'magit-push-popup
  "g c" 'magit-commit)
;; quiting
(master-def
  "q r" 'restart-emacs)
;; workspaces
(master-def
  "' n" '+workspace/new
  "' d" '+workspace/delete)

(general-def swiper-map
  [backtab] '+ivy/wgrep-occur)

(general-setq auto-revert-interval 10)
