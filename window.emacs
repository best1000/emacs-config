(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(make-backup-files nil)
 '(text-mode-hook (quote (text-mode-hook-identify)))
 '(verilog-auto-delete-trailing-whitespace t)
 '(verilog-auto-endcomments nil)
 '(verilog-auto-lineup (quote all))
 '(verilog-auto-read-includes t)
 '(verilog-tab-to-comment nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(set-default-font "lucida console-12") 

(set-fontset-font "fontset-default" 'unicode '("微软雅黑"))

;;(setq inhibit-startup-message t)

(add-hook 'verilog-mode-hook' (lambda()
                                (add-hook 'write-file-functions (lambda()
                                                                  (untabify (point-min) (point-max))
                                                                  nil))))
 
(setq mouse-wheel-mode t)

(setq mouse-yank-at-point t) 

(global-set-key (kbd "<mouse-3>") 'mouse-set-point)

(display-time)

(global-font-lock-mode 1)

(setq column-number-mode t)

(global-linum-mode t)  


(fset 'yes-or-no-p' y-or-n-p)

;; copy region or whole line
(global-set-key"\M-w"
               (lambda()
                 (interactive)
                 (if mark-active
                     (progn
                       (kill-ring-save (region-beginning)
                                       (region-end))
                       (message"copied region")
                       )
                   (progn
                     (kill-ring-save
                      (line-beginning-position)
                      (line-end-position))
                     (message"copied line")))))
;;kill region or whole line
(global-set-key"\C-w"
               (lambda()
                 (interactive)
                 (if mark-active
                     (kill-region (region-beginning)
                                  (region-end))
                   (progn
                     (kill-region
                      (line-beginning-position)
                      (line-end-position))
                     (message"killed line")))))

;;delete region or whole line
(global-set-key"\C-o"
               (lambda()
                 (interactive)
                 (if mark-active
                     (delete-region (region-beginning)
                                    (region-end))
                   (progn
                     (delete-region
                      (line-beginning-position)
                      (line-end-position))
                     (message"delete line")))))


;;my verilog comment
;;(defun my-verilog-comment()
;;  (interactive)
;;    (end-of-line)
;;    (indent-for-comment))

;;(global-set-key (kbd"C-.")'my-verilog-comment)






