;; clean screen
(setq inhibit-startup-message t)
(setq visible-bell t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(use-package 
  doom-themes 
  :ensure t 
  :config (load-theme 'doom-1337 t))


(defun replace-unicode-font-mapping (block-name old-font new-font) 
  (let* ((block-idx (cl-position-if (lambda (i) 
				      (string-equal (car i) block-name))
				    unicode-fonts-block-font-mapping)) 
	 (block-fonts (cadr (nth block-idx unicode-fonts-block-font-mapping))) 
	 (updated-block (cl-substitute new-font old-font block-fonts 
				       :test 'string-equal))) 
    (setf (cdr (nth block-idx unicode-fonts-block-font-mapping)) 
	  `(,updated-block))))

(use-package 
  all-the-icons 
  :ensure t)

(use-package 
  unicode-fonts 

  :disabled 
  :custom (unicode-fonts-skip-font-groups '(low-quality-glyphs)) 
  :config
  ;; Fix the font mappings to use the right emoji font
  (mapcar (lambda (block-name) 
	    (replace-unicode-font-mapping block-name "Apple Color Emoji" "Noto Color Emoji")) 
	  '("Dingbats" "Emoticons" "Miscellaneous Symbols and Pictographs"
	    "Transport and Map Symbols")) 
  (unicode-fonts-setup))

;; emoji in buffers
(use-package 
  emojify 
  :hook (erc-mode . emojify-mode) 
  :commands emojify-mode)

(use-package 
  diminish)
