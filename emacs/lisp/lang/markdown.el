;; httpd-start
;; impatient-mode
;; localhost8080/imp
;; imp-set-user-filter RET markdown-html
(use-package 
  impatient-mode 
  :ensure t 
  :config
  (defun markdown-html (buffer) 
    (princ (with-current-buffer buffer (format
					"<!DOCTYPE html><html><title>Markdown Preview</title><xmp theme=\"slate\" style=\"display:none;code, pre {background-color: \"#999999\"}\"> %s  </xmp><script src=\"http://strapdownjs.com/v/0.2/strapdown.js\"></script></html>" 
					(buffer-substring-no-properties 
					 (point-min) 
					 (point-max)))) 
	   (current-buffer))))

(require 'impatient-mode)


(use-package 
  markdown-mode 
  :straight t 
  :mode "\\.md\\'" 
  :config (setq markdown-command "marked") 
  (defun set-markdown-header-font-sizes () 
    (dolist (face '((markdown-header-face-1 . 1.2) 
		    (markdown-header-face-2 . 1.1) 
		    (markdown-header-face-3 . 1.0) 
		    (markdown-header-face-4 . 1.0) 
		    (markdown-header-face-5 . 1.0))) 
      (set-face-attribute (car face) nil 
			  :weight 'normal 
			  :height (cdr face))))
  (defun markdown-mode-hook () 
    (dw/set-markdown-header-font-sizes))
  (add-hook 'markdown-mode-hook 'dw/markdown-mode-hook))
