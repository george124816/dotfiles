(defun last-buffer()
  "Change window to last buffer visited."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer))))

(defun open-config-file()
  "Open init.el configuration file."
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun elixir-setup()
  (interactive)
  (message (projectile-project-root)))

(use-package eshell-toggle
  :custom
  (eshell-toggle-use-projectile-root t))

;; workaround to use altgr + comma
(global-set-key (kbd "s-ç") (lambda () (interactive) (insert "ç")))

;; redefine gd on evil mode
(define-key evil-normal-state-map "gt" 'projectile-toggle-between-implementation-and-test)

(setq evil-kill-on-visual-paste nil)

(evil-define-key 'normal evil-org-mode-map
                 (kbd ">") 'org-meta-right
                 (kbd "<") 'org-meta-left)


(use-package term-toggle)

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

 "cf" 'open-config-file

 ;; "ff" 'counsel-fzf
 "ff" 'counsel-git
 ;; "fg" 'counsel-ag
 "fg" 'counsel-git-grep

 "d" 'docker

 "tt" 'term-toggle

 "fs" 'save-buffer
 "fe" 'counsel-find-file
 "qq" 'save-buffers-kill-emacs

 "w" 'evil-window-map
 "wd"  '(delete-window :which-key "delete window")
 "w/"  '(split-window-right :which-key "split right")
 "w-"  '(split-window-below :which-key "split bottom")

 ;; tests
 "tf" 'exunit-verify
 "tr" 'exunit-rerun
 "ts" 'exunit-verify-single
 "ta" 'exunit-verify-all
 "tq" 'kill-compilation
 "tc" 'mix-credo

 "en" 'next-error
 "ep" 'previous-error
 "es" 'flycheck-list-errors

 "eb" 'eval-buffer

 "TAB" 'last-buffer

 "gt" 'projectile-toggle-between-implementation-and-test

 "gb" 'magit-blame

 "pt" 'treemacs
 "pa" 'projectile-add-known-project
 "ps" 'projectile-switch-project
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
  "i" 'lsp-format-buffer
  "n" 'lsp-ui-find-next-reference
  "e" 'lsp-ui-flycheck-list
  "S" 'lsp-execute-code-action
 )

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
