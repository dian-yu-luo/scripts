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
'
  (package-selected-packages
'
    (undo-tree page-break-lines auto-highlight-symbol org-superstar highlight-parentheses amx ivy magit evil org-download dashboard dash org company)))
(custom-set-faces
;; custom-set-faces was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
'
  (default 
    (
      (t 
        (:family "楷体" :foundry "outline" :slant normal :weight normal :height 163 :width normal)))))

;; 自动安装package，依赖于
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)
;; 设置行号
(global-linum-mode 1)

;; 关闭右边滚动轮
(scroll-bar-mode -1)

;; 自动补全模式
(global-company-mode 1)
(define-key company-active-map 
  (kbd "C-n") 'company-select-next)
(define-key company-active-map 
  (kbd "C-p") 'company-select-previous)

;; 自动备份
(setq make-backup-files nil)

;; 停止自动保存
(setq create-lockfiles nil)

;; 屏幕启动最大化
(add-to-list 'default-frame-alist '
  (fullscreen . maximized))

;; 配置函数 M-x open-init-file之后打开本文件
(defun open-init-file
  ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(unless 
  (file-exists-p "~/.emacs.d/org_agenda")
  (make-directory "~/.emacs.d/org_agenda"))
;; 启动面板插件，提供常用的文件
(require 'dashboard)
(dashboard-setup-startup-hook)

;; 配置agenda文件的扫描位置，默认在这里
(setq org-agenda-files 
  (list 
    (expand-file-name "~/.emacs.d/org_agenda")))
(setq dashboard-items '
  (
    (recents  . 8)
    (registers . 5)))

;; 自动补全括号
(electric-pair-mode 1)
(require 'highlight-parentheses)
(global-highlight-parentheses-mode)
(show-paren-mode 1)

;; 光标的模式
(setq-default cursor-type 'bar)

;; 高亮当前行
(global-hl-line-mode 1)
;; 保存退出的时候的光标位置
(save-place-mode 1)
;; 显示文本的字符数量
(size-indication-mode 1)
;; 主要配置 M-x 的命令配置，提高自动补全的智能效果
(ivy-mode 1)
(amx-mode 1)
;; 
(global-set-key 
  (kbd "<f2>") 'open-init-file)

;; 配置vim的配置，同时在插入模式中取消vim快捷键的冲突
(setq evil-disable-insert-state-bindings t)
(require 'evil)
(evil-mode 1)
(setq evil-want-fine-undo t) 
(global-undo-tree-mode)
(evil-set-undo-system 'undo-tree)
;; tab 使用4 space 替换
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; org-superstar解决heading的符号问题
(require 'org-superstar)
(add-hook 'org-mode-hook 
  (lambda 
    () 
    (org-superstar-mode 1)))
(setq org-superstar-headline-bullets-list '
  ("➲" "➱" "➶" "✈" "➢"))

;; 设置TODO项目的关键字补全
(setq org-todo-keywords
'
  (
    (sequence "TODO(t)" "WAIT(w!)" "|" "DONE(d!)" "CANCELED(c!)")))

;; 在TODO项目解决之后需要写入logbook日志
(setq org-log-into-drawer t)

;; 修改列表符号的使用
(defun dianyuluo-org-prettify-symbols
  ()
  (setq-local prettify-symbols-alist
'
    (
      ("[X]" . "☑")
      ("[ ]" . "☐")))
  (prettify-symbols-mode 1))
(add-hook 'org-mode-hook 'dianyuluo-org-prettify-symbols)

(setq-default buffer-file-coding-system 'utf-8-unix)
(setq-default coding-system-for-read 'utf-8)
(setq-default coding-system-for-write 'utf-8)
