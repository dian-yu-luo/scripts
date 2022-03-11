
(setq package-archives '
    (
        ("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize) 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(org-roam-ui org-roam undo-tree page-break-lines auto-highlight-symbol org-superstar highlight-parentheses amx ivy magit evil org-download dashboard dash org company))
 '(show-paren-mode t)
 '(size-indication-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "楷体" :foundry "outline" :slant normal :weight normal :height 163 :width normal)))))

;;自动安装package，依赖于
(unless package-archive-contents
    (package-refresh-contents))
(package-install-selected-packages)
;;设置行号
(global-linum-mode 1)

;;关闭右边滚动轮
(scroll-bar-mode -1)

;;自动补全模式
(global-company-mode 1)
(define-key company-active-map 
    (kbd "C-n") 'company-select-next)
(define-key company-active-map 
    (kbd "C-p") 'company-select-previous)

;;自动备份
(setq make-backup-files nil)

;;停止自动保存
(setq create-lockfiles nil)
(setq auto-save-default nil)

;;屏幕启动最大化
(add-to-list 'default-frame-alist '
    (fullscreen . maximized))

;;配置函数M-xopen-init-file之后打开本文件
(defun open-init-file
    ()
    (interactive)
    (find-file "~/.emacs.d/init.el"))
(unless 
    (file-exists-p "~/.emacs.d/org_agenda")
    (make-directory "~/.emacs.d/org_agenda"))
(unless 
    (file-exists-p "~/.emacs.d/org_refile")
    (make-directory "~/.emacs.d/org_refile"))
;启动面板插件，提供常用的文件
(require 'dashboard)
(dashboard-setup-startup-hook)

;;配置agenda文件的扫描位置，默认在这里
(setq org-agenda-files 
    (list 
        (expand-file-name "~/.emacs.d/org_agenda")))
(setq dashboard-items '
    (
        (recents  . 8)
        (registers . 5)))

;;自动补全括号
(electric-pair-mode 1)
(require 'highlight-parentheses)
(global-highlight-parentheses-mode)
(show-paren-mode 1)

;;光标的模式
(setq-default cursor-type 'bar)

;;高亮当前行
(global-hl-line-mode 1)
;;保存退出的时候的光标位置
(save-place-mode 1)
;;显示文本的字符数量
(size-indication-mode 1)
;;主要配置M-x的命令配置，提高自动补全的智能效果
(ivy-mode 1)
(amx-mode 1)
;;
(global-set-key 
    (kbd "<f2>") 'open-init-file)
(global-set-key (kbd "C-c c") 'org-capture)

;;配置vim的配置，同时在插入模式中取消vim快捷键的冲突
(setq evil-disable-insert-state-bindings t)
(require 'evil)
(evil-mode 1)
(setq evil-want-fine-undo t) 
(global-undo-tree-mode)
(evil-set-undo-system 'undo-tree)

;;tab使用4space替换
(setq org-startup-indented t)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;;org-superstar解决heading的符号问题
(require 'org-superstar)
(add-hook 'org-mode-hook 
    (lambda 
        () 
        (org-superstar-mode 1)))
(setq org-superstar-headline-bullets-list '
    ("➲" "➱" "➶" "✈" "➢"))
;;隐藏斜体,粗体,下划线等的左右符号    
(setq org-hide-emphasis-markers t)

;;设置TODO项目的关键字补全
(setq org-todo-keywords
'
  (
    (sequence "TODO(t)" "DONE(d!)" "|"  "WAIT(w!)" "CANCELED(c!)")))
(setq org-todo-keyword-faces
'
  (
    ("TODO" . org-warning) 
    ("DONE" . "green")
    ("STARTED" . "yellow")
    ("CANCELED" . 
      (:foreground "blue" :weight bold))))

;;在TODO项目解决之后需要写入logbook日志
(setq org-log-into-drawer t)

;;修改列表符号的使用
(defun dianyuluo-org-prettify-symbols
    ()
    (setq-local prettify-symbols-alist
'
        (
            ("[X]" . "☑")
            ("[ ]" . "☐")))
    (prettify-symbols-mode 1))
(add-hook 'org-mode-hook 'dianyuluo-org-prettify-symbols)

;;capturerelated

(setq org-capture-templates
'
    (
        ("t" "Todo" entry 
            (file+headline "~/.emacs.d/org_agenda/gtd.org" "Tasks")
"* TODO \t%?\n  %i\n")
        ("e" "Eureka" entry 
            (file+headline "~/.emacs.d/org_agenda/eureka.org" "EUREKA")
"* TODO \t%?\n %T\n %i\n")
        ("r" "ReadyTodo" entry 
            (file+headline "~/.emacs.d/org_agenda/eureka.org" "ReadyTodo")
"* TODO \t%?\n %^T\n %i\n")
        ("j" "Journal" entry 
            (file+datetree "~/.emacs.d/org_agenda/journal.org")
"* \t%?\nEntered on %U\n  %i\n  %a")))

;;orgrefilerelated
(unless 
    (file-exists-p "~/.emacs.d/org_refile/done.org")
    (write-region "* done" nil 
        (expand-file-name "~/.emacs.d/org_refile/done.org")))
(unless 
    (file-exists-p "~/.emacs.d/org_refile/canceled.org")
    (write-region "* cancel" nil 
        (expand-file-name "~/.emacs.d/org_refile/canceled.org")))
(setq org-log-refile 'time)
(setq org-refile-targets  '
    (
        ("~/.emacs.d/org_refile/done.org" :maxlevel . 1)
        ("~/.emacs.d/org_refile/canceled.org" :maxlevel . 1)
))

(setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
;;(setq org-refile-use-outline-path t)                  ; Show full paths for refiling

(setq-default buffer-file-coding-system 'utf-8-unix)
(setq-default coding-system-for-read 'utf-8)
(setq-default coding-system-for-write 'utf-8)
;; 在标头删除额外的控制信息,同时自定义信息
(tool-bar-mode -1)
;; (menu-bar-mode -1)
(setq frame-title-format (list "dianyuluo" "@" "1739556970@qq.com  "  "%f" ))

(unless 
    (file-exists-p "~/.emacs.d/org-roam")
    (make-directory "~/.emacs.d/org-roam"))

(setq org-roam-directory (file-truename "~/.emacs.d/org-roam"))
(org-roam-db-autosync-mode)

;;截图安放
(require 'org-download)
(setq-default org-download-image-dir "./images")
;; Drag-and-drop to `dired`
(add-hook 'dired-mode-hook 'org-download-enable)

;;截图放置的自定义函数
(defun org-screenshot-on-windows10 ()
  (interactive)
  (unless 
    (file-exists-p "./images/")
    (make-directory "./images/"))
  (setq filename
        (concat
         (make-temp-name
          (concat "./images/"
                  "_"
                  (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))
  (shell-command (concat "powershell -command \"Add-Type -AssemblyName System.Windows.Forms;if ($([System.Windows.Forms.Clipboard]::ContainsImage())) {$image = [System.Windows.Forms.Clipboard]::GetImage();[System.Drawing.Bitmap]$image.Save('" filename "',[System.Drawing.Imaging.ImageFormat]::Png); Write-Output 'clipboard content saved as file'} else {Write-Output 'clipboard does not contain image data'}\""))
  (insert (concat "[[file:" filename "]]"))
  (org-display-inline-images))
;;图片显示问题,永远占用图片的1/3
(setq org-image-actual-width (/ (display-pixel-width) 3))



































































































;;快速的载入配置文件
(defun quick-load-init-file
    ()
    (interactive)
    (load-file "~/.emacs.d/init.el"))

