(require 'package)

(setq prelude-theme nil)

(if (eq system-type 'windows-nt)
    (add-to-list 'package-archives
                 '("melpa" . "http://mirrors.163.com/elpa/melpa/") t)
  (add-to-list 'package-archives
               '("melpa" . "https://mirrors.163.com/elpa/melpa/") t))

(if (eq system-type 'windows-nt)
    (add-to-list 'package-archives
                 '("gnu" . "http://mirrors.163.com/elpa/gnu/") t)
  (add-to-list 'package-archives
               '("gnu" . "https://mirrors.163.com/elpa/gnu/") t))

(if (eq system-type 'windows-nt)
    (add-to-list 'package-archives
                 '("nongnu" . "http://mirrors.163.com/elpa/nongnu/") t)
  (add-to-list 'package-archives
               '("nongnu" . "https://mirrors.163.com/elpa/nongnu/") t))
