(use-package flycheck 
  :hook (lsp-mode . flycheck-mode))

(use-package flycheck-credo 
  :straight t)

(use-package smartparens
  :config
  (add-hook 'terraform-mode-hook #'smartparens-mode)
  )

;; langs
(use-package terraform-mode
  :config
  (add-hook 'terraform-mode-hook #'terraform-format-on-save-mode))

(use-package dockerfile-mode)

(use-package js2-mode)

(use-package yaml-mode)
