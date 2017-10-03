;; Multiple cursors
;;
;; Use <insert> to place cursor on the next match for the selection
;; Use S-<insert> to place on the previous match
;; Use C-' to use extended mark mode
;; Use C-" to place cursor on all matches
;; Select a region and C-M-' to place cursors on each line of the selection
(use-package multiple-cursors
  :commands multiple-cursors-mode
  :config
  (bind-keys :map mc/keymap
	     ("C-'" . nil))
  :bind (("<insert>" . mc/mark-next-like-this)
	 ("S-<insert>" . mc/mark-previous-like-this)
	 ("C-'" . mc/mark-more-like-this-extended)
	 ("C-\"" . mc/mark-all-like-this-dwim)
	 ("C-M-'" . mc/edit-lines)))

;; Use C-= to select innermost logical unit the cursor is on. Keep
;; hitting C-= to expand it to the next logical unit.
(use-package expand-region
  :commands er/expand-region
  :bind ("C-=" . er/expand-region))

;; Use C-c <tab> to auto-indent the entire buffer
(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))
(global-set-key (kbd "C-c <tab>") 'indent-buffer)

(provide 'zf-editing)
