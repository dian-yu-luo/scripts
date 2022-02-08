(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
            ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize) ;; You might already have this line

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(amx ivy magit evil phi-autopair org-download dashboard dash org company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "楷体" :foundry "outline" :slant normal :weight normal :height 163 :width normal)))))
 
;; 设置行号
(global-linum-mode 1)

;; 关闭右边滚动轮
(scroll-bar-mode -1)

;; 自动补全模式
(global-company-mode 1)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

;; 因为有了git 不需要备份文件
(setq make-backup-files nil)

;; 停止自动保存
(setq create-lockfiles nil)

;; 屏幕启动最大化
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; 配置函数 M-x open-init-file之后打开本文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;; 启动面板插件，提供常用的文件
(require 'dashboard)
(dashboard-setup-startup-hook)
;; 自动补全括号
(require 'phi-autopair)
  (phi-autopair-global-mode)


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
(global-set-key (kbd "<f2>") 'open-init-file)


(setq evil-disable-insert-state-bindings t)
     (require 'evil)
     (evil-mode 1)
;; tab 使用4 space 替换
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
