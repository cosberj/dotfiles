;;; ~/tod/.doom.d/+general.el -*- lexical-binding: t; -*-
;;; code:
(load! "+functions")

(general-define-key
 ;; search
 "C-s" 'counsel-grep-or-swiper
 "C-S-s" '+ivy/project-search
 "M-S" '+ivy/project-search-from-cwd
 "M-r" 'query-replace-from-buffer-start
 "M-R" 'query-replace-regexp-from-buffer-start
 "C-'" '+ivy/projectile-find-file
 ;; killing
 "C-h" 'doom/delete-backward-char
 "C-M-h" 'backward-kill-word
 "C-S-h" 'doom/backward-kill-to-bol-and-indent
 "C-k" 'kill-and-join-forward
 "C-S-k" 'join-next-line
 "<C-S-backspace>" 'join-line
 ;; yank
 "M-y" 'counsel-yank-pop
 "C-y" 'yank-and-indent
 "M-W" 'copy-whole-line
 "C-l" 'copy-eol
 ;; movements
 "M-f" 'forward-to-word
 "C-M-f" 'forward-word
 "C-M-b" 'backward-to-word

 "C-t" 'avy-goto-char-in-line
 "C-M-p" 'backward-sexp
 "C-M-n" 'forward-sexp

 "C-a" 'doom/backward-to-bol-or-indent
 "C-e" 'doom/forward-to-last-non-comment-or-eol

 "M-P" 'backward-paragraph
 "M-N" 'forward-paragraph
 "M-j" 'scroll-up-command
 "M-k" 'scroll-down-command
 "M-g" 'goto-line
 "C-M-g" 'avy-goto-line
 ;; scale -> should change to hydra version
 "<f2>" 'hydra-zoom/body


 ;; help keys
 "<f1>" 'help-command
 "C-´" '+ivy/tasks
 ;; lines
 "C-o" 'new-line-down
 "C-S-o" 'new-line-above
 "C-M-o" 'new-line-above

 "RET" 'newline-and-indent
 ;; "C-j" 'newline-and-indent

 ;; mark
 "C-."'er/expand-region
 "C-," 'er/contract-region

 "C-M-l" 'select-whole-line
 ;; mc mark
 "C-7" 'mc/mark-previous-like-this
 "C-8" 'mc/mark-next-like-this
 ;; mc unmark
 "C-M-7" 'mc/unmark-previous-like-this
 "C-M-8" 'mc/unmark-next-like-this

 ;; undo/redo
 "C-S-u" 'redo
 "C-u" 'undo

 ;; helpers
 "M-l" 'recenter-top-bottom
 "M-h" '+lookup/documentation

 "M-u" 'avy-goto-word-1
 "M-i" 'avy-goto-char

 [C-tab] '+company/complete
 "C-M-i" 'complete-symbol

 "C-*" 'iedit-mode

 ;; Search / Replace
 "C-M-%" 'vr/query-replace
 "M-%" 'vr/replace
 "M-$" 'vr/mc-mark

 )

;; should change this for hydra
;; tab for next and prev
(general-def iedit-mode-map
  "M-;" 'iedit-toggle-selection
  "M-<" 'iedit-goto-first-occurrence
  "M->" 'iedit-goto-last-occurrence
  "M-l" 'iedit-restrict-function)

(general-define-key
 :prefix "C-x"
 ;; buffers
 "C-b" 'ivy-switch-buffer

 ;; buffers kill
 "k" 'kill-current-buffer
 "C-k" 'kill-current-buffer
 "C-S-k" 'doom/kill-other-buffers
 ;;file window
 "f" 'find-file-other-window
 "C-o" 'ace-window
 "b" 'ivy-switch-buffer-other-window
 )
(global-set-key "\C-r" nil)

(defvar master-key "C-ç")

(general-create-definer master-def
  :prefix master-key)

(master-def
  "p" '+default/find-in-config
  "C-d" '+lookup/definition
  "d" '+lookup/references
  "C-b" 'list-buffers
  )

;; file stuff
(master-def
  "f p" 'projectile-switch-project
  "f s" 'doom/sudo-this-file
  )

;; quiting
(master-def
  "q r" 'restart-emacs)

(master-def
  "o T" '+term/open
  "o t" '+term/open-popup-in-project
  "o p t" '+term/open-popup
  "o i" 'imenu-list-smart-toggle)

(general-def swiper-map
  [backtab] '+ivy/wgrep-occur)

(general-def lispy-mode-map
  "M-f" 'forward-word
  "C-." 'lispy-mark
  "C-r" 'lispy-backward)

(general-def company-active-map
  "C-n" 'company-select-next
  "C-p" 'company-select-previous
  "M-h" 'company-show-doc-buffer
  "C-j" 'company-complete
  "C-SPC" 'counsecounsel-company
  [tab]     #'company-complete-common-or-cycle
  [backtab] #'company-select-previous
  )

(general-setq auto-revert-interval 10)
