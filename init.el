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
(load "php-mode")
(load "html-helper-mode")

;; Toggle between PHP & HTML Helper mode.  Useful when working on
;; php files, that can been intertwined with HTML code
(defun toggle-php-html-mode ()
  (interactive)
  "Toggle mode between PHP & HTML Helper modes"
  (cond ((string= mode-name "HTML helper")
	 (php-mode))
	((string= mode-name "PHP")
	 (html-helper-mode))))

(global-set-key [f5] 'toggle-php-html-mode)

;; line highlight
(global-hl-line-mode 1)
(set-face-background 'hl-line "#3e4446")
(set-face-foreground 'highlight nil)
