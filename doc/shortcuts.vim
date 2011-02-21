" Moving around
--------------------------------------------------------------------------------------------------- 
CTRL-u	Move up half a page
CTRL-d	Move down half a page

CTRL-w 	If split screen then move to screen above
CTRL-w 	If split screen then move to screen below
 
w	Move one word to the right
b	Move one word to the left
 
0	Move to begin of line
$	Move to end of line
nG	Move to specified linenumber, where n is the line number.
%	Jump to matching item '([{}])'.
 
" Cursor movement
---------------------------------------------------------------------------------------------------
zz	Display the line your cursor is at in the middle of the screen.
zt	,, top of the screen
zb	,, bottom of the screen
 
Deleting, Copying, Pasting and Repeating
dd	Delete a line
dw	Delete a word
d$ or D	Delete to end of line
d^	Delete to begin of line
yy	Yank (copy) line into register
yw	Yank (copy) word into register
p	Paste deleted line
:pu	Paste block after current line
. (dot)	Repeat last change, a count can be used like '3.'
 
" Search and Replace
---------------------------------------------------------------------------------------------------
/	Start searching forward
?	,, backwards
*	Search the word your cursor is at, forward
#	,, backwards
n	Find next
Shift-N	Find previous
:%s/four/4/g	Replace all occurences of 'four' with '4'
gd	Mark all selected variables (global declaration) and go to the declaration.
 
" Modes
---------------------------------------------------------------------------------------------------
i	Start 'INSERT' mode
a	Start 'APPEND' mode
r	Start 'REPLACE' single character mode
R	Start 'REPLACE' mode
o	Start 'INSERT' on new line below current line
O	Start 'INSERT' on new line above current line
	Return to command mode
 
" Other
---------------------------------------------------------------------------------------------------
:noh	Turn off highlight
:w	Save file
:q	Quit vim
:wq	,,
