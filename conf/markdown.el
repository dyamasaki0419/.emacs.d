(when (and (maybe-require-package 'markdown-preview-mode))
  (autoload 'markdown-preview-mode "markdown-preview-mode.el" t)
  (setq markdown-preview-stylesheets "https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/2.10.0/github-markdown.min.css"))

