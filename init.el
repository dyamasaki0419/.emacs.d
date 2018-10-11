(require 'package)
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("melpa" . "http://melpa.org/packages/")
	("org" . "http://orgmode.org/elpa/")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (markdown-preview-mode tide company-tern rbenv robe ruby-electric company-go scss-mode elscreen flycheck helm-gtags ac-php color-theme-sanityinc-tomorrow))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION. If NO-REFRESH is non-nil, the available package lists will not be re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
    t
    (if (or (assoc package package-archive-contents) no-refresh)
      (if (boundp 'package-selected-packages)
	(package-install package nil)
	(package-install package))
      (progn
	(package-refresh-contents)
	(require-package package min-version t)))))

(defun maybe-require-package (package &optional min-version no-refresh)
  "Try to install PACKAGE, and return non-nil if successful. In the event of failure, return nil and print a warning message. Optionally require MIN-VERSION. If NO-REFRESH is non-nil, the available package lists will not be re-downloaded in order to locate PACKAGE."
  (condition-case err
    (require-package package min-version no-refresh)
    (error
      (message "Couldn't install optional package `%s': %S" package err)
      nil)))

(global-set-key "\C-h" 'delete-backward-char)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq net-line-add-newlines nil)
(line-number-mode t)
(column-number-mode t)
(show-paren-mode t)
(setq scroll-step 1)

(setq load-path (append '("~/.emacs.d/packages") load-path))
(setq load-path (append '("~/.emacs.d/conf") load-path))
(load "theme")
(load "tabscreen")
(load "php")
(load "go")
(load "ruby")
(load "javascript")
(load "typescript")
(load "scss")
(load "markdown")
