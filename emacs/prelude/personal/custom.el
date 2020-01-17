;;; company
(with-eval-after-load 'company
  (define-key company-active-map (kbd "\C-n") #'company-select-next)
  (define-key company-active-map (kbd "\C-p") #'company-select-previous)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  )
(setq company-idle-delay 0.1)

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
                            company-dabbrev-code company-yasnippet)))
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
