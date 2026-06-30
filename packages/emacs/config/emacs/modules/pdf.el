;;; pdf.el --- PDF -*- lexical-binding: t; -*-


;;; Commentary:


;;; Code:

(use-package pdf-tools
  
  :hook
  (pdf-view-mode . (lambda ()
                     (disable display-line-numbers-mode)))
  
  :config
  (pdf-tools-install))


;;; Footer:

(provide 'pdf)


;;; pdf.el ends here
