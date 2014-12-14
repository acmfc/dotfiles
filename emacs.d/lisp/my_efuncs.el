;;; package --- summary
;;; Commentary:
;;; Code:

(defun kill-daemon ()
  "Kill Emacs when running in daemon mode."
  (interactive)
  (progn
    (setq kill-emacs-hook 'nil)
    (kill-emacs)))

(defun rename-file-and-buffer (new-name)
  "Renames current buffer and the file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
	(filename (buffer-file-name)))
    (if (not filename)
	(message "Buffer '%s' is not visiting a file" name)
	(if (get-buffer new-name)
	    (message "A buffer named '%s' already exists" new-name)
	    (progn (rename-file name new-name 1)
		   (rename-buffer new-name)
		   (set-visited-file-name new-name)
		   (set-buffer-modified-p nil))))))

(defun move-buffer-file (dir)
  "Move both current buffer and file it's visiting to DIR."
  (interactive "DNew directory: ")
  (let* ((name (buffer-name))
	 (filename (buffer-file-name))
	 (dir
	  (if (string-match dir "\\(?:/\\|\\\\)$")
	      (substring dir 0 -1) dir))
	 (newname (concat dir "/" name)))
    (if (not filename)
	(message "Buffer '%s' is not visiting a file" name)
	(progn
	  (copy-file filename newname 1)
	  (delete-file filename)
	  (set-visited-file-name newname)
	  (set-buffer-modified-p nil)))))

(global-set-key [remap goto-line] 'goto-line-with-feedback)
(defun goto-line-with-feedback ()
  "Show line numbers temporarily while prompting for line number input."
  (interactive)
  (let ((was-linum linum-mode))
    (unwind-protect
	(progn
	  (linum-mode 1)
	  (let ((current-prefix-arg (read-number "Goto line: ")))
	    (call-interactively 'goto-line)))
      (if (not was-linum)
	  (linum-mode -1)))))

;(defun dired-back-to-top ()
;  (interactive)
;  (beginning-of-buffer)
;  (dired-next-line 4))
;
;(define-key dired-mode-map
;    (vector 'remap 'beginning-of-buffer) 'dired-back-to-top)
;
;(defun dired-jump-to-bottom ()
;  (interactive)
;  (end-of-buffer)
;  (dired-next-line -1))
;
;(define-key dired-mode-map
;    (vector 'remap 'end-of-buffer) 'dired-jump-to-bottom)

;(eval-after-load "dired"
;  '(progn
;     (defvar dired-mode-map)
;     (define-key dired-mode-map "F" 'my-dired-find-file)
;     (defun my-dired-find-file (&optional arg)
;       "Open each of the marked files or the file under the point or when prefixed with N, next N files"
;       (interactive "P")
;       (let* ((fn-list (dired-get-marked-files nil arg)))
;	 (mapc 'find-file fn-list)))))

(defun iwb ()
  "Indent whole buffer."
  (interactive)
  (save-excursion
    (delete-trailing-whitespace)
    (indent-region (point-min) (point-max) nil)
    (untabify (point-min) (point-max))))

(defun iwb-tabs ()
  "Indent whole buffer."
  (interactive)
  (save-excursion
    (delete-trailing-whitespace)
    (indent-region (point-min) (point-max) nil)))

;(defun create-c-tags (dir-name)
;  "Create tags file."
;  (interactive "DDirectory: ")
;  (eshell-command
;   (format "find %s -type f -name \"*.[ch]\" | etags -" dir-name)))

(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
	     (current-buffer))
    (error (message "Invalid expression")
	   (insert (current-kill 0)))))

(global-set-key (kbd "C-c C-e") 'eval-and-replace)

(provide 'my_efuncs)
;;; my_efuncs.el ends here
