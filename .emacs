(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(ido-mode 1)
(fido-mode 1)
(ido-everywhere 1)

;; linux specific
;; (global-set-key (kbd "M-[") "]")
;; (global-set-key (kbd "M-{") "}")

;; mac specific 

;; matlab
(add-to-list 'auto-mode-alist '("\\.m$" . matlab-mode))
(setq matlab-shell-command "/Applications/MATLAB_R2024b.app/bin/matlab")
(setq matlab-shell-command-switches (list "-nodesktop"))

(defun open-iterm()
  (interactive)
  (let ((dir (expand-file-name default-directory)))
	(async-shell-command (format "open %s -n -a /Applications/iTerm.app" dir) nil nil))
  )
(global-set-key (kbd "C-c C-<tab>") 'open-iterm)
(custom-set-variables '(markdown-command "markdown"))


(setq-default
 inhibit-splash-screen t
 tab-width 4)

(setq default-frame-alist
      '((font . "Iosevka-20")))

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(add-to-list 'load-path "~/.emacs.d/custom")
(require 'odin-mode)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[jt]sx\\'" . web-mode))

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C->") 'mc/mark-all-like-this)

(global-set-key (kbd "C-c C-t") 'transpose-regions)

(setq dired-dwim-target t)
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
 '(package-selected-packages
   '(swift-mode markdown-mode pyvenv lua-mode matlab-mode web-mode multiple-cursors magit gruber-darker-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'scroll-left 'disabled nil)
(put 'narrow-to-region 'disabled nil)
