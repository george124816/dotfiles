(setq compilation-scroll-output t)
(setq n-dots 100)

;; (setq compilation-scroll-output 'first-error)
(setq compilation-scroll-output t)

(defun new-line-when-n-dots()
  "Function to break the line when searching n dots"
  (goto-char (point-min))
  (while (re-search-forward (format "\\.\\{%d\\}" n-dots) nil t)
	(delete-backward-char 1)
	(insert "\n")
	(goto-char (point-max))
  ))

(define-minor-mode new-line-when-n-dots-mode
  "Insert a line break when detecting continuous n dots in compilation buffers"
  :global t
  (cond
   (new-line-when-n-dots-mode
    (add-hook 'compilation-filter-hook 'new-line-when-n-dots))
   (t
    (remove-hook 'compilation-filter-hook 'new-line-when-n-dots))))

(new-line-when-n-dots-mode)

(add-hook 'compilation-mode-hook 'turn-on-visual-line-mode)

(add-hook 'compilation-mode-hook #'so-long-minor-mode)
