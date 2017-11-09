;; Emacs paths
(setq emacs-lisp-dir "~/.emacs.d/"
      my-elmode-dir (concat emacs-lisp-dir "elmodes/"))
(setq load-path
      (append load-path (list my-elmode-dir)))

(add-to-list 'load-path "~/.emacs.d/elisp")

(if (file-exists-p "~/.myemacs") 
    (load-file "~/.myemacs"))

;; elisp loading
(load "std.el")
(load "std_comment.el")

;; web-mode start when open files
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

;; line highlight
(global-hl-line-mode 1)
(set-face-background 'hl-line "#3e4446")
(set-face-foreground 'highlight nil)

;; MELPA packages 
(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
		    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line
