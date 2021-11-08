					; cancel all on esc
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; C-u to scroll
(global-set-key (kbd "C-M-u") 'universal-argument)

;; evil mode

(defun evil-hook () 
  (dolist (mode '(custom-mode eshell-mode git-rebase-mode erc-mode circe-server-mode circe-chat-mode
			      circe-query-mode sauron-mode term-mode)) 
    (add-to-list 'evil-emacs-state-modes mode))
  )

(defun dont-arrow-me-bro () 
  (interactive) 
  (message "Arrow keys are bad, you know?")
  )

(use-package 
  undo-tree 
  :init (global-undo-tree-mode 1)
  )

(use-package 
  evil 
  :init (setq evil-want-integration t) 
  (setq evil-want-keybinding nil) 
  (setq evil-want-C-u-scroll t) 
  (setq evil-want-C-i-jump nil) 
  (setq evil-respect-visual-line-mode t) 
  (setq evil-undo-system 'undo-tree) 
  :config (add-hook 'evil-mode-hook 'evil-hook) 
  (evil-mode 1) 
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state) 
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line) 
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  ;; Disable arrow keys in normal and visual modes
  (define-key evil-normal-state-map (kbd "<left>") 'dont-arrow-me-bro) 
  (define-key evil-normal-state-map (kbd "<right>") 'dont-arrow-me-bro) 
  (define-key evil-normal-state-map (kbd "<down>") 'dont-arrow-me-bro) 
  (define-key evil-normal-state-map (kbd "<up>") 'dont-arrow-me-bro) 
  (evil-global-set-key 'motion (kbd "<left>") 'dont-arrow-me-bro) 
  (evil-global-set-key 'motion (kbd "<right>") 'dont-arrow-me-bro) 
  (evil-global-set-key 'motion (kbd "<down>") 'dont-arrow-me-bro) 
  (evil-global-set-key 'motion (kbd "<up>") 'dont-arrow-me-bro) 
  (evil-set-initial-state 'messages-buffer-mode 'normal) 
  (evil-set-initial-state 'dashboard-mode 'normal)
  )

(use-package 
  evil-collection 
  :after evil 
  :init (setq evil-collection-company-use-tng nil) ;; Is this a bug in evil-collection?
  :custom (evil-collection-outline-bind-tab-p nil) 
  :config (setq evil-collection-mode-list (remove 'lispy evil-collection-mode-list)) 
  (evil-collection-init)
  )


(use-package 
  which-key 
  :init (which-key-mode) 
  :diminish which-key-mode 
  :config (setq which-key-idle-delay 0.3)
  )

(use-package 
  general 
  :config (general-evil-setup t) 
  (general-create-definer leader-key-def 
    :states '(normal visual motion) 
    :keymaps 'override 
    :prefix "SPC" 
    :global-prefix "C-SPC") 
  (general-create-definer ctrl-c-keys 
    :prefix "C-c")
  )

(use-package 
  use-package-chords
  :disabled 
  :config (key-chord-mode 1)
  )

(use-package 
  projectile 
  :ensure t 
  :config (projectile-mode)
  )

(defun last-buffer() 
  "Change window to last buffer visited." 
  (interactive) 
  (switch-to-buffer (other-buffer (current-buffer)))
  )

(defun open-config-file() 
  (interactive) 
  (find-file "~/.emacs.d/init.el")
  )

(use-package 
  helm 
  :ensure t 
  :init (setq helm-mode-fuzzy-match t) 
  (setq helm-completion-in-region-fuzzy-match t) 
  (setq helm-candidate-number-list 50) 
  :config (leader-key-def "SPC" '(helm-M-x :which-key "M-x") "TAB" 'last-buffer "/"
	    '(helm-projectile-ag :which-key "fuzzy search")

	    ;; utils
	    "qq"  'save-buffers-kill-terminal "fed" 'open-config-file "at"  '(ansi-term :which-key
											"open terminal")
"ff"  '(find-file :which-key "find file") "fs"  'save-buffer
"pf"  '(helm-projectile-find-file :which-key "find file in project") "pt"  '(treemacs :which-key "treemacs")
"bb"  '(helm-buffers-list :which-key "buffers list") "bd"  '(kill-this-buffer :which-key "kill buffer")
)
)

(use-package
helm-ag
:ensure t
)

(use-package
helm-ls-git
:ensure t
)

(use-package
helm-projectile
:ensure t
)

(use-package
projectile-ripgrep
:ensure t
)

(use-package
treemacs
:ensure t
:defer t
:init
:config (progn
(setq treemacs-deferred-git-apply-delay        0.5 treemacs-directory-name-transformer      #'identity treemacs-display-in-side-window          t treemacs-eldoc-display                   t treemacs-file-event-delay                5000 treemacs-file-extension-regex            treemacs-last-period-regex-value treemacs-file-follow-delay               0.2 treemacs-file-name-transformer           #'identity treemacs-follow-after-init               t treemacs-expand-after-init               t treemacs-git-command-pipe                "" treemacs-goto-tag-strategy               'refetch-index treemacs-indentation                     2 treemacs-indentation-string              " " treemacs-is-never-other-window           nil treemacs-max-git-entries                 5000 treemacs-missing-project-action          'ask treemacs-move-forward-on-expand          nil treemacs-no-png-images                   nil treemacs-no-delete-other-windows         t treemacs-project-follow-cleanup          nil treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" user-emacs-directory) treemacs-position                        'left treemacs-read-string-input               'from-child-frame treemacs-recenter-distance               0.1 treemacs-recenter-after-file-follow      nil treemacs-recenter-after-tag-follow       nil treemacs-recenter-after-project-jump     'always treemacs-recenter-after-project-expand   'on-distance treemacs-show-cursor                     nil treemacs-show-hidden-files               t treemacs-silent-filewatch                nil treemacs-silent-refresh                  nil treemacs-sorting                         'alphabetic-asc treemacs-select-when-already-in-treemacs 'move-back treemacs-space-between-root-nodes        t treemacs-tag-follow-cleanup              t treemacs-tag-follow-delay                1.5 treemacs-text-scale                      nil treemacs-user-mode-line-format           nil treemacs-user-header-line-format         nil treemacs-width                           35 treemacs-width-is-initially-locked       t treemacs-workspace-switch-cleanup        nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)
(treemacs-follow-mode t)
(treemacs-filewatch-mode t)
(treemacs-fringe-indicator-mode 'always)
(pcase (cons (not (null (executable-find "git")))
(not (null treemacs-python-executable)))
(`(t . t)
(treemacs-git-mode 'deferred))
(`(t . _)
(treemacs-git-mode 'simple)))
(treemacs-hide-gitignored-files-mode nil))
)

(use-package
treemacs-evil
:after (treemacs evil)
:ensure t
)

(use-package
restart-emacs
:ensure t
:config (leader-key-def "q r" 'restart-emacs)
)

(use-package
winum
:ensure t
:init (setq-default winum-keymap nil)
:config (winum-mode t)
(leader-key-def :states '(normal visual motion)
:keymaps 'override
:prefix "SPC"
"0" 'winum-select-window-0-or-10 "1" 'winum-select-window-1 "2" 'winum-select-window-2 "3" 'winum-select-window-3 "4" 'winum-select-window-4 "5" 'winum-select-window-5 "6" 'winum-select-window-6 "7" 'winum-select-window-7 "8" 'winum-select-window-8 "9" 'winum-select-window-9
"wl"  '(windmove-right :which-key "move right") "wh"  '(windmove-left :which-key "move left") "wk"  '(windmove-up :which-key "move up") "wj"  '(windmove-down :which-key "move bottom")

"w{"  'shrink-window-horizontally "w}"  'enlarge-window-horizontally "w["  'shrink-window "w]"  'enlarge-window
"w/"  '(split-window-right :which-key "split right") "w-"  '(split-window-below :which-key "split bottom")
"wd"  '(delete-window :which-key "delete window"))
)
