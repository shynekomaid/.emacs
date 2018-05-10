;;author: tminei
;;site: tmi.zzz.com.ua

;;репозитории
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize) 

(require 'evil) ;;vim-mode

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
;(global-hl-line-mode 1) ;; подсветка строки с курсором

;; мои функции
(defun load-config ();; функция, позволяющая быстро открыть _этот_ файл 
  (interactive)
  (find-file "~/.emacs"))

(defun no-evil () ;; выход из режима vim
  (interactive)
  (evil-mode 0))

;;режимы редактирования .fb2
;;fb2 режим чтения без тегов
(defun fb2-mode-view()
  (vc-toggle-read-only)
  (interactive)
  (sgml-mode)
  (sgml-tags-invisible 0))
;;fb2 режим редактирования
(defun fb2-mode-edit()
  (vc-toggle-read-only nil)
  (interactive)
  (sgml-mode)
  (sgml-tags-invisible 0))
;;fb2 режим тегов
(defun fb2-mode-tags()
  (vc-toggle-read-only nil)
  (interactive)
  (sgml-mode)
  (sgml-tags-invisible -1))

;; мои горячие клавиши
(global-set-key "\C-x\M-x" 'load-config) ;; быстрый способ открыть _этот_ файл
(global-set-key [(control tab)] 'next-buffer) ;; переключение буферов как в браузере 
(global-set-key [(control shift tab)] 'previous-buffer)
(global-set-key [f4] 'revert-buffer)
(global-set-key [f5] 'call-last-kbd-macro)
(global-set-key [f8] 'linum-mode) ;; без этой штуки жить нельзя
(global-set-key [f7] 'ibuffer) ;; c-x b на максималках
(global-set-key [f10] 'bookmark-bmenu-list) ;; Это покруче, Ctrl-D в тотал командере, сохраняйте букмарки везде (C-xrm) и открывайте их.
(global-set-key "\C-z" 'undo) ;; по умолчанию емакс уходит в бакграунд 
(global-set-key "\C-c\C-r" 'replace-string) ;; замена строчки
(global-set-key "\C-cr" 'rename-buffer) ;; переименнование текущего буфера (не влияет на название файла)
(global-set-key "\C-x\M-m" 'menu-bar-mode) ;; я нахожу комбинацию [C-x M-%user_button%] удобной для своих нужд
(global-set-key "\C-x\M-w" 'eww) ;; браузер
(global-set-key "\C-x\M-i" 'package-install) ;; установщик пакетов
(global-set-key [(control f4)] 'kill-buffer);; 'убийство' буфера как вкладки браузера
(global-set-key [(control shift f4)] 'kill-some-buffers);; удобная штука, чтобы быстро 'убить' несколько буферов
(global-set-key [(M f4)] 'kill-emacs);; привычный С-x C-c
(global-set-key [escape] 'evil-mode);; вход в режим vim
(global-set-key [(control escape)] 'no-evil);; выход с режима vim

;;различные настройки
;; Ace-window переключение окон по M-p
(global-set-key (kbd "M-p") 'ace-window)
(setq aw-keys '(?z ?x ?c ?v ?b ?n ?m ?k ?l))
;(setq aw-background nil) ;; запрет на изменение фона при M-p

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
