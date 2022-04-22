(use-package git-gutter
  :defer t
  :hook ((markdown-mode . git-gutter-mode)
         (prog-mode . git-gutter-mode)
         (conf-mode . git-gutter-mode))
  :init
  :config
  (setq git-gutter:disabled-modes '(org-mode asm-mode image-mode)
        git-gutter:update-interval 1
        git-gutter:window-width 1
        git-gutter:ask-p nil)
  )

(use-package git-gutter-fringe
  :diminish git-gutter-mode
  :after git-gutter
  :demand fringe-helper
  :config
  (setq-default fringes-outside-margins t)
  (setq-default left-fringe-width  2)
  (setq-default right-fringe-width 2)
  (define-fringe-bitmap 'git-gutter-fr:added
  [224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224]
  nil nil 'center)
  (define-fringe-bitmap 'git-gutter-fr:modified
  [224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224]
  nil nil 'center)
  (define-fringe-bitmap 'git-gutter-fr:deleted
  [224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224]
  nil nil 'center))

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
