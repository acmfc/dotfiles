;;; package --- summary
;;; Commentary:
;;; Code:

(mapc (lambda (s) (add-to-list 'load-path s))
      '("~/.emacs.d/lisp"
	"~/.emacs.d/lisp/expand-region"
	"~/.emacs.d/lisp/bongo"
	"~/.emacs.d/lisp/helm"
	"~/.emacs.d/lisp/elscreen-1.4.6"
	"~/.emacs.d/lisp/apel"
	"~/.emacs.d/lisp/iedit"
	"/home/user/.emacs.d/lisp/auto-complete"))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'wombat)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade.repo.org/packages/"))
(package-initialize)

(require 'view)
(global-set-key (kbd "C-v") 'View-scroll-half-page-forward)
(global-set-key (kbd "M-v") 'View-scroll-half-page-backward)

(require 'my_mode_configs)
(require 'my_efuncs)

(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

(setq visible-bell t)

;(global-auto-revert-mode 1)
;(setq global-auto-revert-non-file-buffers t)
;(fset 'yes-or-no-p 'y-or-n-p)

(global-set-key (kbd "M-/") (make-hippie-expand-function
			     '(try-expand-dabbrev-visible
			       try-expand-dabbrev
			       try-expand-dabbrev-all-buffers) t))

(setq sentence-end-double-space nil)

(tool-bar-mode 0)
(menu-bar-mode 0)

(column-number-mode 1)
(global-linum-mode 0)

;(setq backup-directory-alist
;      `(("." . ,(expand-file-name
;		 (concat user-emacs-directory "backups")))))

;(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq backup-directory-alist `(("." .(concat user-emacs-directory "backups"))))

(setq vc-make-backup-files t)

(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)

(put 'narrow-to-region 'disabled nil)

;;; init.el ends here
