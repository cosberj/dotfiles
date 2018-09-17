;;; ~/tod/.doom.d/+functions.el -*- lexical-binding: t; -*-

(defun new_line_down ()
  (interactive)
  (end-of-line)
  (newline-and-indent))

(defun new_line_above ()
  (interactive)
  (previous-line)
  (new_line_down))


;; (defun kill-whole-word ()
;;   (interactive)
;;   (er/expand-region)
;;   (backward-delete-char-untabify))

(defun copy-whole-line ()
  (interactive)
  (save-excursion
    (kill-new
     (buffer-substring
      (point-at-bol)
      (point-at-eol)))))


(defun kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))

(defun kill-and-join-forward (&optional arg)
  "If at end of line, join with following; otherwise kill line.
 Deletes whitespace at join."
  (interactive "P")
  (if (and (eolp) (not (bolp)))
      (progn
        (delete-indentation t)
        (if (looking-at " $")
            (delete-char 1)))
    (kill-line arg)))

(defun join-next-line ()
  (interactive)
  (save-excursion
    (end-of-line)
    (kill-and-join-forward)))

(defun yank-and-indent ()
  "Yank and then indent the newly formed region according to mode."
  (interactive)
  (yank)
  (call-interactively 'indent-region))
