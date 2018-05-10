;;author: tminei
;;site: tmi.zzz.com.ua
(setq user-full-name   "%user-name%")
(setq user-mail-adress "%user-mail%")

(defun system-is-linux()
    (string-equal system-type "gnu/linux"))
(defun system-is-windows()
	(string-equal system-type "windows-nt"))

;; MS Windows path-variable
(when (system-is-windows)
    (setq win-sbcl-exe          "C:/sbcl/sbcl.exe")
    (setq win-init-path         "C:/.emacs.d")
    (setq win-init-ct-path      "C:/.emacs.d/plugins/color-theme")
    (setq win-init-ac-path      "C:/.emacs.d/plugins/auto-complete")
    (setq win-init-slime-path   "C:/slime")
    (setq win-init-ac-dict-path "C:/.emacs.d/plugins/auto-complete/dict"))

;; Unix path-variable
(when (system-is-linux)
    (setq unix-sbcl-bin          "/usr/bin/sbcl")
    (setq unix-init-path         "~/.emacs.d")
    (setq unix-init-ct-path      "~/.emacs.d/plugins/color-theme")
    (setq unix-init-ac-path      "~/.emacs.d/plugins/auto-complete")
    (setq unix-init-slime-path   "/usr/share/common-lisp/source/slime/")
    (setq unix-init-ac-dict-path "~/.emacs.d/plugins/auto-complete/dict"))


;; Org-mode settings
(require 'org) ;; Вызвать org-mode
(global-set-key "\C-ca" 'org-agenda) ;; поределение клавиатурных комбинаций для внутренних
(global-set-key "\C-cb" 'org-iswitchb) ;; подрежимов org-mode
(global-set-key "\C-cl" 'org-store-link)
(add-to-list 'auto-mode-alist '("\\.org$" . Org-mode)) ;; ассоциируем *.org файлы с org-mode

;; Fringe settings
(fringe-mode '(8 . 0)) ;; органичиталь текста только слева
(setq-default indicate-empty-lines t) ;; отсутствие строки выделить глифами рядом с полосой с номером строки
(setq-default indicate-buffer-boundaries 'left) ;; индикация только слева

;; Display file size/time in mode-line
(setq display-time-24hr-format t) ;; 24-часовой временной формат в mode-line
(display-time-mode             t) ;; показывать часы в mode-line
(size-indication-mode          t) ;; размер файла в %-ах

;; Dired
(require 'dired)
(setq dired-recursive-deletes 'top) ;; чтобы можно было непустые директории удалять...

;; Imenu
(require 'imenu)
(setq imenu-auto-rescan      t) ;; автоматически обновлять список функций в буфере
(setq imenu-use-popup-menu nil) ;; диалоги Imenu только в минибуфере

;; Display the name of the current buffer in the title bar
(setq frame-title-format "%b")

;; Show-paren-mode settings
(show-paren-mode -1) ;; включить выделение выражений между {},[],()
(setq show-paren-style 'expression) ;; выделить цветом выражения между {},[],()

;; Electric-modes settings
(electric-pair-mode    1) ;; автозакрытие {},[],() с переводом курсора внутрь скобок
(electric-indent-mode -1) ;; отключить индентацию  electric-indent-mod'ом (default in Emacs-24.4)
;;no autosave
(setq make-backup-files         nil) ; Don't want any backup files
(setq auto-save-list-file-name  nil) ; Don't want any .saves files
(setq auto-save-default         nil) ; Don't want any auto saving

;; Delete selection
(delete-selection-mode t)

;; Syntax highlighting
(require 'font-lock)
(global-font-lock-mode             t) ;; включено с версии Emacs-22. На всякий...
(setq font-lock-maximum-decoration t)

;;require
(require 'bs)
(setq bs-configurations
      '(("files" "^\\*scratch\\*" nil nil bs-visits-non-file bs-sort-buffer-interns-are-last)))

;; Indent settings
										;(setq-default indent-tabs-mode nil) ;; отключить возможность ставить отступы TAB'ом
(setq-default tab-width          4) ;; ширина табуляции - 4 пробельных символа
(setq-default c-basic-offset     4)
(setq-default standart-indent    4) ;; стандартная ширина отступа - 4 пробельных символа
(setq-default lisp-body-indent   4) ;; сдвигать Lisp-выражения на 4 пробельных символа
(global-set-key (kbd "RET") 'newline-and-indent) ;; при нажатии Enter перевести каретку и сделать отступ
(setq lisp-indent-function  'common-lisp-indent-function)

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(icomplete-mode                t)
(ido-everywhere                t)
(setq ido-vitrual-buffers      t)

;;репозитории
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

;; Scrolling settings
(setq scroll-step               1) ;; вверх-вниз по 1 строке
(setq scroll-margin            5) ;; сдвигать буфер верх/вниз когда курсор в 10 шагах от верхней/нижней границы
(setq scroll-conservatively 10000)

;;folding
(defvar hs-special-modes-alist
  (mapcar 'purecopy
		  '((c-mode "{" "}" "/[*/]" nil nil)
			(c++-mode "{" "}" "/[*/]" nil nil)
			(bibtex-mode ("@\\S(*\\(\\s(\\)" 1))
			(java-mode "{" "}" "/[*/]" nil nil)
			(js-mode "{" "}" "/[*/]" nil)
			(emacs-lisp- "(" ")" nil))))

(require 'hideshow)

(global-set-key (kbd "<f9>") 'hs-toggle-hiding)
(global-set-key (kbd "C-<f9>") 'hs-hide-all)
(global-set-key (kbd "C-S-<f9>") 'hs-show-all)

(add-to-list 'load-path "~/.emacs.d/elpa/sr_speedbar/")
(require 'sr-speedbar)
(yas-global-mode 1)
(yas/load-directory "~/.emacs.d/snippets")

(require 'evil) ;;vim-mode

(setq word-wrap          t) ;; переносить по словам
(global-visual-line-mode t)

;; _заточки_ под удобную работу
(global-font-lock-mode 1) ;; эта хитрая заточка, включает разум емакса для подсветки синтаксиса
(tool-bar-mode -1);; выключить тубар
(menu-bar-mode -1);; выключить меню бар ( временное включение по C-x M-x )
(setq default-tab-width 4) ;; табы по 4
(fset 'yes-or-no-p 'y-or-n-p) ;; просим емакс быть кратким
(iswitchb-mode 1) ;; режим переключения буферов
(desktop-save-mode t) ;; сохранять буфера после закрытия
(global-linum-mode '1) ;; номерация строк
(evil-mode 0) ;; режим vim по-умолчанию выключен
(setq use-dialog-box     nil) ;; никаких графических диалогов и окон - все через минибуфер
(setq redisplay-dont-pause t)  ;; лучшая отрисовка буфера
(setq ring-bell-function 'ignore) ;; отключить звуковой сигнал

;; End of file newlines
(setq require-final-newline    t) ;; добавить новую пустую строку в конец файла при сохранении
(setq next-line-add-newlines nil) ;; не добавлять новую строку в конец при смещении
;; курсора  стрелками

;; Highlight search resaults
(setq search-highlight        t)
(setq query-replace-highlight t)

;; Delete trailing whitespaces, format buffer and untabify when save buffer
(defun format-current-buffer()
    (indent-region (point-min) (point-max)))
(defun untabify-current-buffer()
    (if (not indent-tabs-mode)
        (untabify (point-min) (point-max)))
    nil)
(add-to-list 'write-file-functions 'format-current-buffer)
(add-to-list 'write-file-functions 'untabify-current-buffer)
(add-to-list 'write-file-functions 'delete-trailing-whitespace)

;; CEDET settings
(require 'cedet) ;; использую "вшитую" версию CEDET. Мне хватает...
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-show-parser-state-mode)
(semantic-mode   t)
(global-ede-mode t)
(require 'ede/generic)
(require 'semantic/ia)
(ede-enable-generic-projects)

;; SLIME settings
(defun run-slime()
    (require 'slime)
    (require 'slime-autoloads)
    (setq slime-net-coding-system 'utf-8-unix)
    (slime-setup '(slime-fancy slime-asdf slime-indentation))) ;; загрузить основные дополнения Slime
;;;; for MS Windows
(when (system-is-windows)
    (when (and (file-exists-p win-sbcl-exe) (file-directory-p win-init-slime-path))
        (setq inferior-lisp-program win-sbcl-exe)
        (add-to-list 'load-path win-init-slime-path)
        (run-slime)))
;;;; for GNU/Linux
(when (system-is-linux)
    (when (and (file-exists-p unix-sbcl-bin) (file-directory-p unix-init-slime-path))
        (setq inferior-lisp-program unix-sbcl-bin)
        (add-to-list 'load-path unix-init-slime-path)
        (run-slime)))

;; мои функции
(defun load-config ();; функция, позволяющая быстро открыть _этот_ файл
	(interactive)
	(find-file "~/.emacs")
	(message "Opened ~/.emacs"))

(defun evil() ;; вход в режим vim
	(interactive)
	(evil-mode 1)
	(message "Switch to Vim mode"))

(defun no-evil () ;; выход из режима vim
	(interactive)
	(evil-mode 0)
	(message "Switch to Emacs mode"))

;;режимы редактирования .fb2
;;fb2 режим чтения без тегов
(defun fb2-mode-view()
	(vc-toggle-read-only)
	(interactive)
	(sgml-mode)
	(sgml-tags-invisible 0)
	(linum-mode 0)
	(message "Switch to .fb2 VIEW mode"))

;;fb2 режим редактирования
(defun fb2-mode-edit()
	(vc-toggle-read-only nil)
	(interactive)
	(sgml-mode)
	(sgml-tags-invisible 0)
	(linum-mode 1)
	(message "Switch to .fb2 EDIT mode"))
;;fb2 режим тегов
(defun fb2-mode-tags()
	(vc-toggle-read-only nil)
	(interactive)
	(sgml-mode)
	(sgml-tags-invisible -1)
	(linum-mode 1)
	(message "Switch to .fb2 EDIT WITH TAGS mode"))

;; мои горячие клавиши
(global-set-key "\C-x\M-x" 'load-config) ;; быстрый способ открыть _этот_ файл
(global-set-key [(control tab)] 'next-buffer) ;; переключение буферов как в браузере
(global-set-key [backtab] 'previous-buffer)
(global-set-key [f4] 'revert-buffer)
(global-set-key [f5] 'call-last-kbd-macro)
(global-set-key [f8] 'linum-mode) ;; без этой штуки жить нельзя
(global-set-key [f7] 'ibuffer) ;; c-x b на максималках
(global-set-key [f10] 'bookmark-bmenu-list) ;; �­то покруче, Ctrl-D в тотал командере.
(global-set-key (kbd "C-b") 'bookmark-set)
(global-set-key (kbd "M-b") 'bookmark-jump)
(global-set-key "\C-z" 'undo) ;; по умолчанию емакс уходит в бакграунд
(global-set-key "\C-c\C-r" 'replace-string) ;; замена строчки
(global-set-key "\C-cr" 'rename-buffer) ;; переименнование текущего буфера (не влияет на название файла)
(global-set-key "\C-x\M-m" 'menu-bar-mode) ;; я нахожу комбинацию [C-x M-%user_button%] удобной для своих нужд
(global-set-key "\C-x\M-w" 'eww) ;; браузер
(global-set-key "\C-x\M-i" 'package-install) ;; установщик пакетов
(global-set-key "\C-x\M-d" 'dired) ;; dired мод\
(global-set-key [f6] 'dired) ;; /для удобной навигации по файлам ОС
(global-set-key [(control f4)] 'kill-buffer);; 'убийство' буфера как вкладки браузера
(global-set-key [(control shift f4)] 'kill-some-buffers);; удобная штука, чтобы быстро 'убить' несколько буферов
(global-set-key "\C-x\M-k" 'kill-some-buffers);; то же самое
(global-set-key [(M f4)] 'kill-emacs);; привычный С-x C-c
(global-set-key [escape] 'evil);; вход в режим vim
(global-set-key [(control escape)] 'no-evil);; выход с режима vim
(global-set-key "\C-x\M-c" 'calc);; калькулятор
(global-set-key "\C-x\M-s" 'shell)
(global-set-key (kbd "<f12>") 'sr-speedbar-toggle);;speedbarrrrr
(global-set-key (kbd "<f2>") 'bs-show);; 9001 способ открыть список буферов
(global-set-key "\C-x\M-v" 'imenu) ;; вызов Imenu на F6
(global-set-key "\C-x\M-a" 'show-paren-mode)

;;различные настройки
;; Ace-window переключение окон по M-p
(global-set-key (kbd "M-p") 'ace-window)
(setq aw-keys '(?z ?x ?c ?v ?b ?n ?m ?k ?l))

;;fb2 авто переход в режим чтения
(add-to-list 'auto-mode-alist '(".fb2$" . fb2-mode-view))

;;Themes and auto preference
(custom-set-variables

 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (wombat)))
 '(display-time-mode t)
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (html5-schema w3 ## ace-window)))
 '(size-indication-mode t))
;;end of .emacs file
