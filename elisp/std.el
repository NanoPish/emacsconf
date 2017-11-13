(defun do_insert_time () 
  (interactive)
 (insert-string (current-time-string)))
(set-variable 'c-argdecl-indent   0)


(normal-erase-is-backspace-mode 0)

(global-set-key "" 'backward-delete-char)
(global-set-key "" 'compile)
(global-set-key "" 'goto-line)
