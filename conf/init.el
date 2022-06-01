(setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize) 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default))
 '(highlight-parentheses-background-colors '("deep sky blue"))
 '(org-ellipsis "  ⇲")
 '(package-selected-packages
   '(ivy-prescient insert-char-preview better-jumper pyim pinyin markdown-mode sound-wav esup benchmark-init powerline spacemacs-theme org-pomodoro yasnippet cdlatex multiple-cursors sis company-statistics company-prescient auctex projectile-speedbar use-package latex-preview-pane projectile dictionary org-roam-ui org-roam undo-tree page-break-lines auto-highlight-symbol org-superstar highlight-parentheses amx ivy magit evil org-download dashboard dash org company))
 '(safe-local-variable-values '((org-fast-tag-selection-single-key . t)))
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(warning-suppress-log-types '((use-package) (org-roam) (use-package) (comp)))
 '(warning-suppress-types '((org-roam) (use-package) (comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "楷体" :foundry "outline" :slant normal :weight normal :height 163 :width normal))))
 '(org-checkbox ((t (:foreground "red" :background "white" :weight bold))))
 '(org-ellipsis ((t (:foreground "SlateBlue1"))))
 '(powerline-active1 ((t (:background "#e5ccff" :weight bold))))
 '(powerline-active2 ((t (:background "#99bbff" :weight bold)))))
;;自动安装package，依赖于
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)
;;---------------------------------------------------------------------------------------------------------------------------------

;;---------------------------------------------------------------------------------------------------------------------------------
;; 定义字符集
;;屏幕启动最大化
(add-to-list 'default-frame-alist '(fullscreen . maximized))
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
(setq confirm-kill-processes nil)
(setq make-backup-files nil)
;; 时间设定
(setq system-time-locale "C") 
(setq help-window-select t)
;;停止自动保存
(setq create-lockfiles nil)
(setq use-short-answers t)
;;设置emacs表头
(setq frame-title-format (list "dianyuluo" "@" "1739556970@qq.com  " "%f"))
;;use-package 的静态分析
(setq use-package-compute-statistics t)
;;光标的模式
(setq-default cursor-type 'bar)
(set-locale-environment "en_US.UTF-8")

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

(when window-system
  (load-theme 'spacemacs-light)
  (set-fontset-font t 'emoji "Segoe UI Emoji")
  (set-fontset-font t 'symbol "Segoe UI Symbol")
  (setq face-font-rescale-alist '(("楷体" . 1.0) ("Segoe UI Emoji" . 0.78) ("Segoe UI Symbol" . 0.78)))
  )

;;---------------------------------------------------------------------------------------------------------------------------------
;; 自定义的函数和快捷键关联

(global-set-key (kbd "<C-tab>") 'next-buffer)
(global-set-key (kbd "<C-tab>") 'next-buffer)
(global-set-key (kbd "C-`") 'previous-buffer)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
;; 删除当前位置到本行结尾的信息,并绑定到C-k上面
(defun delete-without-kill-ring()
  (interactive)
  (if  (eolp)
      (delete-char 1)  
    (delete-region (point) (line-end-position))))
(global-set-key (kbd "C-k") 'delete-without-kill-ring)

(defun dianyuluo-org-roam-learning-english-mode()
  (interactive)
  (when window-system
    (load-theme 'tsdh-light)
    )
  (set-background-color "gray80")
  (setq org-roam-directory (file-truename "~/.emacs.d/learning/language/english/"))
  (setq org-roam-db-location  "~/.emacs.d/orgroamdb/org-roam-english.db")
  (org-roam-db-autosync-mode)
  )

(defun dianyuluo-org-roam-learning-math-mode()
  (interactive)
  (when window-system
    (load-theme 'tsdh-light)
    )
  (add-hook 'latex-mode-hook 'turn-on-cdlatex) 
  (set-background-color "gray80")
  (setq org-roam-directory (file-truename "~/.emacs.d/learning/emacs/org_roam/math"))
  (setq org-roam-db-location  "~/.emacs.d/orgroamdb/org-roam-math.db")
  (setq org-roam-capture-templates
   '(("d" "default" plain "%?"
      :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+STARTUP: latexpreview\n")
      :unnarrowed t
      :immediate-finish t
      )))
  (org-roam-db-autosync-mode)
  )



(defun create-another-emacs-process-with-frame-on-windows()
  (interactive)
  (shell-command "explorer C:\\Program Files\\Emacs\\emacs-28.1\\bin\\runemacs.exe")
  )

(defun kill-all-buffers ()
  (interactive)
  (org-save-all-org-buffers)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

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
  (setq full-file-name (file-name-sans-extension (file-name-nondirectory buffer-file-name))  )
  ;; 如果文件名的长度小于14,放到mainImage文件夹下面
  (if (< (length full-file-name) 14)
      (setq before-file-name-part "main")
    ;;否则,判断文件中是否含有中文(专门给org roam做的优化,不通用,但是也不想改了)
    (if (string-match "\\cc" full-file-name)
        (setq before-file-name-part  (substring (file-name-sans-extension (file-name-nondirectory buffer-file-name)) 0 14 ))
      (setq before-file-name-part (substring (file-name-sans-extension (file-name-nondirectory buffer-file-name)) 15))
      ))
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

;;---------------------------------------------------------------------------------------------------------------------------------

(setq temporary-file-directory (file-truename "~/.emacs.d/learning/emacs/Temp"))
(setq org-agenda-files
      '("~/.emacs.d/learning/emacs/org_agenda/gtd.org" 
        "~/.emacs.d/learning/emacs/org_agenda/eureka.org"))

;;---------------------------------------------------------------------------------------------------------------------------------

(define-key messages-buffer-mode-map (kbd "C-x C-s") #'ignore)

(use-package sis
  :bind
  (("C-SPC . 'sis-set-other")
   )
  :config
  (setq sis-english-source nil)
  (setq sis-other-source t)
  (setq sis-do-get #'w32-get-ime-open-status)
  (setq sis-do-set #'w32-set-ime-open-status)
  (sis-global-respect-mode t)
  (sis-global-context-mode t) 
  )

(use-package eshell
  :after esh-mode
  :init 
  :config
  (setq eshell-scroll-show-maximum-output nil)
  :bind (:map 
         eshell-mode-map
         ("<tab>" . 'completion-at-point)
         ("C-x C-s" . 'ignore)
         ))

(use-package org-pomodoro
  :defer t
  :config
  )

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
                (better-jumper-set-jump pos))))
  )

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
                                       (powerline-fill face0 0)
                                       )))
                       (concat (powerline-render lhs)
                               (powerline-fill face2 (powerline-width rhs))
                               (powerline-render rhs)))))))
  (powerline-dian-yu-luo-theme)
  (custom-set-faces '(powerline-active1  ((t (:background "#e5ccff" :weight bold)))))
  (custom-set-faces '(powerline-active2 ((t (:background "#99bbff" :weight bold)))))
  )


(use-package yasnippet
  :config
  (define-key yas-minor-mode-map (kbd "C-c y") #'yas-expand)
  (add-to-list 'yas-snippet-dirs "~/.emacs.d/learning/emacs/snippets")
  (yas-global-mode 1))

(use-package help
  :config
  (define-key help-mode-map (kbd "o") 'delete-other-windows))

(use-package multiple-cursors
  :ensure t
  :init
  (setq mc/list-file "~/.emacs.d/learning/emacs/config/mc.el")
  :bind (("M-." . mc/mark-next-like-this)
         ("M-," . mc/unmark-next-like-this)
         ("C-S-<mouse-1>" . mc/add-cursor-on-click)))

(use-package vc
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

(use-package dashboard
  :ensure t
  :bind
  (("C-c d" . 'dashboard-refresh-buffer)
   )
  :config
  (dashboard-setup-startup-hook)
  (define-key dashboard-mode-map (kbd "t") 'org-todo-list)
  (define-key dashboard-mode-map (kbd "C-k C-k") 'kill-all-buffers)
  (define-key dashboard-mode-map (kbd "/") 'evil-search-forward)
  (define-key dashboard-mode-map (kbd "C-x C-s") #'ignore)
  (setq dashboard-banner-logo-title "hello , dianyuluo")
  (setq dashboard-startup-banner "~/.emacs.d/learning/emacs/dianyuluo.png")
  (setq dashboard-items '((recents . 10)
                          (projects . 10)
                          )))


(use-package projectile
  :init
  (projectile-mode +1)
  :config
  (setq projectile-sort-order 'recentf)
  )



(use-package evil
  :demand t
  :bind
  (("M-n" . evil-scroll-line-down)
   ("<tab>" . org-cycle)
   ("M-p" . evil-scroll-line-up))
  :init
  (setq evil-disable-insert-state-bindings t)
  (evil-mode 1)
  (define-key evil-normal-state-map (kbd "C-n") 'evil-next-line )
  (define-key evil-normal-state-map (kbd "C-p") 'evil-previous-line) 
  (setq evil-want-fine-undo t) 
  (evil-set-initial-state 'messages-buffer-mode 'insert)
  (evil-set-initial-state 'dashboard-mode 'insert)
  (evil-set-initial-state 'special-mode 'insert)
  (evil-set-initial-state 'latex-mode 'insert)
  :config
  (evil-set-undo-system 'undo-tree)
  (define-key evil-insert-state-map (kbd "C-z") 'undo-tree-undo)
  )

(use-package undo-tree
  :config
  (global-undo-tree-mode)
  (setq undo-tree-auto-save-history nil)

  )

(use-package company
  :ensure t
  :disabled
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
  :init
  (company-statistics-mode)
  (company-prescient-mode)
  :config
  (setq company-dabbrev-char-regexp "[\\.0-9a-z-_'/]")
  (setq company-dabbrev-minimum-length 2)
  (setq company-idle-delay 0.3)
  (setq company-minimum-prefix-length 1)
  (global-company-mode 0)
  )

(use-package ivy-prescient
  :ensure t
  :config
  (ivy-prescient-mode t)
  (prescient-persist-mode t))

(use-package highlight-parentheses
  :ensure t
  :config 
  (global-highlight-parentheses-mode)
  (setq hl-paren-colors '("white")))

(use-package pyim-cregexp-utils
  :config
  (setq ivy-re-builders-alist
         '((t . pyim-cregexp-ivy)))
    )

(use-package ivy
  :ensure t
  :init 
  (ivy-mode 1)
  )

(use-package amx
  :ensure t
  :init 
  (amx-mode 1)
  )

(use-package org-roam
  :ensure t
  :defer t
  :config
  (org-roam-db-autosync-mode)
  (setq org-roam-dailies-directory "~/.emacs.d/learning/emacs/dairy/")
  :bind
  (("C-c n f" . org-roam-node-find)
   ("C-c n i" . org-roam-node-insert)
   ("C-c n d" . org-roam-dailies-goto-today)
   ("C-c n r" . org-roam-node-random))
  :custom
  (org-roam-db-gc-threshold most-positive-fixnum)
  (org-roam-directory (file-truename "~/.emacs.d/learning/emacs/org_roam/org-roam"))
  (org-roam-capture-templates
   '(("d" "default" plain "%?"
      :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
      :unnarrowed t
      :immediate-finish t
      )))
  )

(use-package org-capture
  :ensure nil
  :init
  (add-hook 'org-capture-mode-hook 'sis-set-other)
  (add-hook 'org-capture-mode-hook 'evil-insert-state)
  :bind
  ("C-c c" . org-capture)
  ("C-c r" . org-todo-list)
  :config
  (setq org-default-notes-file (concat org-directory "~/.emacs.d/notes.org"))
  (setq org-capture-templates '(("r" "Todo"
                                 entry
                                 (file+headline "~/.emacs.d/learning/emacs/org_agenda/gtd.org"
                                                "Tasks")
                                 "* TODO \t%?\n  %i\n")
                                ("e" "Eureka"
                                 entry
                                 (file+headline "~/.emacs.d/learning/emacs/org_agenda/eureka.org"
                                                "EUREKA")
                                 "* TODO \t%?\n %T\n %i\n  %a")
                                ("p" "question"
                                 entry
                                 (file+headline "~/.emacs.d/learning/emacs/org_agenda/eureka.org"
                                                "question")
                                 "* TODO %? \?\n%T")
                                ("j" "Journal"
                                 entry
                                 (file+datetree "~/.emacs.d/learning/emacs/org_agenda/journal.org")
                                 "* %?\n ")))
  )

(use-package org-superstar 
  :after org 
  :hook (org-mode . org-superstar-mode)
  :config
  (setq org-superstar-headline-bullets-list '("➲" "➱" "➶" "➠" "➢"))
  )

(use-package org-download
  :defer  t 
  :after org 
  :ensure t
  :config
  (setq-default org-download-image-dir "./images")
  (add-hook 'dired-mode-hook 'org-download-enable))

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
                  ("[fn:9]" . "⁹")
                  ("[X]" . "☑")
                  ("[ ]" . "☐")))
    (prettify-symbols-mode 1))
  (add-hook 'org-mode-hook 'dianyuluo-org-prettify-symbols)
  (setq org-ellipsis "  ⇲")
  (setq org-modules nil)
  (setq org-startup-truncated nil)
  (setq org-todo-keywords '((sequence "TODO(t)" "DONE(d!)" "|" "WAIT(w!)" "CANCELED(c!)")))
  (setq org-tag-alist '(("@question" . ?q) ("@home" . ?h) ("laptop" . ?l)))
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
  ;;在TODO项目解决之后需要写入logbook日志
  (setq org-log-into-drawer t)
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
  (setq org-latex-caption-above nil)
  )
