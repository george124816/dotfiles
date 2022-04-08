(defun last-buffer() 
  "Change window to last buffer visited." 
  (interactive) 
  (switch-to-buffer (other-buffer (current-buffer))))

(use-package eshell-toggle
  :custom
  (eshell-toggle-use-projectile-root t))

;; workaround to use altgr + comma
(global-set-key (kbd "s-ç") (lambda () (interactive) (insert "ç")))

(use-package general 
  :ensure t
  :init
  (setq general-override-states '(insert
                                  emacs
                                  hybrid
                                  normal
                                  visual
                                  motion
                                  operator
                                  replace))
  :config
  (general-evil-setup t) 
  (general-create-definer global-definer
    :keymaps 'override 
    :states '(normal visual motion) 
    :prefix "SPC"))

(global-definer
 "SPC" 'counsel-M-x

 "ff" 'counsel-fzf
 "fg" 'counsel-ag

 "tt" 'eshell-toggle

 "fs" 'save-buffer
 "fe" 'counsel-find-file
 "qq" 'save-buffers-kill-emacs

 "w" 'evil-window-map
 "wd"  '(delete-window :which-key "delete window")
 "w/"  '(split-window-right :which-key "split right")
 "w-"  '(split-window-below :which-key "split bottom")

 "TAB" 'last-buffer

 "pt" 'treemacs
 )

;; macro to create a group of keymapping
(defmacro general-global-menu-definer (def infix-key &rest body)
  "Create a definer named general-global-DEF wrapping global-definer.
The prefix map is named 'my-DEF-map'."
  `(progn
     (general-create-definer ,(intern (concat "general-global-" def))
       :wrapping global-definer
       :prefix-map (quote ,(intern (concat "my-" def "-map")))
       :infix ,infix-key
       :wk-full-keys nil
       "" '(:ignore t :which-key ,def))
     (,(intern (concat "general-global-" def))
      ,@body)))

(general-global-menu-definer
 "buffer" "b"
 "b" 'ivy-switch-buffer
 "d" 'kill-current-buffer)

(general-global-menu-definer
 "lsp" "l"
 "i" 'lsp-format-buffer)

(use-package which-key
  :config
  (which-key-mode))

(use-package winum
  :config
  (require 'winum)
  (winum-mode)
  (define-key evil-window-map "1" 'winum-select-window-1)
  (define-key evil-window-map "2" 'winum-select-window-2)
  (define-key evil-window-map "3" 'winum-select-window-3)
  (define-key evil-window-map "4" 'winum-select-window-4)
  (define-key evil-window-map "5" 'winum-select-window-5)
  (define-key evil-window-map "6" 'winum-select-window-6)
  (define-key evil-window-map "7" 'winum-select-window-7)
  (define-key evil-window-map "8" 'winum-select-window-8)
  (define-key evil-window-map "9" 'winum-select-window-9)
  (define-key evil-window-map "0" 'treemacs-select-window))

(use-package restart-emacs
  :ensure t
  :config
  (global-definer "q r" 'restart-emacs))


(use-package magit
  :ensure t
  :config
  (global-definer "g s" 'magit-status))
