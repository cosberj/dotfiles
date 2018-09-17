;;; ~/tod/.doom.d/+functions.el -*- lexical-binding: t; -*-

(defun new_line_down ()
  "Act like o in vim."
  (interactive)
  (end-of-line)
  (newline-and-indent))

(defun new_line_above ()
  "Act like O in vim."
  (interactive)
  (previous-line)
  (new_line_down))

(defun copy-whole-line ()
  "Copy current line."
  (interactive)
  (save-excursion
    (kill-new
     (buffer-substring
      (point-at-bol)
      (point-at-eol)))))

(defun copy-eol ()
  "Act like y$ in vim."
  (interactive)
  (save-excursion
    (kill-new
     (buffer-substring
      (point)
      (point-at-eol)))))

(defun select-whole-line ()
  "Select current line."
  (interactive)
  (set-mark-command (beginning-of-line))
  (end-of-line)
  )

(defun kill-current-buffer ()
  "Kill current buffer."
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
  "Join next line."
  (interactive)
  (save-excursion
    (end-of-line)
    (kill-and-join-forward)))

(defun yank-and-indent ()
  "Yank and then indent the newly formed region according to mode."
  (interactive)
  (yank)
  (call-interactively 'indent-region))
