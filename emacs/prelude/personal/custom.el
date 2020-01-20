;;; company
(with-eval-after-load 'company
  (define-key company-active-map (kbd "\C-n") #'company-select-next)
  (define-key company-active-map (kbd "\C-p") #'company-select-previous)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  )
(setq company-idle-delay 0.3)

;;; company-c-headers
(prelude-require-package 'company-c-headers)

(require 'company-c-headers)

(add-to-list 'company-backends 'company-c-headers)
(add-to-list 'company-c-headers-path-system "/usr/lib/clang/9.0.1/include")
(add-to-list 'company-c-headers-path-system "/usr/include")
(add-to-list 'company-c-headers-path-system "/usr/local/include")
(add-to-list 'company-c-headers-path-system "/usr/include/c++/9.2.0")
(add-to-list 'company-c-headers-path-system ".")

;;; yasnippet
(prelude-require-packages '(yasnippet yasnippet-snippets))

;;; prelude-c
(defun ysouyno-c-mode-config ()
  (set (make-local-variable 'company-backends)
       '((company-c-headers company-clang
                            company-dabbrev-code company-yasnippet
                            company-rtags)))
  )

(defun ysouyno-c-mode-common-defaults ()
  (setq c-default-style "k&r"
        c-basic-offset 2)
  (add-hook 'c++-mode-hook 'ysouyno-c-mode-config)
  (add-hook 'c-mode-hook 'ysouyno-c-mode-config)
  (yas-minor-mode 1)
  )

(add-hook 'prelude-c-mode-common-hook 'ysouyno-c-mode-common-defaults t)

;;; company-quickhelp
(prelude-require-package 'company-quickhelp)
(company-quickhelp-mode)

;;; common
(global-linum-mode t)

;;; rtags
(prelude-require-package 'rtags)
(require 'rtags)
(define-key c-mode-base-map (kbd "M-.")
  (function rtags-find-symbol-at-point))
(define-key c-mode-base-map (kbd "M-,")
  (function rtags-find-references-at-point))

;;; cmake-ide
(prelude-require-package 'cmake-ide)
(cmake-ide-setup)

;;; markdown, markdown-toc
(prelude-require-package 'markdown-toc)
(setq markdown-command "pandoc")
(prefer-coding-system 'utf-8)
(add-hook 'markdown-mode-hook 'turn-on-orgtbl)

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
