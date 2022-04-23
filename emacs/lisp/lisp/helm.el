(use-package helm
:straight t
:config
  (setq helm-mode-fuzzy-match t)
  (setq helm-completion-in-region-fuzzy-match t)
)

(use-package helm-ag
  :ensure t)

(use-package helm-ls-git
  :ensure t)

(use-package helm-projectile
  :ensure t)

(use-package projectile-ripgrep
  :ensure t)
