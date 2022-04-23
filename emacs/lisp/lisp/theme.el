;; Disable splash screen and startup message
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

(setq-default indent-tabs-mode nil)

;; (setq-default show-trailing-whitespace t)
(setq-default indicate-empty-lines t)
(setq-default indicate-buffer-boundaries 'left)

(menu-bar-mode 0)
(when (display-graphic-p)
  (tool-bar-mode 0)
  (scroll-bar-mode 0))

;; display relative line
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
;; (global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

(set-default 'truncate-lines t)

(set-face-attribute 'default nil
                    :family "Iosevka"
                    :height 140
                    :weight 'normal
                    :width 'normal)

(use-package projectile
  :config
  (setq projectile-create-missing-test-files t)
  (projectile-mode +1))

(use-package all-the-icons
  :if (display-graphic-p))

(use-package treemacs
  :ensure t
  :after evil
  :defer t
 :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
 (progn
   (setq treemacs-show-cursor  nil))

    (treemacs-define-RET-action 'file-node-closed #'treemacs-visit-node-in-most-recently-used-window)
    (treemacs-define-RET-action 'file-node-open #'treemacs-visit-node-in-most-recently-used-window)

    (treemacs-define-doubleclick-action 'file-node-closed #'treemacs-visit-node-in-most-recently-used-window)
    (treemacs-define-doubleclick-action 'file-node-open #'treemacs-visit-node-in-most-recently-used-window)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always))

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)

  (setq dashboard-startup-banner 'logo
        dashboard-set-heading-icons t
        dashboard-set-file-icons t
        dashboard-center-content t
        ;; dashboard-projects-backend 'projectile)
        dashboard-projects-backend 'project-el
        dashboard-projects-switch-function 'switch-project)

  (setq dashboard-items '((recents  . 10)
                          (bookmarks . 5)
                          (projects . 10)
                          (agenda . 10)
                          (registers . 5))))

(provide 'dashboard-config)
(require 'dashboard)

(use-package afternoon-theme)

(use-package material-theme)
(use-package apropospriate-theme)
(use-package doom-themes)

(load-theme 'doom-tomorrow-night)

(use-package rainbow-mode)

(setq scroll-conservatively 100)
