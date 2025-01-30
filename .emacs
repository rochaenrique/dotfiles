(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(ido-mode 1)
(fido-mode 1)
(ido-everywhere 1)

(setq-default inhibit-splash-screen t
	      tab-width 4)

(setq default-frame-alist
    '((height . 30) (width . 100) (top . 10) (left . 175) (font . "Iosevka-20")))

(global-set-key (kbd "M-[") "]")
(global-set-key (kbd "M-{") "}")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("e13beeb34b932f309fb2c360a04a460821ca99fe58f69e65557d6c1b10ba18c7" default))
 '(display-line-numbers 'visual)
 '(enable-recursive-minibuffers t)
 '(package-selected-packages '(magit gruber-darker-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
