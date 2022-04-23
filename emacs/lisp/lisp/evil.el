;;; evil mode
(use-package evil
  :demand t
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-keybinding nil)
  (setq evil-undo-system 'undo-tree)

  :config
  (evil-mode 1))

(use-package undo-tree
  :init (global-undo-tree-mode 1)
  :config
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo"))))

(add-hook 'after-change-major-mode-hook
          (lambda ()
            (modify-syntax-entry ?_ "w")
            (modify-syntax-entry ?% ".")
            ))

(use-package evil-commentary
  :config
  (evil-commentary-mode))

(use-package evil-collection
  :after evil
  :config
  (setq evil-want-integration t)
  (evil-collection-init))

(use-package evil-matchit
  :config
  (global-evil-matchit-mode 1))

(setq org-agenda-files '("~/Dropbox/org"))
(setq org-todo-keywords '((sequence "TODO" "DOING" "REVIEW" "DONE")))

(require 'org)

(setq org-log-done t)

(global-set-key (kbd "C-c a") 'org-agenda)

(setq org-startup-folded t)

(use-package evil-org
  :straight
  (evil-org :type git
	    :host github
	    :repo "Somelauw/evil-org-mode"
	    :files ("evil-org.el" "evil-org-agenda.el"))
  :after org
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys)
  (add-hook 'org-mode-hook 'evil-org-mode))
