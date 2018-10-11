(when (and (maybe-require-package 'typescript-mode) (maybe-require-package 'company) (maybe-require-package 'tide))
  (require 'typescript-mode)
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
  (require 'tide)
  (add-hook 'typescript-mode-hook (lambda ()
    (tide-setup)
    (flycheck-mode t)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode t)
    (company-mode-on)))
  (require 'company)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "C-h") nil)
  (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)
  (define-key company-active-map (kbd "M-d") 'company-show-doc-buffer)
  (setq company-minimum-prefix-length 1)
  (setq company-selection-wrap-around t)
  (set-face-attribute 'company-tooltip nil :foreground "black" :background "lightgray")
  (set-face-attribute 'company-preview-common nil :foreground "dark gray" :background "black" :underline t)
  (set-face-attribute 'company-tooltip-selection nil :background "steelblue" :foreground "white")
  (set-face-attribute 'company-tooltip-common nil :foreground "black" :underline t)
  (set-face-attribute 'company-tooltip-common-selection nil :foreground "white" :background "steelblue" :underline t)
  (set-face-attribute 'company-tooltip-annotation nil :foreground "red"))