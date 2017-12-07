(package-initialize)
;; Emacs paths
(setq emacs-lisp-dir "~/.emacs.d/"
      my-elmode-dir (concat emacs-lisp-dir "elmodes/"))
(setq load-path
      (append load-path (list my-elmode-dir)))

(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;;MELPA
(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;; y or n instead of yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;; epitech
(load "std.el")
(load "std_comment.el")

;; smart mode lines
(setq sml/no-confirm-load-theme t)
(setq sml/theme 'respectful)
(sml/setup)

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; better defaults (checking version for saveplace init syntax
(require 'better-defaults)
(if (<= emacs-major-version 24)
    (progn
      (require 'saveplace)
      (setq-default save-place t))
  (save-place-mode 1))

;; zenburn theme
(load-theme 'zenburn t)

;; line highlight
(global-hl-line-mode 1);;on
(set-face-background 'hl-line "#3e4446");;color
(set-face-foreground 'highlight nil);;keep syntax highlight

;; jedi python autocomplete
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)                 ; optional

;; copy paste X
(setq x-select-enable-clipboard t)

;; remove startup screen
(setq inhibit-startup-screen t)

;; nlinum
(setq nlinum-format "%3d\u2502")
(setq nlinum-highlight-current-line t)
(global-nlinum-mode 1)

;; smooth scrolling
(setq scroll-conservatively 10000)

;; projectile
(projectile-global-mode)

;; disable visible bell (bottom/top of file blink)
(setq visible-bell       nil
      ring-bell-function #'ignore)

;; system copy-paste
(setq x-select-enable-clipboard t)

;; fullscreen at startup
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))
