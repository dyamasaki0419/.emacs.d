(when (and (maybe-require-package 'ac-php) (maybe-require-package 'helm-gtags) (maybe-require-package 'flycheck))
  (add-hook 'helm-gtags-mode-hook
	    '(lambda ()
	       (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
	       (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
	       (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
	       (local-set-key (kbd "M-l") 'helm-gtags-select)
	       (local-set-key (kbd "C-t") 'helm-gtags-pop-stack)))
  (add-hook 'php-mode-hook
	    '(lambda ()
	       (auto-complete-mode t)
	       (require 'ac-php)
	       (setq ac-sources '(ac-source-php))
	       (yas-global-mode 1)
	       (define-key php-mode-map (kbd "C-]") 'ac-php-find-symbol-at-point)
	       (define-key php-mode-map (kbd "C-t") 'ac-php-location-stack-back)))
  (add-hook 'after-init-hook #'global-flycheck-mode))
