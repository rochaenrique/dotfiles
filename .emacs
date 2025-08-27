(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(ido-mode 1)
(fido-mode 1)
(ido-everywhere 1)

(global-set-key (kbd "M-o M-p") 'windmove-up)
(global-set-key (kbd "M-o M-b") 'windmove-left)
(global-set-key (kbd "M-o M-f") 'windmove-right)
(global-set-key (kbd "M-o M-n") 'windmove-down)

(setq-default
 inhibit-splash-screen t
 tab-width 4
 c-basic-offset 4
 c-basic-style "allman")

(setq default-frame-alist
      '((font . "Iosevka-20") ))

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(add-to-list 'load-path "~/.emacs.d/custom")

(global-set-key (kbd "C-c C-t") 'transpose-regions)

(setq dired-dwim-target t)

(defun dired-ator()
  (interactive)
  (dired "~/dev/ator/ator/Assets/Scripts"))
(global-set-key (kbd "C-x C-a") 'dired-ator)

;; Packages
(use-package company)                        
(use-package gruber-darker-theme)            
(use-package magit)                          
(use-package markdown-mode)                  
(use-package matlab-mode)                    
(use-package multiple-cursors)               
(use-package pyvenv)                         
(use-package web-mode)                       

;; company
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay nil)
(global-set-key (kbd "M-/") 'company-complete) ;; This overwrites emacs default completion

;; multiple-cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C->") 'mc/mark-all-like-this)

;; web-mode
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[jt]sx\\'" . web-mode))

;; linux specific
(global-set-key (kbd "M-[") "]")
(global-set-key (kbd "M-{") "}")

;; mac specific

;; matlab
(add-to-list 'auto-mode-alist '("\\.m$" . matlab-mode))
;; (setq matlab-shell-command "/Applications/MATLAB_R2024b.app/bin/matlab")
;; (setq matlab-shell-command-switches (list "-nodesktop"))

(defun open-term()
  (interactive)
  (let ((dir (expand-file-name default-directory)))
	(async-shell-command (format "open %s -n -a /Applications/Ghostty.app" dir) nil nil))
  )
(global-set-key (kbd "C-c C-<tab>") 'open-term)

(defun lldb-check-running-p ()
  "Check if there is a current lldb process running"
  (let ((proc (get-buffer-process "*lldb*")))
	(and proc (process-live-p proc))))

(defun lldb-create (filename args)
  "Create lldb async shell command"
  (interactive
   (list
	(read-file-name "Executable: ")
	(read-string "Arguments: ")))
  
  (if (= (length args) 0)
	  (async-shell-command (format "lldb %s" filename) "*lldb*" nil)	  
	(async-shell-command (format "lldb %s -- %s" filename args) "*lldb*" nil))
  (pop-to-buffer "*lldb*")
  )

(defun lldb-create-if-not ()
  "Creates a lldb process if there isnt one"
  (if (lldb-check-running-p)
	  (pop-to-buffer "*lldb*")
	(when (get-buffer "*lldb*") (kill-buffer "*lldb*"))
	(call-interactively 'lldb-create)
	(goto-char (point-max))
	))

(defun lldb ()
  "Creates a lldb process if there inst one interactivly"
  (interactive)
  (lldb-create-if-not))

(defun lldb-breakpoint ()
  "Create a breakpoint at the current line of current file in active lldb async shell command"
  (interactive)
  (let ((file buffer-file-name) (line (line-number-at-pos nil)))
	(lldb-create-if-not)
	(process-send-string "*lldb*"
						 (format "breakpoint set --file %s --line %s\n" file line))))

(defun lldb-list-breakpoints ()
  "List breakpoints in a compilation-mode manner."
  (interactive)
  (with-current-buffer "*lldb*"
    (widen)
    (goto-char (point-max))
    (when (search-backward "Current breakpoints:" nil t)
      (let ((breakpoints-string (buffer-substring-no-properties (point) (point-max)))
            (output-buffer (get-buffer-create "*lldb breakpoints*")))

        (with-current-buffer output-buffer
          (let ((inhibit-read-only t))
            (erase-buffer)

            (insert "-*- mode: compilation -*-\n")
            (insert (format "LLDB Breakpoints at %s\n\n" (format-time-string "%c")))

            (let ((start 0))
              (while (string-match "\\([0-9]+\\): file = '\\(.*?\\)', line = \\([0-9]+\\)" breakpoints-string start)
                (let ((bp-num (match-string 1 breakpoints-string))
                      (file (match-string 2 breakpoints-string))
                      (line (match-string 3 breakpoints-string)))
                  (when file
					(insert (format "%s:%s: warning Breakpoint %s\n" file line bp-num))))
                (setq start (match-end 0)))))

          (goto-char (point-min))
          (compilation-mode))

        (switch-to-buffer output-buffer)))))

(defun lldb-set-breakpoints ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "__breakpoint__();" nil t)
      (goto-char (match-beginning 0))
      (lldb-breakpoint))))

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
 '(markdown-command "markdown")
 '(package-selected-packages
   '(company markdown-mode pyvenv matlab-mode web-mode multiple-cursors magit gruber-darker-theme)))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'scroll-left 'disabled nil)
(put 'narrow-to-region 'disabled nil)
