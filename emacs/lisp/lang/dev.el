;;; package -- Git
(use-package 
  magit 
  :bind ("C-M-;" . magit-status) 
  :commands (magit-status magit-get-current-branch) 
  :custom (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(leader-key-def "g"   
  '(:ignore t 
	    :which-key "git")
  "gs"  'magit-status "gd"  'magit-diff-unstaged "gc"  'magit-branch-or-checkout "gl"   
  '(:ignore t 
	    :which-key "log")
  "glc" 'magit-log-current "glf" 'magit-log-buffer-file "gb"  'magit-branch "gP"
  'magit-push-current "gp"  'magit-pull-branch "gf"  'magit-fetch "gF"  'magit-fetch-all "gr"
  'magit-rebase)

(use-package 
  magit-todos 
  :defer t)

(use-package 
  git-link 
  :commands git-link 
  :config (setq git-link-open-in-browser t) 
  (leader-key-def "gL"  'git-link))


(use-package 
  git-gutter 
  :straight git-gutter-fringe 
  :diminish 
  :hook ((text-mode . git-gutter-mode) 
	 (prog-mode . git-gutter-mode)) 
  :config (setq git-gutter:update-interval 2) 
  (require 'git-gutter-fringe) 
  (set-face-foreground 'git-gutter-fr:added "LightGreen") 
  (fringe-helper-define 'git-gutter-fr:added nil "XXXXXXXXXX" "XXXXXXXXXX" "XXXXXXXXXX" ".........."
    ".........." "XXXXXXXXXX" "XXXXXXXXXX" "XXXXXXXXXX" ".........." ".........." "XXXXXXXXXX"
    "XXXXXXXXXX" "XXXXXXXXXX")
  (set-face-foreground 'git-gutter-fr:modified "LightGoldenrod") 
  (fringe-helper-define 'git-gutter-fr:modified nil "XXXXXXXXXX" "XXXXXXXXXX" "XXXXXXXXXX"
    ".........." ".........." "XXXXXXXXXX" "XXXXXXXXXX" "XXXXXXXXXX" ".........." ".........."
    "XXXXXXXXXX" "XXXXXXXXXX" "XXXXXXXXXX")
  (set-face-foreground 'git-gutter-fr:deleted "LightCoral") 
  (fringe-helper-define 'git-gutter-fr:deleted nil "XXXXXXXXXX" "XXXXXXXXXX" "XXXXXXXXXX"
    ".........." ".........." "XXXXXXXXXX" "XXXXXXXXXX" "XXXXXXXXXX" ".........." ".........."
    "XXXXXXXXXX" "XXXXXXXXXX" "XXXXXXXXXX"))

(use-package 
  paren 
  :config (set-face-attribute 'show-paren-match-expression nil 
			      :background "#363e4a") 
  (show-paren-mode 1))

(use-package 
  flycheck 
  :defer t 
  :hook (lsp-mode . flycheck-mode))

(use-package 
  yasnippet 
  :hook (prog-mode . yas-minor-mode) 
  :config (yas-reload-all))

(use-package 
  smartparens 
  :hook (prog-mode . smartparens-mode))

(use-package 
  rainbow-delimiters 
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package 
  rainbow-mode 
  :defer t 
  :hook (org-mode emacs-lisp-mode elixir-mode))

(use-package 
  evil-commentary 
  :straight t 
  :config (evil-commentary-mode t))
