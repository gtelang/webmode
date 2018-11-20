(require 'cl-lib)

(when (< 1 2)
  (message "Hello World"))

;; some of these encode, motion commands of the point
;; the jumping of the cursor is central to text processing
;; remember the turing machine?! this works exactly like this. 
(end-of-buffer)  ; move to end of buffer
(beginning-of-buffer) ; move  to beginning of buffer
(beginning-of-line) ; move forward to beginning of current-line. 
(end-of-line 3) ; with this line marked as 1, move 2 lines more, and to the end of that line
(line-move -10) ; move cursor previously n-lines

;; get the line number of the current position
(line-number-at-pos) ; remember lines and columns are numberd from 1!
(point); get the current cursor position, begining of buffer is 1
(region-beginning);return start position of text selection.
(region-ending);
;; move cursor to position 392
(goto-char 392)

;;move forward or backward some number of lines
(forward-line 2)
(forward-line -2)

;; move cursor by 9 chars
(forward-char 2)
(backward-char 9)
;; move cursor to the first char that's not a newline or tab
;; Returns the distance traveled
(skip-chars-forward "\n\t")
(skip-chars-backward "\n\t")
(search-forward "cat")
(search-backward "cat")
;; move cursor to the location matched by regex
;; returns the new position
(re-search-forward myRegex)
(re-search-backward myRegex)

(setq test ()) ; initialization
(add-to-list 'test 56) ; to push something onto a sstack
(add-to-list 'test 92) ; to push something onto a stack

(setq test (cdr test)); to pop something of the stack 

(line-number-at-pos) ; to get the current position line number of the cursor!
(what-line) ; returns as string...umm useless methinks
(1+ 3) ; increment operator incredibly useful!

; nothing but the equivalent of a for-loop 
; albet one you can't break out of? 
(dotimes (i 10)
  (print i))

;; But don't forget the great while loop
;; the typical pattern here would often be
while(  (and.. ..) BODY....  )
;; there is a state variable inside the and, which 
;; keeps changing in the body and that you check at 
;; the beginning of each iteration. 


;; preserve {point, mark, current buffer}
(save-excursion
  ;; lisp code here involving moving cursor, mark, changing buffer.
  (beginning-of-buffer))

(current-buffer) ; return the whole current-buffer
(read-only-mode) ; toggle the read-only mode state of the buffer the point is in. 

(widen);when buffer narrowing is in effect, widen everything so that whole buffer can be used.
       ;when buffer already wide, does nothing. super-useful function

; Note that in elisp a sequence is either a list or an array
; sequence functions work for both. 
(setq myarr [1 2 3 "fuck you"]) ; this is an array
(length myarr)
(elt myarr 3) ; Extract the ith element of a sequence.
(aref myarr 3) ; Works for arrays, and apparently faster? ftp://ftp.gnu.org/pub/old-gnu/Manuals/elisp-manual-20-2.5/html_chapter/elisp_7.html

;; Yay! for generating lists
(number-sequence 0 10)
(number-sequence 1 10 1) 

(get-buffer-create "foo1") ; The buffer returned does not become the current buffer—this function does not change which buffer is current.
;; If there is no buffer named name, then that is the name of the new buffer; if that name is in use, a suffix of the form ‘<n>’,
;; where n is an integer, is appended to name.
(generate-new-buffer "bar")
;; save-restriction to preserve whatever narrowing was in effect

;; Returns the name of the buffer as a string!
(buffer-name)

;; Literally that rename buffer, but it seems, that when when
;; you write, the disk file to which you write is not affected. 
(rename-buffer "test") 
(get-buffer "test"); given the name of the buffer retrieve the full buffer itself. 

;; Buffer-local variables are interesting!
;; a bit like a buffer having its own copy of
;; a variable
;https://www.gnu.org/software/emacs/manual/html_node/elisp/Creating-Buffer_002dLocal.html
(setq test '(1 2 3))
(make-local-variable 'test)
(setq test 4)

;; Variations on saving state of the current buffer and doing some work
;; or use another temporary buffer. 
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Current-Buffer.html
;; save-current-buffer body...
;; with-current-buffer buffer-or-name body...
;; with-temp-buffer body...

;; gives you value of the character number at the beginning
;; of the line the cursor is in, same for end. 
(line-beginning-position)
(line-end-position)

;; Regular expressions are awesome!
;; https://stackoverflow.com/questions/53357471/using-regular-expressions-via-re-search-forward-in-elisp/53358196#53358196
;; You can search for specific strings or those belonging to specific patterns. 
;; Especially useful in codes for searching for specific strings. 
;; https://www.emacswiki.org/emacs/RegularExpression
;; \w and \b are useful for saying word constituent and word-boundary
;; and ofcourse \(\) for defining a group, (see the world, world, world) before. 
;; regular expressions match substrings on a single line. 
;; test it out on the paragraphs below. 
;; [:blank:]  a space or tab character
;; \| gives you alternatives. Wow!!!!!

;; [:digit:]  a digit, same as [0-9]
;; [:alpha:]  a letter (an alphabetic character)
;; [:alnum:]  a letter or a digit (an alphanumeric character)
;; [:upper:]  a letter in uppercase
;; [:lower:]  a letter in lowercase
;; [:graph:]  a visible character
;; [:print:]  a visible character plus the space character
;; [:space:]  a whitespace character, as defined by the syntax table, but typically [ \t\r\n\v\f], which includes the newline character
;; [:blank:]  a space or tab character
;; [:xdigit:] an hexadecimal digit
;; [:cntrl:]  a control character
;; [:ascii:]  an ascii character
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Useful functions sing regexps!
;; C-M-s                   incremental forward search matching regexp
;; C-M-r                   incremental backward search matching regexp 
;; replace-regexp          replace string matching regexp
;; query-replace-regexp    same, but query before each replacement
;; align-regexp            align, using strings matching regexp as delimiters
;; highlight-regexp        highlight strings matching regexp
;; occur                   show lines containing a match
;; multi-occur             show lines in all buffers containing a match
;; how-many                count the number of strings matching regexp
;; keep-lines              delete all lines except those containing matches
;; flush-lines             delete lines containing matches
;; grep                    call unix grep command and put result in a buffer
;; lgrep                   user-friendly interface to the grep command
;; rgrep                   recursive grep
;; dired-do-copy-regexp    copy files with names matching regexp
;; dired-do-rename-regexp  rename files matching regexp 
;; find-grep-dired         display files containing matches for regexp with Dired





;; hello world
;; hello  world
;; hello    world
;; hello      world

;; As a ‘\’ is not special inside a character alternative   it can never remove the
;; special meaning of ‘-’ or ‘]’. So you should not quote these    characters when they
;; have no special meaning either. This would not clarify anything, since backslashes
;; can legitimately precede fuckthese characters where they have special meaning, as in
;; ‘[^\]’ ("[^\\]" for Lisp string syntax), which matches any single character except
;; a backslash.

;; A,,,,, something
;; B, other thing


;; world
;; worldworld
;; world world world
;; worldworldworld
;; worldworldworldworldworldworldworldworldworld


;; You are probably looking for after-save-hook to
;; to update all the emacs data-structures, or
;; whatever, don't do this when you are typing things
;; else things will be become too slow. 


;; to perform tab-expansion like <s in web-mode
;; for whatever, use this
;; https://orgmode.org/manual/Easy-templates.html#Easy-templates
;; Nice customizations are available, else I think we will need to use 
;; YAML will also be nice, for this probbaly, to make it more disciplined. 



;; https://emacs.stackexchange.com/a/46055/10896
;; very useful for writing stuff to a buffer
;; only for writing. the key was the inhibit-read-only
;; flag. 
(get-buffer-create "foo")
(set-buffer "foo")
(read-only-mode)
(let ((inhibit-read-only t))
  (insert "\nGoodbye world"))

;; The great dash libraries which
;; gives you haskell like functionality
;; for instance consider this.
;; very useful! for some advanced manipulation. 
(require 'dash-functional)
(defun square (n) (* n n))

(-map 'square '(1 2 3 4))
(-zip-with '+ '(1 2 3) '(4 5 6)) 

;; Radio Targets to create internal links in Org-mode.
;; these can be incredibly helpful
;; https://orgmode.org/manual/Radio-targets.html#Radio-targets
;; These link to the nearest enclosing
;; section/subsection or list which is ok when you
;; are dealing with small chunks. 

;; Most useful function ever! thing-at-pt
;; it returns a string, you can return the line
;; or word the cursor is on and much more. (forward-line)
;; http://ergoemacs.org/emacs/elisp_text_editing_functions.html


;; Another useful function is the numer-to-string.
;; Ultimately many things have to be converted to strings
;; before being inserted into the buffer. 


;; http://ergoemacs.org/emacs/elisp_all_about_lines.html
;; Also the buffer-substring is so important!
;; Note see how buffer-substring is different from
;; buffer-substring-no-properties, you will probably
;; use this more than buffer-substring. With this, you
;; get all the font properties of the text. 
(buffer-substring-no-properties (point) (point-max))


;; there is also a nice with-current-buffer function
;; which allows you to create a temporary bufferm
;; and then you can swutch back to the original buffer
;; when the function is done. Found this here
;; http://ergoemacs.org/emacs/elisp_buffer_file_functions.html
;; And finally I would like to have a major mode.
;; http://ergoemacs.org/emacs/elisp_write_major_mode_index.html
