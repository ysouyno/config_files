;;; common
(global-linum-mode t)

;;; whitespace
(require 'whitespace)
(setq whitespace-style '(face tabs empty trailing))

;;; fci-mode
(prelude-require-package 'fill-column-indicator)
(require 'fill-column-indicator)
(setq fci-rule-column 80)

;;; yasnippet
(prelude-require-packages '(yasnippet yasnippet-snippets))

;;; need enable prelude-company
(require 'company)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "\C-n") #'company-select-next)
  (define-key company-active-map (kbd "\C-p") #'company-select-previous)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "<tab>") #'company-complete-selection)
  )
(setq company-idle-delay 0.3)

;;; need enable prelude-lsp
(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  ;; clangd or ccls
  :hook ((c-mode c++-mode) . lsp)
  :hook ((c-mode c++-mode) . yas-minor-mode)
  :hook ((c-mode c++-mode) . (lambda ()
                               (setq c-default-style "k&r"
                                     c-basic-offset 2)))
  ;; gopls
  :hook (go-mode . lsp-deferred)
  :hook (go-mode . yas-minor-mode)
  )

;;; company-quickhelp
(prelude-require-package 'company-quickhelp)
(company-quickhelp-mode)

;;; markdown, markdown-toc
(prelude-require-package 'markdown-toc)
(require 'markdown-mode)
(setq markdown-command "pandoc")
(prefer-coding-system 'utf-8)
(add-hook 'markdown-mode-hook 'turn-on-orgtbl)

;; disable company-mode in markdown-mode
(defun ysouyno-markdown-mode-hook ()
  (company-mode -1))
(add-hook 'markdown-mode-hook 'ysouyno-markdown-mode-hook)

;;; windows-nt: FIND: Parameter format not correct
(when (eq system-type 'windows-nt)
  ;; Make sure Unix tools are in front of `exec-path'
  (let ((bash (executable-find "bash")))
    (when bash
      (push (file-name-directory bash) exec-path)))
  ;; Update PATH from exec-path)
  (let ((path (mapcar 'file-truename
                      (append exec-path
                              (split-string
                               (getenv "PATH") path-separator t)))))
    (setenv "PATH" (mapconcat 'identity
                              (delete-dups path) path-separator)))
  )
