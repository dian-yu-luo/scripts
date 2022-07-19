(setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize) 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor-type 'bar)
 '(custom-safe-themes
   '("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default))
 '(global-highlight-parentheses-mode t)
 '(highlight-parentheses-attributes nil)
 '(highlight-parentheses-background-colors '("light gray" "cyan"))
 '(highlight-parentheses-colors '("honeydew4" "slate gray"))
 '(org-agenda-files
   '("c:/Users/dianyuluo/AppData/Roaming/.emacs.d/learning/emacs/dairy/dairy.org" "c:/Users/dianyuluo/AppData/Roaming/.emacs.d/learning/emacs/org_agenda/gtd.org" "c:/Users/dianyuluo/AppData/Roaming/.emacs.d/learning/emacs/org_agenda/eureka.org"))
 '(org-ellipsis "  ⇲")
 '(org-link-frame-setup
   '((vm . vm-visit-folder-other-frame)
     (vm-imap . vm-visit-imap-folder-other-frame)
     (gnus . org-gnus-no-new-news)
     (file . find-file)
     (wl . wl-other-frame)))
 '(package-selected-packages
   '(valign dap-mode pyim anki-editor math-preview org-sidebar laas org-transclusion org-elp xenops org-fragtog gcmh ace-window deft expand-region names org-latex-impatient avy all-the-icons-dired all-the-icons-ivy-rich all-the-icons python-mode lsp-mode org-remark ox-pandoc highlight-parentheses smartparens pdf-tools counsel key-chord helm-org-rifle ivy-prescient better-jumper markdown-mode sound-wav esup benchmark-init powerline spacemacs-theme org-pomodoro yasnippet cdlatex multiple-cursors sis company-statistics company-prescient auctex projectile-speedbar use-package latex-preview-pane projectile dictionary org-roam-ui org-roam undo-tree page-break-lines auto-highlight-symbol org-superstar amx ivy magit evil org-download dashboard dash org company))
 '(safe-local-variable-values
   '((eval evil-local-set-key 'normal
           (kbd "o")
           'delete-other-windows)
     (eval evil-local-set-key 'normal
           (kbd "q")
           'quit-window)))
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(warning-suppress-log-types '((use-package) (org-roam) (use-package) (comp)))
 '(warning-suppress-types '((amx) (auto-save) (org-roam) (use-package) (comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "楷体" :foundry "outline" :slant normal :weight normal :height 163 :width normal))))
 '(cursor ((t (:background "gray"))))
 '(highlight-parentheses-highlight ((t (:background "azure"))) t)
 '(org-checkbox ((t (:foreground "red" :background "white" :weight bold))))
 '(org-ellipsis ((t (:foreground "SlateBlue1"))))
 '(org-table ((t (:inherit fixed-pitch :foreground "LightSkyBlue" :family "楷体")))))
;;自动安装package，依赖于
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)
;;---------------------------------------------------------------------------------------------------------------------------------

;;---------------------------------------------------------------------------------------------------------------------------------

(defvar dianyuluo-org-roam-mode nil)

;;---------------------------------------------------------------------------------------------------------------------------------
;; 定义字符集
;;屏幕启动最大化
(global-hl-line-mode 1)
(global-display-line-numbers-mode 1) 
(global-auto-highlight-symbol-mode 1)
;;自动revert
(global-auto-revert-mode 1)
;;自动补全括号
(electric-pair-mode 1)
(show-paren-mode 1)
;;保存退出的时候的光标位置
(save-place-mode 1)
;;显示文本的字符数量
(size-indication-mode 1)
;;设置行号
;; (global-linum-mode 1)
;;关闭右边滚动轮
(scroll-bar-mode -1)
;;自动备份
;; window窗口不需要工具栏
(tool-bar-mode -1)
(gcmh-mode 1)
(toggle-frame-fullscreen)
(setq confirm-kill-processes nil)
(setq make-backup-files nil)
;; 时间设定
(set-locale-environment "en_US.UTF-8")
(setq system-time-locale "C") 
(setq help-window-select t)
;;停止自动保存
(setq create-lockfiles nil)
(setq use-short-answers t)
;;设置emacs表头
(setq frame-title-format (list "dianyuluo" "@" "1739556970@qq.com  " "%f"))
;;use-package 的静态分析
(setq use-package-compute-statistics t)
(setq browse-url-browser-function 'browse-url-firefox)
;;光标的模式
(setq-default cursor-type 'bar)

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

(when window-system
  (load-theme 'misterioso)
  (set-fontset-font t 'emoji "Segoe UI Emoji")
  (set-fontset-font t 'symbol "Segoe UI Symbol")
  (setq face-font-rescale-alist '(("楷体" . 1.0) ("Segoe UI Emoji" . 0.78) ("Segoe UI Symbol" . 0.78)))
  (setq temporary-file-directory (file-truename "~/.emacs.d/learning/emacs/Temp"))
  (setq browse-url-firefox-program "C:/Program Files/Mozilla Firefox/firefox.exe"))

(unless window-system
  (menu-bar-mode -1) 
  )

;;---------------------------------------------------------------------------------------------------------------------------------
;; 绑定一些特殊的快捷键
(dir-locals-set-class-variables 'keybind1
                                '((nil . (
                                          (eval . (evil-local-set-key 'normal (kbd "q") 'quit-window))
                                          (eval . (evil-local-set-key 'normal (kbd "o") 'delete-other-windows)))))) 


(setq system-lisp-directory ( concat (file-name-directory (directory-file-name data-directory)) "lisp/"))
(dir-locals-set-directory-class  system-lisp-directory 'keybind1)
(dir-locals-set-directory-class "~/.emacs.d/elpa/" 'keybind1)

;;---------------------------------------------------------------------------------------------------------------------------------
(defmacro measure-time (&rest body)
  `(let ((time (current-time)))
     ,@body
     (progn
       (message "%.06f" (float-time (time-since time)))
       (newline)
       (insert (format ";; → run time: %.06f seconds" (float-time (time-since time)))))))


;;---------------------------------------------------------------------------------------------------------------------------------
;; 自定义的函数和快捷键关联

(global-set-key (kbd "C-x k") 'kill-this-buffer)
                                        ; 删除当前位置到本行结尾的信息,并绑定到C-k上面
(defun delete-without-kill-ring()
  (interactive)
  (if  (eolp)
      (delete-char 1)  
    (delete-region (point) (line-end-position))))
(global-set-key (kbd "C-k") 'delete-without-kill-ring)

(defun doom--sudo-file-path (file)
  (let ((host (or (file-remote-p file 'host) "localhost")))
    (concat "/" (when (file-remote-p file)
                  (concat (file-remote-p file 'method) ":"
                          (if-let (user (file-remote-p file 'user))
                              (concat user "@" host)
                            host)
                          "|"))
            "sudo:root@" host
            ":" (or (file-remote-p file 'localname)
                    file))))

(defun doom/sudo-this-file ()
  "Open the current file as root."
  (interactive)
  (find-file
   (doom--sudo-file-path
    (or buffer-file-name
        (when (or (derived-mode-p 'dired-mode)
                  (derived-mode-p 'wdired-mode))
          default-directory)))))


(defun dianyuluo-org-roam-learning-english-mode ()
  (interactive)
  (setq org-roam-directory (file-truename "~/.emacs.d/learning/language/english/org-roam/"))
  (setq dianyuluo-org-roam-mode "english")
  (require 'org-agenda)
  (require 'org-capture)
  (setq org-roam-db-location  "~/.emacs.d/orgroamdb/english.db")
  (setq org-agenda-files '("~/.emacs.d/learning/language/english/org-agenda/gtd.org" 
                           "~/.emacs.d/learning/language/english/org-agenda/eureka.org"))
  (org-roam-db-autosync-mode))

(defun dianyuluo-org-roam-learning-math-mode()
  (interactive)
  (setq dianyuluo-org-roam-mode "math")
  (add-hook 'latex-mode-hook 'turn-on-cdlatex) 
  (add-hook 'org-mode-hook 'org-cdlatex-mode) 
  (add-hook 'org-mode-hook 'laas-mode) 
  (add-hook 'org-mode-hook 'org-fragtog-mode) 
  (setq org-roam-directory (file-truename "~/.emacs.d/learning/emacs/org_roam/math"))
  (setq org-roam-db-location  "~/.emacs.d/orgroamdb/math.db")
  (setq org-roam-capture-templates
        '(("d" "default" plain "%?"
           :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+STARTUP: latexpreview\n")
           :unnarrowed t
           :immediate-finish t)))
  
  (org-roam-db-autosync-mode))

(defun dianyuluo-org-roam-learning-408-mode ()
  (interactive)
  (setq dianyuluo-org-roam-mode "408")
  (setq org-roam-directory (file-truename "~/.emacs.d/learning/emacs/org_roam/408"))
  (setq org-roam-db-location  "~/.emacs.d/orgroamdb/408.db")
  (org-roam-db-autosync-mode))

(defun create-another-emacs-process-with-frame-on-windows()
  (interactive)
  (shell-command "explorer C:\\Program Files\\Emacs\\emacs-28.1\\bin\\runemacs.exe"))


(defun kill-all-buffers ()
  (interactive)
  (when (featurep 'org)
    (org-save-all-org-buffers)
    (mapc 'kill-buffer (delq (current-buffer) (buffer-list)))))




(defun delete-file-and-buffer ()
  (interactive)
  (let ((filename (buffer-file-name)))
    (if filename
        (if (y-or-n-p (concat "Do you really want to delete file " filename " ?"))
            (progn
              (delete-file filename)
              (message "Deleted file %s." filename)
              (kill-buffer)))
      (message "Not a file visiting buffer!"))))

(defun open-this-buffer-directory-on-windows()
  (interactive)
  (shell-command "explorer ."))

(defun open-this-buffer-on-vscode()
  (interactive)
  (shell-command "code ."))

(defun open-org-pomodoro-file ()
  (interactive)
  (find-file "~/.emacs.d/learning/emacs/dairy/pomodoro.org"))

(defun open-org-daily-file ()
  (interactive)
  (find-file "~/.emacs.d/learning/emacs/dairy/dairy.org"))
(global-set-key (kbd "C-c i")
                'open-org-daily-file)

(defun open-org-englis-file ()
  (interactive)
  (find-file "~/.emacs.d/learning/emacs/dairy/english.org"))
(global-set-key (kbd "C-c e")
                'open-org-englis-file)

(defun open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>")
                'open-init-file)

(defun org-screenshot-on-windows10 ()
  (interactive)
  (setq full-file-name (file-name-sans-extension (file-name-nondirectory buffer-file-name)))
  ;; 如果文件名的长度小于14,放到mainImage文件夹下面
  (if (< (length full-file-name) 14)
      (setq before-file-name-part "main")
    ;;否则,判断文件中是否含有中文(专门给org roam做的优化,不通用,但是也不想改了)
    (if (string-match "\\cc" full-file-name)
        (setq before-file-name-part  (substring (file-name-sans-extension (file-name-nondirectory buffer-file-name)) 0 14))
      (setq before-file-name-part (substring (file-name-sans-extension (file-name-nondirectory buffer-file-name)) 15))))
  
  (setq imagefile (concat "./" before-file-name-part "Image/"))
  (unless (file-exists-p imagefile)
    (make-directory imagefile))
  (setq filename (concat (make-temp-name (concat imagefile
                                                 "_"
                                                 (format-time-string "%Y%m%d_%H%M%S_")))
                         ".png"))
  (shell-command (concat "powershell -command \"Add-Type -AssemblyName System.Windows.Forms;if ($([System.Windows.Forms.Clipboard]::ContainsImage())) {$image = [System.Windows.Forms.Clipboard]::GetImage();[System.Drawing.Bitmap]$image.Save('"
                         filename "',[System.Drawing.Imaging.ImageFormat]::Png); Write-Output 'clipboard content saved as file'} else {Write-Output 'clipboard does not contain image data'}\""))
  (insert (concat "[[file:" filename "]]"))
  (org-display-inline-images))

;;快速的载入配置文件
(defun quick-load-init-file ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))
;;---------------------------------------------------------------------------------------------------------------------------------
(add-hook 'after-save-hook '(lambda ()
                              (when ( > (length (file-truename buffer-file-name) ) 30)
                                (message (file-name-nondirectory buffer-file-name)))
                              ))  
;;---------------------------------------------------------------------------------------------------------------------------------

(setq org-agenda-files
      '("~/.emacs.d/learning/emacs/org_agenda/gtd.org" 
        "~/.emacs.d/learning/emacs/org_agenda/eureka.org"))

;;---------------------------------------------------------------------------------------------------------------------------------

(define-key messages-buffer-mode-map (kbd "C-x C-s") #'ignore)


(use-package evil
  :demand t
  :bind
  (("M-n" . evil-scroll-line-down)
   ("<tab>" . org-cycle)
   ("M-p" . evil-scroll-line-up))
  :init
  (setq evil-disable-insert-state-bindings t)
  (evil-mode 1)
  (define-key evil-normal-state-map (kbd "TAB") 'org-cycle)      
  (define-key evil-normal-state-map (kbd "C-n") 'evil-next-line)
  (define-key evil-normal-state-map (kbd "C-p") 'evil-previous-line) 
  (define-key evil-motion-state-map (kbd "g o") 'evil-avy-goto-char-timer) 
  (define-key evil-motion-state-map (kbd "g l") 'evil-avy-goto-line) 
  (define-key evil-motion-state-map (kbd "f") 'evil-avy-goto-char-in-line) 
  (define-key evil-normal-state-map (kbd "[ b") 'previous-buffer)
  (define-key evil-normal-state-map (kbd "] b") 'next-buffer)
  (define-key evil-motion-state-map (kbd "[ b") 'previous-buffer)
  (define-key evil-motion-state-map (kbd "] b") 'next-buffer)
  (setq evil-want-fine-undo t) 
  (evil-set-initial-state 'messages-buffer-mode 'insert)
  (evil-set-initial-state 'dashboard-mode 'insert)
  (evil-set-initial-state 'special-mode 'insert)
  :config
  (evil-set-undo-system 'undo-tree)
  (evil-define-key 'normal messages-buffer-mode-map "q" 'quit-window)
  (define-key evil-insert-state-map (kbd "C-z") 'undo-tree-undo))


(use-package dashboard
  :ensure t
  :bind
  (("C-c d" . 'dashboard-refresh-buffer))
  :config
  (dashboard-setup-startup-hook)  
  (defun read-lines (filePath)
    (with-temp-buffer
      (insert-file-contents filePath)
      (split-string (buffer-string) "\n" t)))
  (setq dashboard-footer-messages (read-lines "~/.emacs.d/learning/emacs/dairy/tipoftheday.org"))
  (add-hook 'dashboard-mode-hook 'sis-set-english) 
  (setq dashboard-banner-logo-title "hello , dianyuluo")
  (define-key dashboard-mode-map (kbd "t") 'org-todo-list)
  (define-key dashboard-mode-map (kbd "q") 'delete-window)
  ;;  (define-key dashboard-mode-map (kbd "C-k C-k") 'kill-all-buffers)
  (define-key dashboard-mode-map (kbd "/") 'evil-search-forward)
  (define-key dashboard-mode-map (kbd "C-x C-s") #'ignore)
  (when window-system
    (setq dashboard-set-navigator t)
    ;;    没空改,有空了再说
    ;; (setq dashboard-navigator-buttons
    ;;       `(
    ;;         ((,(all-the-icons-octicon "mark-github" :height 0.8 :v-adjust 0.0) "Homepage" "welcome to my github"
    ;;           (lambda (&rest _) (browse-url "https://github.com/dian-yu-luo")))
    ;;          ("★" "Star" "Show stars" (lambda (&rest _) (show-stars)) warning)
    ;;          ("Ѫ" "" "?/h" #'show-help nil " <" ">"))
    ;;         ((,(all-the-icons-faicon "linkedin" :height 1.0 :v-adjust 0.0) "Linkedin" ""
    ;;           (lambda (&rest _) (browse-url "homepage")))
    ;;         ("⚑" nil "Show flags" (lambda (&rest _) (message "flag")) error))))
    (setq dashboard-set-heading-icons t)
    (setq dashboard-set-file-icons t)
    (setq dashboard-footer-icon (all-the-icons-octicon "dashboard"
                                                       :height 0.9
                                                       :v-adjust -0.05
                                                       :face 'font-lock-keyword-face))
    (setq dashboard-startup-banner "~/.emacs.d/learning/emacs/dianyuluo.png"))
  (setq dashboard-items '((recents . 7)
                          (projects . 5))))


(use-package powerline
  :config
  (defun powerline-dian-yu-luo-theme ()
    (interactive)
    (setq-default mode-line-format
                  '("%e"
                    (:eval
                     (let* ((active (powerline-selected-window-active))
                            (mode-line-buffer-id (if active 'mode-line-buffer-id 'mode-line-buffer-id-inactive))
                            (mode-line (if active 'mode-line 'mode-line-inactive))
                            (face0 (if active 'powerline-active0 'powerline-inactive0))
                            (face1 (if active 'powerline-active1 'powerline-inactive1))
                            (face2 (if active 'powerline-active2 'powerline-inactive2))
                            (separator-left (intern (format "powerline-%s-%s"
                                                            (powerline-current-separator)
                                                            (car powerline-default-separator-dir))))
                            (separator-right (intern (format "powerline-%s-%s"
                                                             (powerline-current-separator)
                                                             (cdr powerline-default-separator-dir))))
                            (lhs (list (powerline-raw "%*" face0 'l)
                                       (when powerline-display-buffer-size
                                         (powerline-buffer-size face0 'l))
                                       (when powerline-display-mule-info
                                         (powerline-raw mode-line-mule-info face0 'l))
                                       (powerline-buffer-id `(mode-line-buffer-id ,face0) 'l)
                                       (when (and (boundp 'which-func-mode) which-func-mode)
                                         (powerline-raw which-func-format face0 'l))
                                       (powerline-raw " " face0)
                                       (funcall separator-left face0 face1)
                                       (when (and (boundp 'erc-track-minor-mode) erc-track-minor-mode)
                                         (powerline-raw erc-modified-channels-object face1 'l))
                                       (powerline-major-mode face1 'l)
                                       (powerline-process face1)
                                       (powerline-narrow face1 'l)
                                       (powerline-raw " " face1)
                                       (funcall separator-left face1 face2)
                                       (powerline-vc face2 'r)
                                       (when (bound-and-true-p nyan-mode)
                                         (powerline-raw (list (nyan-create)) face2 'l))))
                            (rhs (list (powerline-raw global-mode-string face2 'r)
                                       (unless window-system                                                                 
                                         (when (eq evil-state 'normal)
                                           (powerline-raw "<N> " face2 'l)))
                                       (when dianyuluo-org-roam-mode
                                         (powerline-raw dianyuluo-org-roam-mode face2 'l) )
                                       (when window-system
                                         (if (w32-get-ime-open-status)
                                             (powerline-raw "中 " face2 'l)
                                           (powerline-raw "   " face2 'l)))
                                       (funcall separator-right face2 face1)
                                       (unless window-system
                                         (powerline-raw (char-to-string #xe0a1) face1 'l))
                                       (powerline-raw "%4l" face1 'l)
                                       (powerline-raw ":" face1 'l)
                                       (powerline-raw "%3c" face1 'r)
                                       (funcall separator-right face1 face0)
                                       (powerline-raw " " face0)
                                       (powerline-raw "%6p" face0 'r)
                                       (when powerline-display-hud
                                         (powerline-hud face0 face2))
                                       (powerline-fill face0 0))))
                       (concat (powerline-render lhs)
                               (powerline-fill face2 (powerline-width rhs))
                               (powerline-render rhs)))))))
  (powerline-dian-yu-luo-theme)
  )

(use-package ivy-prescient
  :ensure t
  :config
  (ivy-prescient-mode t)
  (prescient-persist-mode t))

(use-package pyim-cregexp-utils
  :config
  (setq ivy-re-builders-alist
        '((t . pyim-cregexp-ivy))))


(use-package all-the-icons
  ;; 老实说,完全不想知道什么意思,抄来的代码
  :config
  (setq all-the-icons-scale-factor            0.95
        all-the-icons-material-scale-factor   1.00
        all-the-icons-fileicon-scale-factor   0.80
        all-the-icons-wicon-scale-factor      0.65
        all-the-icons-octicon-scale-factor    0.95
        all-the-icons-faicon-scale-factor     0.95
        all-the-icons-alltheicon-scale-factor 1.00)
  (setq all-the-icons-color-icons             t))

(use-package yasnippet
  :init
  (setq yas-triggers-in-field t) 
  :config
  (add-to-list 'yas-snippet-dirs "~/.emacs.d/learning/emacs/snippets")
  (yas-global-mode 1))


(use-package better-jumper
  :if window-system
  :bind
  (("<mouse-4>" . better-jumper-jump-backward)
   ("<mouse-5>" . better-jumper-jump-forward)) 
  :init
  (better-jumper-mode +1)
  :config
  (add-hook 'mouse-leave-buffer-hook
            (defun set-jump-at-mouse-pos ()
              (better-jumper-set-jump)
              (when-let ((pos (posn-point (event-end last-input-event))))
                (better-jumper-set-jump pos)))))


(use-package undo-tree
  :config
  (global-undo-tree-mode)
  (setq undo-tree-auto-save-history nil))


(use-package sis
  :bind
  (("C-SPC . 'sis-set-other"))
  :config
  (add-to-list 'sis-context-detectors (lambda (&rest _)
                                        (when (and (eq major-mode 'org-mode) (org-at-heading-or-item-p)) 
                                          'other)))
  (sis-ism-lazyman-config nil t 'w32)
  (sis-global-respect-mode t)
  (sis-global-context-mode t)) 

(use-package avy
  :bind
  (("C-c j" . 'avy-goto-paren-in-line))
  :config
  (defun avy-goto-paren-in-line ()
    (interactive)
    (avy-with avy-goto-char
      (avy-jump
       (regexp-quote "[\[(\{]")
       :beg (line-beginning-position) 
       :end (line-end-position)))
    (right-char))
  (defun my-avy--regex-candidates (fun regex &optional beg end pred group)
    (let ((regex (pyim-cregexp-build regex)))
      (funcall fun regex beg end pred group)))
  (advice-add 'avy--regex-candidates :around #'my-avy--regex-candidates))



(use-package amx
  :ensure t
  :init 
  (amx-mode 1))


(use-package lsp
  :defer t
  :config)

(use-package laas
  :defer t
  :config
  (aas-set-snippets 'laas-mode
                    :cond #'texmathp
                    "supp" "\\supp"
                    "On" "O(n)"
                    "O1" "O(1)"
                    "Olog" "O(\\log n)"
                    "Olon" "O(n \\log n)"
                    "Sum" (lambda () (interactive) (yas-expand-snippet "\\sum_{$1}^{$2} $0"))
                    "sh" (lambda () (interactive) (yas-expand-snippet "^{$1} $0"))
                    "dd" (lambda () (interactive) (yas-expand-snippet "\mathrm{$1} $0"))
                    "Span" (lambda () (interactive) (yas-expand-snippet "\\Span($1)$0"))
                    :cond #'laas-object-on-left-condition
                    "qq" (lambda () (interactive) (laas-wrap-previous-object "sqrt"))
                    ))

(use-package python
  :defer t
  :config)


(use-package  org-remark
  :defer t
  :config
  (org-remark-create "red-block"
                     '(:background "orange red" :foreground "snow")
                     '(CATEGORY "word"))
  (evil-define-key 'normal org-remark-mode-map "o" 'org-remark-mark-red-block)
  (evil-define-key 'visual org-remark-mode-map "o" 'org-remark-mark-red-block)
  (evil-define-key 'normal org-remark-mode-map "d" 'org-remark-delete)
  (evil-define-key 'visual org-remark-mode-map "d" 'org-remark-delete)
  (evil-define-key 'normal org-remark-mode-map "r" 'org-remark-remove)
  (evil-define-key 'normal org-remark-mode-map "q" 'delete-other-windows)
  (evil-define-key 'normal org-remark-mode-map "eq" 'delete-window)
  (evil-define-key 'normal org-remark-mode-map "eo" 'org-remark-open)
  (evil-define-key 'normal org-remark-mode-map "ev" 'org-remark-view)
  (setq org-remark-notes-display-buffer-action '((display-buffer-in-side-window)
                                                 (side . right)
                                                 (slot . 1)))
  (add-hook 'org-remark-mode-hook 'evil-normalize-keymaps))

(use-package ox-pandoc
  :defer t
  :config
  (setq org-pandoc-options-for-latex-pdf '((pdf-engine . "pdflatex"))))


(use-package smartparens
  :defer t
  :config
  (show-smartparens-global-mode t))


(use-package dired
  :defer t
  :config
  (define-key dired-mode-map (kbd "C-x C-s") #'ignore)
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))


(use-package ace-window
  :defer t
  :bind
  (("M-o" . 'ace-window))
  
  :config
  (setq aw-keys '(?d ?j ?i ?w)))


(use-package expand-region
  :defer t
  :bind
  (("C-=" . 'er/expand-region))
  :config
  (defun my-swiper-hack (&optional arg)
    (ignore arg)
    (if (region-active-p) (deactivate-mark)))
  (advice-add 'swiper :before #'my-swiper-hack))


(use-package swiper
  :defer t
  :bind
  (("C-c n c" . 'swiper)))


(use-package eshell
  :after esh-mode
  :init 
  :config
  (setq eshell-scroll-show-maximum-output nil)
  :bind (:map 
         eshell-mode-map
         ("<tab>" . 'completion-at-point)
         ("C-x C-s" . 'ignore)))


(use-package org-pomodoro
  :defer t
  :config)



(use-package help
  :config
  (evil-define-key 'normal help-mode-map "q" 'quit-window)
  (define-key help-mode-map (kbd "o") 'delete-other-windows))

(use-package multiple-cursors
  :ensure t
  :init
  (setq mc/list-file "~/.emacs.d/learning/emacs/config/mc.el")
  :bind (("M-." . mc/mark-next-like-this)
         ("M-," . mc/unmark-next-like-this)
         ("C-S-<mouse-1>" . mc/add-cursor-on-click)))

(use-package org-elp
  :defer t
  :config
  (setq org-elp-idle-time 4.5
        org-elp-split-fraction 0.25))

(use-package vc
  :defer t
  :ensure t
  :init
  (setq ediff-split-window-function (quote split-window-horizontally))
  :config
  (defun disable-y-or-n-p (orig-fun &rest args)
    (cl-letf (((symbol-function 'y-or-n-p) (lambda (prompt) t)))
      (apply orig-fun args))
    (delete-other-windows))
  (advice-add 'ediff-quit :around #'disable-y-or-n-p)
  (setq ediff-diff-program "C:/Program Files/Git/usr/bin/diff.exe"))

(use-package all-the-icons-ivy-rich
  :defer 7
  :ensure t
  :config
  (all-the-icons-ivy-rich-mode 1))

(use-package ivy-rich
  :defer 8
  :ensure t
  :config
  (ivy-rich-mode 1))

(use-package projectile
  :defer 10
  :config
  (projectile-mode +1)
  (setq projectile-sort-order 'recentf))



(use-package company
  :defer t
  :bind (
         :map company-active-map
         ("C-p" . company-select-previous)
         ("C-n" . company-select-next)        
         ("<tab>" . company-complete-selection)
         :map company-search-map
         ("C-p" . company-select-previous)
         ("<tab>" . company-complete-selection)
         ("C-n" . company-select-next))
  :config
  (defvar company-mode/enable-yas t)
  (defun company-mode/backend-with-yas (backend)
    (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
        backend
      (append (if (consp backend) backend (list backend))
              '(:with company-yasnippet))))
  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))
  (company-statistics-mode)
  (company-prescient-mode)
  (setq company-dabbrev-char-regexp "[\\.0-9a-z-_'/]")
  (setq company-dabbrev-minimum-length 2)
  (setq company-idle-delay 0.3)
  (setq company-minimum-prefix-length 1))


;; (use-package org-latex-impatient
;;   :defer t
;;   :hook (org-mode . org-latex-impatient-mode)
;;   :init
;;   (setq org-latex-impatient-tex2svg-bin "C:/Program Files/nodejs/tex2svg"))

(use-package cc-mode
  :defer t
  :config
  (c-add-style "dianyuluo-style"
               '("stroustrup"
                 (indent-tabs-mode . nil)
                 (c-basic-offset . 4)
                 (c-offsets-alist (innamespace . -))))
  
  (add-to-list 'c-default-style '(c++-mode . "dianyuluo-style")))

(use-package highlight-parentheses
  :ensure t
  :config 
  (global-highlight-parentheses-mode))


(use-package counsel
  :defer t
  :config
  :bind
  (("C-c n g" . 'counsel-org-goto)))



(use-package pdf-tools
  :defer t
  :bind(:map
        pdf-view-mode-map
        ("j" . 'pdf-view-next-line-or-next-page)
        ("k" . 'pdf-view-previous-line-or-previous-page))
  
  :config)


(use-package ivy
  :ensure t
  :init 
  (ivy-mode 1)
  (setq ivy-wrap t)
  )

(use-package deft
  :defer t
  :bind
  ("C-c n d" . deft)
  :custom
  (deft-recursive t)
  (deft-default-extension "org")
  (deft-strip-summary-regexp ":PROPERTIES:\n\\(.+\n\\)+:END:\n")
  
  (deft-directory "~/.emacs.d/learning/emacs/org_roam/org-roam")
  :config
  (define-key deft-mode-map (kbd "C-x C-s") #'ignore)
  (defun cm/deft-parse-title (file contents)
    (let ((begin (string-match "^#\\+[tT][iI][tT][lL][eE]: .*$" contents)))
	  (if begin
	      (string-trim (substring contents begin (match-end 0)) "#\\+[tT][iI][tT][lL][eE]: *" "[\n\t ]+")
	    (deft-base-filename file))))
  
  (advice-add 'deft-parse-title :override #'cm/deft-parse-title)
  (setq deft-strip-summary-regexp
	    (concat "\\("
		        "[\n\t]" ;; blank
		        "\\|^#\\+[[:alpha:]_]+:.*$" ;; org-mode metadata
		        "\\|^:PROPERTIES:\n\\(.+\n\\)+:END:\n"
		        "\\)"))
  )

(use-package magit
  :defer t
  :config)


(use-package display-line-numbers
  :ensure nil
  :config
  (dolist (no-line-mode '( term-mode-hook
                           org-agenda-mode-hook
                           eshell-mode-hook
                           deft-mode-hook
                           pdf-view-mode-hook 
                           helpful-mode-hook
                           help-mode-hook))
    (add-hook no-line-mode (lambda () (display-line-numbers-mode 0)))))

(use-package org-roam
  :ensure t
  :defer t
  :init
  (defun dian-yu-luo-convert-org-roam-dir (filename)
    (let* ((a (concat "~/.emacs.d/learning/emacs/org_roam/" filename))
           (b (concat "~/.emacs.d/orgroamdb/" (concat filename ".db"))))
      (setq org-roam-directory a)
      (setq org-roam-db-location  b)
      (setq dianyuluo-org-roam-mode filename)
      (org-roam-db-autosync-mode)
      ))

  (defun dian-select-org-roam-directory ()
    (interactive)
    (let*
        ((cands   (directory-files "~/.emacs.d/learning/emacs/org_roam/")))
      (pop cands)
      (pop cands)
      (setq cands (delete ".gitignore" cands))
      (setq cands (delete "org-roam" cands))
      (ivy-read "org roam directory: " cands
                :action #'dian-yu-luo-convert-org-roam-dir
                :caller 'dian-select-org-roam-directory)))


  :config
  (org-roam-db-autosync-mode)
  (setq org-roam-dailies-directory "~/.emacs.d/learning/emacs/dairy/")
  :bind
  (("C-c n f" . org-roam-node-find)
   ("C-c n i" . org-roam-node-insert)
   ("C-c n r" . org-roam-node-random))
  :custom
  (org-roam-directory (file-truename "~/.emacs.d/learning/emacs/org_roam/org-roam"))
  (org-roam-capture-templates
   '(("d" "default" plain "%?"
      :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
      :unnarrowed t
      :immediate-finish t))))



(use-package org-capture
  :ensure nil
  :init
  (add-hook 'org-capture-mode-hook 'sis-set-other)
  (add-hook 'org-capture-mode-hook 'evil-insert-state)
  :bind
  ("C-c c" . org-capture)
  ("C-c t" . org-todo-list)
  :config
  (setq org-default-notes-file (concat org-directory "~/.emacs.d/notes.org"))
  (setq org-capture-templates '(("i" "Todo"
                                 entry
                                 (file+headline "~/.emacs.d/learning/emacs/org_agenda/gtd.org"
                                                "Tasks")
                                 "* TODO \t%?\n  %i\n")
                                ("e" "Eureka"
                                 entry
                                 (file+headline "~/.emacs.d/learning/emacs/org_agenda/eureka.org"
                                                "EUREKA")
                                 "* TODO \t%?\n %T\n %i\n  %a")
                                ("k" "tipoftheday"
                                 plain
                                 (file "~/.emacs.d/learning/emacs/dairy/tipoftheday.org" )
                                 " %?\n")
                                ("u" "question"
                                 entry
                                 (file+headline "~/.emacs.d/learning/emacs/org_agenda/eureka.org"
                                                "question")
                                 "* TODO %? \?\n%T")
                                ("j" "Journal"
                                 entry
                                 (file+datetree "~/.emacs.d/learning/emacs/org_agenda/journal.org")
                                 "* %?\n "))))


(use-package org-superstar 
  :after org 
  :hook (org-mode . org-superstar-mode)
  :config
  (setq org-superstar-headline-bullets-list '("➲" "➱" "➶" "➠" "➢")))


(use-package org-download
  :defer  t 
  :after org 
  :ensure t
  :config
  (setq-default org-download-image-dir "./images")
  (add-hook 'dired-mode-hook 'org-download-enable))

(use-package org-src
  :defer t
  :config
  (add-hook 'org-src-mode-hook 'evil-insert-state)
  (add-hook 'org-src-mode-hook 'company-mode)
  ;; (add-hook 'org-src-mode-hook '(lambda()
  ;;                                 (when TeX-mode-p (cdlatex-mode))))
  )


(use-package org
  :ensure t
  :pin gnu
  :defer t
  :config
  (custom-set-faces '(org-checkbox ((t (:foreground "red"  :weight bold)))))
  (defun dianyuluo-org-prettify-symbols ()
    (setq-local prettify-symbols-alist
                '(("[fn:0]" . "⁰")
                  ("[fn:1]" . "¹")
                  ("[fn:2]" . "²")
                  ("[fn:3]" . "³")
                  ("[fn:4]" . "⁴")
                  ("[fn:5]" . "⁵")
                  ("[fn:6]" . "⁶")
                  ("[fn:7]" . "⁷")
                  ("[fn:8]" . "⁸")
                  ("[fn:9]" . "⁹")))
    (prettify-symbols-mode 1))
  (add-hook 'org-mode-hook 'dianyuluo-org-prettify-symbols)
  ;;80个字符自动换行
  (add-hook 'org-mode-hook 'turn-on-auto-fill)
  (add-hook 'org-mode-hook #'valign-mode)
  (setq-default fill-column 80)
  (setq org-ellipsis "  ⇲")
  (setq org-modules nil)
  (setq org-startup-folded "showall")
  (setq org-hide-block-startup t)
  (setq org-startup-truncated nil)
  ;;  (setq org-todo-keywords '((sequence "TODO(t)" "DONE(d!)" "|" "WAIT(w!)" "CANCELED(c!)")))
  (setq org-tag-alist '(("wait" . ?w) ("question" . ?i) ("@home" . ?h) ("laptop" . ?l)))
  (setq org-todo-keyword-faces '(("TODO" . "red")
                                 ("DONE" . "green")
                                 ("STARTED" . "yellow")
                                 ("CANCELED" . (:foreground "blue" :weight bold))))
  ;;默认执行org行内代码块不需要确认
  (setq org-confirm-babel-evaluate nil)
  (setq org-startup-indented t)
  ;;隐藏斜体,粗体,下划线等的左右符号    
  (setq org-hide-emphasis-markers t)
  ;; 保证了每次挑选tag默认只选择一个
  (setq org-fast-tag-selection-single-key t)
  ;;图片显示问题,永远占用图片的1/3
  ;;  (setq org-image-actual-width (/ (display-pixel-width) 3))
  (setq org-log-refile 'time)
  (setq org-refile-targets '(("~/.emacs.d/learning/emacs/org_refile/done.org" :maxlevel . 1)
                             ("~/.emacs.d/learning/emacs/org_refile/canceled.org" :maxlevel . 1)))
  (setq org-outline-path-complete-in-steps nil)  
  (setq org-preview-latex-process-alist '((dvipng :programs ("latex" "dvipng"):description
                                                  "dvi > png"
                                                  :message "you need to install the programs: latex and dvipng."
                                                  :image-input-type "dvi"
                                                  :image-output-type "png"
                                                  :image-size-adjust (2.0 . 2.0)
                                                  :latex-compiler ("latex -interaction nonstopmode -output-directory %o %f")
                                                  :image-converter ("dvipng -D %D -T tight -o %O %f")
                                                  :transparent-image-converter ("dvipng -D %D -T tight -bg Transparent -o %O %f"))))
  (with-eval-after-load 'ox-latex
    (add-to-list 'org-latex-classes
                 '("ctexart"
                   "\\documentclass[11pt]{ctexart}"
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
    (setq org-latex-default-class "ctexart")
    (setq org-latex-compiler "xelatex"))
  
  ;; 表格的形式,表格名在表格的下面
  (setq org-latex-caption-above nil)  )

