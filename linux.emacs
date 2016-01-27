(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 ;; '(make-backup-files nil)
 ;; '(text-mode-hook (quote (text-mode-hook-identify)))
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

(setq-default indent-tabs-mode nil)

(display-time)

(setq column-number-mode t)

(fset 'yes-or-no-p' y-or-n-p)

(setq auto-save-default nil)

(delete-selection-mode 1)



(setq c-default-style "linux"
      c-basic-offset 4)

(require 'cc-mode)

(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

;; copy region or whole line

(global-set-key"\M-w"
               (lambda()
                 (interactive)
                 (if mark-active
                     (progn
                       (kill-ring-save (region-beginning)
                                       (region-end))
                       (message"copied region"))
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
                     (progn
                       (kill-region (region-beginning)
                                    (region-end))
                       (message"killed region"))
                   (progn
                     (kill-region
                      (line-beginning-position)
                      (line-end-position))
                     (message"killed line")))))

(global-set-key (kbd "C-_") 'comment-or-uncomment-region-or-line)

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (message"comment or umcomment")
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)
    (next-logical-line)))


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

;;verilog

(add-hook 'verilog-mode-hook' (lambda()
                                (add-hook 'write-file-functions (lambda()
                                                                  (untabify (point-min) (point-max))
                                                                  nil))))
