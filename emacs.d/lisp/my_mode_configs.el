;;; package --- summary
;;; Commentary:
;;; Code:

;; Type break
(type-break-mode 1)

;; helm
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(defvar helm-map)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z") 'helm-select-action)
(define-key helm-map (kbd "C-j") 'helm-select-action)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; Auto-Complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/auto-complete/ac-dict")
(ac-config-default)
(setq ac-auto-show-menu 0.1)

;; ac-helm
(require 'ac-helm)
(global-set-key (kbd "M-i") 'ac-complete-with-helm)
(define-key ac-complete-mode-map (kbd "M-i") 'ac-complete-with-helm)

;; projectile and helm-projectile
(require 'projectile)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; auto-complete-c-h
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (defvar achead:include-directories)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-unknown-linux-gnu/4.9.2/../../../../include/c++/4.9.2")
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-unknown-linux-gnu/4.9.2/../../../../include/c++/4.9.2/x86_64-unknown-linux-gnu")
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-unknown-linux-gnu/4.9.2/../../../../include/c++/4.9.2/backward")
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-unknown-linux-gnu/4.9.2/include")
  (add-to-list 'achead:include-directories '"/usr/local/include")
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-unknown-linux-gnu/4.9.2/include-fixed")
  (add-to-list 'achead:include-directories '"/usr/include"))

(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

;; Semantic mode
(semantic-mode 1)

;; add semantic backend to autocomplete

(defun my:add-semantic-to-autocomplete ()
  (add-to-list 'ac-sources 'ac-source-semantic))

(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

;; flycheck
(require 'flycheck)
(add-hook 'after-init-hook 'global-flycheck-mode)

;; flycheck-tip
(require 'flycheck-tip)
(flycheck-tip-use-timer 'verbose)

(defvar whitespace-style)
(setq whitespace-style '(face tabs trailing tab-mark))
(global-whitespace-mode 1)

(require 'iedit)

;; ido
(require 'ido)
(ido-mode t)

;; paren
(require 'paren)
(show-paren-mode 1)

;; golang
;(require 'go-mode)

;; Bongo/volume
(require 'bongo)
(require 'volume)

(defun read-lines (file-path)
  "Return a list of lines of a file at FILE-PATH."
  (with-temp-buffer
    (insert-file-contents file-path)
    (split-string (buffer-string) "\n" t)))

(defun bongo-insert-custom-playlist (file-path)
  "Insert each file listed in file at FILE-PATH."
  (interactive "fFile path: ")
  (mapc 'bongo-insert-file (read-lines file-path)))

;; Slime
;(setq inferior-lisp-program "/usr/bin/sbcl"
;      lisp-indent-function 'common-lisp-indent-function
;      slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
;
;(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")
;(require 'slime)
;(slime-setup)
;
;(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
;(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))

;; Evil
(require 'evil)
;(evil-mode 1)
(define-key evil-normal-state-map (kbd "C-f") 'evil-scroll-down)
(define-key evil-normal-state-map (kbd "C-b") 'evil-scroll-up)
(define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
(global-set-key (kbd "<f7>") 'evil-local-mode)

;; Key-chord
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

;; Expand-Region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; Ace-Jump
(require 'ace-jump-mode)
(global-set-key (kbd "<f8>") 'ace-jump-char-mode)
;(define-key global-map (kbd "C-c C-SPC") 'ace-jump-mode)

;; elscreen
(require 'elscreen)
(elscreen-set-prefix-key (kbd "C-t"))

;; Terminal
;(global-set-key (kbd "C-c t") 'jump-to-terminal)
;(global-set-key (kbd "C-c t") 'jump-to-shell)

;; C mode
(defun my-c-mode-common-hook ()
  "Set some options for 'c-mode'."
  (c-set-offset 'substatement-open 0)
;  (setq c++-tab-always-indent t)
  (setq c-basic-offset 4))
;  (company-mode)
;  (setq c-indent-level 4)
;  (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
;  (setq tab-width 4)
;  (setq indent-tabs-mode nil))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(defun my-go-mode-hook ()
  "Set some options for 'go-mode'."
  (setq indent-tabs-mode nil)
  (setq tab-width 4))

(add-hook 'go-mode-hook 'my-go-mode-hook)

;; Go mode
(require 'go-mode)

(provide 'my_mode_configs)
;;; my_mode_configs.el ends here
