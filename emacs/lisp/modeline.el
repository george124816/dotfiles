(setq nyan-animate-nyancat t)

(use-package 
  nyan-mode 
  :ensure t 
  :config
  (setq mode-line-format (list "%m" "%b |" 
			       '(:eval (list (nyan-create)))
			       "|")))


(use-package 
  smart-mode-line 
  :ensure t 
  :config (setq sml/no-confirm-load-theme t) 
  (sml/setup))
