(menu-bar-mode 0)
(when (display-graphic-p)
  (tool-bar-mode 0)
  (scroll-bar-mode 0))

;; Set default font
(set-face-attribute 'default nil
                    :family "Pragmata Pro"
                    :height 140
                    :weight 'normal
                    :width 'normal)

(use-package projectile)

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
    (treemacs-fringe-indicator-mode 'always)
)


(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-projects-backend 'projectile)
  (setq dashboard-items '((recents  . 10)
                          (bookmarks . 5)
                          (projects . 5)
                          (agenda . 10)
                          (registers . 5))))

(provide 'dashboard-config)
(require 'dashboard)

(use-package afternoon-theme)

(use-package color-theme-sanityinc-tomorrow)
(use-package material-theme)
(use-package apropospriate-theme)
(use-package doom-themes)

(load-theme 'doom-snazzy t)

