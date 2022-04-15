(setq-default tab-width 4)

;; display relative line
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq display-line-numbers-type 'relative)


(use-package vterm
  :ensure t)
