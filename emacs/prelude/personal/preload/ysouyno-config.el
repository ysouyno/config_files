(require 'package)

(setq prelude-theme nil)

(if (eq system-type 'windows-nt)
    (add-to-list 'package-archives
                 '("melpa" . "http://mirrors.163.com/elpa/melpa/") t)
  (add-to-list 'package-archives
               '("melpa" . "https://mirrors.163.com/elpa/melpa/") t))
