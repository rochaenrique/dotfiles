(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(ido-mode 1)
(fido-mode 1)
(ido-everywhere 1)
(global-hl-line-mode 1)
;; (setq transient-mark-mode nil)
(setq imenu-flatten "annotation")

(global-set-key (kbd "C-M-c") 'compile)
(global-set-key (kbd "C-M-x") 'recompile)

(global-set-key (kbd "M-{") 'backward-list)
(global-set-key (kbd "M-}") 'forward-list)

(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)

(global-set-key (kbd "M-,") 'switch-to-prev-buffer)
(global-set-key (kbd "C-,") 'other-window)

(global-set-key (kbd "M-o") 'switch-to-buffer)
(global-set-key (kbd "M-S-o") 'switch-to-buffer-other-window)

(global-set-key (kbd "C-o") 'find-file)
(global-set-key (kbd "C-S-o") 'find-file-other-window)

(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M-SPC") 'exchange-point-and-mark)

(global-set-key (kbd "C-q") 'query-replace)

(global-set-key (kbd "M-c") 'delete-window)
(global-set-key (kbd "C-c") 'delete-other-windows)


(add-hook 'python-mode-hook
          (lambda()
            (local-unset-key (kbd "C-M-x"))))

(setq-default
 inhibit-splash-screen t
 tab-width 4
 c-offset 4
 c-style "awk")

(add-to-list 'default-frame-alist '(undecorated . t))
(add-to-list 'default-frame-alist '(undecorated-round . t))
(add-to-list 'default-frame-alist '(font . "Iosevka-20"))

(add-to-list 'load-path "~/.emacs.d/custom")

(set-foreground-color "burlywood3")
; (set-background-color "#121212")
(set-background-color "#0A0A0A")
; (set-background-color "#000000")
(set-cursor-color "#40FF40")
(set-face-background 'hl-line "#0000A8")
(set-face-attribute 'region nil :background "#600060")

(set-face-attribute 'default t :font "Iosevka-20")
(set-face-attribute 'region nil :background nil :foreground nil :inverse-video nil)
(set-face-attribute 'font-lock-builtin-face nil :foreground "#000000") 
(set-face-attribute 'font-lock-builtin-face nil :foreground "#DAB98F") 
(set-face-attribute 'font-lock-comment-face nil :foreground "gray50")
(set-face-attribute 'font-lock-doc-face nil :foreground "gray50")
(set-face-attribute 'font-lock-constant-face nil :foreground "olive drab")
(set-face-attribute 'font-lock-function-name-face nil :foreground "burlywood3")
(set-face-attribute 'font-lock-keyword-face nil :foreground "DarkGoldenrod3")
(set-face-attribute 'font-lock-string-face nil :foreground "olive drab")
(set-face-attribute 'font-lock-type-face nil :foreground "olive drab")
(set-face-attribute 'font-lock-variable-name-face nil :foreground "burlywood3")
(load "dired")
(set-face-attribute 'dired-directory nil :foreground "DarkGoldenrod3")

(setq dired-dwim-target t)

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell 
      (replace-regexp-in-string "[[:space:]\n]*$" "" 
        (shell-command-to-string "$SHELL -l -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(when (equal system-type 'darwin) (set-exec-path-from-shell-PATH))

(add-to-list 'auto-mode-alist '("\\.env\\'" . sh-mode))

;; Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'odin-mode)
;; (use-package company)                        
;; (use-package gruber-darker-theme)            
(use-package magit)                          
(use-package markdown-mode)                  
(use-package matlab-mode)                    
(use-package multiple-cursors)               
(use-package pyvenv)                         
(use-package web-mode)

;; company
;; (add-hook 'after-init-hook 'global-company-mode)
;; (setq company-idle-delay nil)
;; (global-set-key (kbd "M-n") 'company-complete) ;; Overwrites emacs default completion

;; multiple-cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)

;; web-mode
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[jt]sx\\'" . web-mode))

(add-hook 'web-mode-hook
          (lambda ()
            (setq web-mode-markup-indent-offset 2)
            (setq web-mode-css-indent-offset 2)   
            (setq web-mode-code-indent-offset 2)  
            (setq indent-tabs-mode nil)
            (setq tab-width 2)))

(add-hook 'typescript-mode-hook
          (lambda ()
			(setq typescript-indent-level 2)			
            (setq indent-tabs-mode nil)
            (setq tab-width 2)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; mac specific
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; matlab
(add-to-list 'auto-mode-alist '("\\.m$" . matlab-mode))
;; (setq matlab-shell-command "/Applications/MATLAB_R2024b.app/bin/matlab")
;; (setq matlab-shell-command-switches (list "-nodesktop"))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; custom stuff
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun author-header ()
  (interactive)
  (let ((header-str (format "/*\n\tEnrique Rochaf Benatti <rochabenattienrique@gmail.com> - %s\n*/\n" (format-time-string "%d/%m/%Y"))))
	(save-excursion
	  (goto-char (point-min))
	  (insert header-str)
	  )))

(defun java-main-func ()
  (interactive)
  (insert "public static void main(String[] args) {\n\n}")
  (c-indent-defun)
  (previous-line)
  (c-indent-line-or-region)
  )

(defalias 'java-getter
   (kmacro "C-e M-a p u b l i c SPC C-e M-b C-M-SPC M-w g e t C-SPC C-f C-x C-u M-f ( ) C-e <backspace> SPC { S-SPC <return> } C-p C-e <return> r e t u r n SPC t h i s . C-y ; C-n <return> C-p C-p C-p"))

(defun query-replace-sexp-at-point ()
  (interactive)
  (backward-word 1)
  (mark-sexp 1)
  (kill-ring-save (region-beginning) (region-end))
  (let* ((sexp (current-kill 0 t)) 
		 (replacement (read-string (format "Replace '%s' with: " sexp))))
	(deactivate-mark)
	(query-replace sexp replacement)))
(global-set-key (kbd "C-M-5") 'query-replace-sexp-at-point)

;; (defun ator-dired ()
;;   (interactive)
;;   (dired "~/dev/ator/ator/Assets/Scripts"))
;; (global-set-key (kbd "C-x C-a") 'ator-dired)

(defun check-running-p (buffer-name)
  (let ((proc (get-buffer-process buffer-name)))
	(and proc (process-live-p proc))))

(defun kill-buffer-p-if-exists (buffer-name)
  (if (check-running-p buffer-name)
	  (pop-to-buffer buffer-name)
	(when (get-buffer buffer-name) (kill-buffer buffer-name))
	))

(defun kill-buffer-if-exists (buffer-name)
	(when (get-buffer buffer-name) (kill-buffer buffer-name)))

(defun open-app-instance (app-path)
  (interactive)
  (kill-buffer-p-if-exists "*open-app-instance*")
  (async-shell-command (format "open -a %s" app-path) "*open-app-instance*" nil))

(defun open-term()
(interactive)
(let ((dir (expand-file-name default-directory)))
	(async-shell-command (format "open %s -a /Applications/Ghostty.app" dir) nil nil)))
(global-set-key (kbd "C-x C-<tab>") 'open-term)

(defvar unity-project-dir "~/dev/ator/ator")

(defun ator-setup ()
  (interactive)
  (setq unity-project-dir "~/dev/ator/ator")
  (ator-dired)
  (unity-setup)
  )

(defun ator-cmd-gen(args)
  (interactive
   (list
	(read-string "Arguments: ")))
  (compile (format "~/box/scripts/ator-cmd-gen %s " args)))

(defun unity-setup ()
  (interactive)
  (dired unity-project-dir)
  (unity)
  (sit-for 30)
  (rider-attach)
  (delete-other-windows)  
  )

(defun unity-compile ()
  (interactive)
  (compile (format "bash ~/box/scripts/unity_compiler_parse.sh ~/box/unity-log.txt %s" unity-project-dir))
  )

(defun unity ()
  (interactive)
  (kill-buffer-p-if-exists "*unity*")
  (async-shell-command (format "/Applications/Unity/Hub/Editor/6000.1.11f1/Unity.app/Contents/MacOS/Unity -projectPath %s -logFile ~/box/unity-log.txt" unity-project-dir) "*unity*" nil)
  (kill-buffer-p-if-exists "*unity-log*")
  (async-shell-command "tail -f ~/box/unity-log.txt" "*unity-log*" nil)
  )

(defun rider-attach ()
  (interactive)
  (kill-buffer-p-if-exists "*rider-attach*")
  (async-shell-command (format "bash ~/box/scripts/rider_attach.sh %s" unity-project-dir) "*rider-attach*" nil)
  (open-app-instance "/Applications/Rider.app/Contents/MacOS/rider"))

(defun jetbrains-here (app-name app-path)
  (let ((buffer-name (format "*%s-here*" app-name)))
	(kill-buffer-p-if-exists buffer-name)
	(let ((file buffer-file-name) (line (line-number-at-pos nil)))
	  (async-shell-command (format "%s --line %d %s" app-path line file) buffer-name nil)))
  (open-app-instance app-path))

(defun rider-here ()
  (interactive)
  (jetbrains-here "rider" "/Applications/Rider.app/Contents/MacOS/rider"))

(defun idea-here ()
  (interactive)
  (jetbrains-here "idea" "\"/Applications/IntelliJ IDEA.app/Contents/MacOS/idea\""))

(defun clion-here ()
  (interactive)
  (jetbrains-here "clion" "/Applications/CLion.app/Contents/MacOS/clion"))

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
  (if (check-running-p "*lldb*")
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
 '(custom-safe-themes
   '("e13beeb34b932f309fb2c360a04a460821ca99fe58f69e65557d6c1b10ba18c7"
	 default))
 '(display-line-numbers nil)
 '(enable-recursive-minibuffers t)
 '(imenu-flatten 'annotation)
 '(markdown-command "markdown")
 '(package-selected-packages
   '(company gruber-darker-theme magit markdown-mode matlab-mode
			 multiple-cursors pyvenv typescript-mode web-mode)))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'scroll-left 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
