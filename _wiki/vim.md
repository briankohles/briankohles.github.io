---
title: Vim
layout: page
collection: wiki
author: Brian Kohles
tags: wiki vim
categories: vim
---

> **Note:**
> Items with multiple keystrokes seperated by a comma should by typed one at a time in that order.
> ex: <kbd>g</kbd>, <kbd>g</kbd> -- Press "g" twice in a row.
> 
> Items with multiple keystrokes joined with a plus should be pressed at the same time.
> ex: <kbd>Shift + g</kbd> -- Press shift & "g" to create an uppercase G.

## Basics:

Open a document:

`vim filename.txt`

## Modes: Command and Edit

Command mode is the default, this mode allows you to use keys for commands/movement.

Edit(insert) mode allows you to add text to a file.

When in Command mode type one of the following to enter edit mode:

* <kbd>i</kbd> - Before the current character
* <kbd>Shift + i</kbd> - At the beginning of the line
* <kbd>a</kbd> - After the current character
* <kbd>Shift + a</kbd> - After the current line.
* <kbd>o</kbd> - Open a new line below the current line.
* <kbd>Shift + o</kbd> - Open a new line above the current line.

Press <kbd>Esc</kbd> to exit edit mode, and return to command mode.

> **Note:**
> Pressing <kbd>Esc</kbd> after typing something will become habit after a while.
> Doing this outside of  vim will cause you to accidentally close an IM window at some point.

## Command Mode Commands

All of the following are used in command mode.

Press <kbd>Esc</kbd> to exit edit mode.

### Moving around in command mode.

Basic "Arrow" keys:

* <kbd>h</kbd> - move cursor left one character
* <kbd>j</kbd> - move cursor down one line
* <kbd>k</kbd> - move cursor up one line
* <kbd>l</kbd> - move cursor right one character

Larger movements:

* <kbd>b</kbd> - Back one "word" (will stop @ punctuation)
* <kbd>Shift + b</kbd> - Back one "word" (will NOT stop @ punctuation)
* <kbd>w</kbd> - Forward one "word" (will stop @ punctuation)
* <kbd>Shift + w</kbd> - Forward one "word" (will NOT stop @ punctuation)
* <kbd>\^</kbd> - Beginning of line
* <kbd>$</kbd> - End of line
* <kbd>g</kbd>, <kbd>g</kbd> - Top of document
* <kbd>Shift + g</kbd> - bottom of document

### Deleting

Deleting something will cut that item into the paste buffer so it can be pasted elsewhere.

* <kbd>x</kbd> - delete current selection
* <kbd>d</kbd>, <kbd>w</kbd> - delete to end of current word
* <kbd>d</kbd>, <kbd>$</kbd> - delete to end of line
* <kbd>d</kbd>, <kbd>d</kbd> - delete the selected line

### Copy (yank)

  Note: When you copy in Vi this is a different clipboard than your desktop clipboard.

* <kbd>y</kbd> - copy current selection
* <kbd>y</kbd>, <kbd>w</kbd> - copy to end of current word
* <kbd>y</kbd>, <kbd>$</kbd> - copy to end of line
* <kbd>y</kbd>, <kbd>y</kbd> - copy the selected line

### Paste (put)

* <kbd>p</kbd> - paste clipboard after cursor
* <kbd>Shift + p</kbd> - paste clipboard before cursor

### Undo/Redo

* <kbd>u</kbd> - Undo
* <kbd>Cntrl + r</kbd> - Redo

### Finding & Replacing Things

Find:

* <kbd>/</kbd> + string_to_search_for - "/cat" will find instances of "cat"
* <kbd>*</kbd> Find next occurance of word currently under cursor.

Replace:

* `:%s/FIND/REPLACE/g` - global find & replace for string "FIND" replace with "REPLACE"

### Selecting Text
After starting a selection use Vim command mode keys to move around.

Once text is selected use commands to alter text.

* <kbd>Shift + v</kbd> - Start line select
* <kbd>Cntrl + v</kbd> - start character select

Most commands can be performed after selecting text. This can be useful for things like:

* deleting a word, line, or block of text (select & then <kdb>d</kdb> or <kdb>x</kdb>)

### Quiting Vim

* `:q` - quit without saving
* `:q!` - quite without saving (ignore warnings)
* `:wq` - save and quit
* `:wq!` - save and quit (ignore warnings)
* <kbd>Shift + z</kbd>, <kbd>Shift + z</kbd> - save and quit

### Using VimDiff

Open a new vim instance in diff mode:

`vimdiff <file1> <file2>`

Use the normal movement & viewport switching keys. Update the file as needed to get them into the desired state.

With your cursor over a difference you can use the commands below:

* <kbd>d</kbd>, <kbd>o</kbd> - Diff Obtain (pull diff value from other viewport)
* <kbd>d</kbd>, <kbd>p</kbd> - Diff Put (push diff value to other viewport)

### Sort

Sort the current selected lines (or entire file if no selection).

`:sort`

Remove duplicates lines on sort

`:sort u`

### Opening multple documents/screens/viewports

* `:sp <filepath/name>` - Split window horizontally to open another document
* `:vsp <filepath/name>` - Split window vertically to open another document

#### Moving between windows

* <kbd>Ctrl + w</kbd>, <kbd>Cntrl + w</kbd> - move to next viewport
* <kbd>Ctrl + w</kbd>, <kbd>j</kbd> - moves one viewport down.
* <kbd>Ctrl + w</kbd>, <kbd>k</kbd> - moves one viewport up.
* <kbd>Ctrl + w</kbd>, <kbd>h</kbd> - moves one viewport to the left.
* <kbd>Ctrl + w</kbd>, <kbd>l</kbd> - moves one viewport to the right.
* <kbd>Ctrl + w</kbd>, <kbd>=</kbd> - tells Vim to resize viewports to be of equal size.
* <kbd>Ctrl + w</kbd>, <kbd>-</kbd> - reduce active viewport by one line.
* <kbd>Ctrl + w</kbd>, <kbd>+</kbd> - increase active viewport by one line.

### Tabs

* `:tabnew` - Open a new tab
* `:tabn` - Next Tab
* `:tabp` - Previous Tab
* <kbd>g</kbd>, <kbd>t</kbd> - Go to the next tabpage
* {count}<kbd>g</kbd>, <kbd>t</kbd> - Go to tabpage #{count}

### Indent/Dedent Code Blocks

Blocks of code can be moved/tabbed left/right as a group.

Place your cursor on a line to be moved and press <kbd>></kbd>, <kbd>></kbd> to move the line right one "tab", or <kbd><</kbd>, <kbd><</kbd> to move the line left one "tab".

Select lines to be moved and press <kbd>></kbd> to move right, or <kbd><</kbd> to move left.

* Quickly format a whole bunch of code by selecting the block & then pressing <kbd>=</kbd> this will auto indent everything.

### Performing actions multiple times

Many commands can be preceeded by a count in order to perform them multiple times. For example to delete 3 lines type <kbd>3</kbd>, <kbd>d</kbd>, <kbd>d</kbd>.

The previous command can also be redone by pressing <kbd>.</kbd>

### Matching Brackets

Use the <kbd>%</kbd> key to jump from an open or close bracket (parenthesis, square, or curly), to its matching close or open bracket.

### Macros

Macros can be recorded to replay multiple commands.

1. press <kbd>q</kbd> to start recording
2. press a character `a-z0-9(A-Z?)` to assign the macro to that character
3. enter the commands that you want to store
4. press <kbd>q</kbd> to stop recording

To Replay type <kbd>@</kbd>, <kbd>A</kbd> (A is the character you chose in step 2 above).

To replay 7 times do <kbd>7</kbd>, <kbd>@</kbd>, <kbd>A</kbd>

### Folding

* Create fold from selection: <kbd>z</kbd>, <kbd>f</kbd>
* Delete fold (does not delete text in fold): <kbd>z</kbd>, <kbd>d</kbd>

### Shell Foo

* Run the text from the current line in bash:
  * `:.w !bash`

















## VIM Cheatsheets
http://www.tuxfiles.org/linuxhelp/vimcheat.html
http://www.viemu.com/vi-vim-cheat-sheet.gif
http://vim.rtorr.com/

## Tabs & windows/viewports
* Multiple Tabs can be opened
* Each tab can be split into multiple windows

## Vim viewport keybinding quick reference
http://vimdoc.sourceforge.net/htmldoc/windows.html
https://www.linux.com/learn/tutorials/442415-vim-tips-using-viewports
:sp will split the Vim window horizontally. Can be written out entirely as :split .
:vsp will split the Vim window vertically. Can be written out as :vsplit .
Ctrl-w Ctrl-w moves between Vim viewports.
Ctrl-w j moves one viewport down.
Ctrl-w k moves one viewport up.
Ctrl-w h moves one viewport to the left.
Ctrl-w l moves one viewport to the right.
Ctrl-w = tells Vim to resize viewports to be of equal size.
Ctrl-w - reduce active viewport by one line.
Ctrl-w + increase active viewport by one line.
Ctrl-w q will close the active window.
Ctrl-w r will rotate windows to the right.
Ctrl-w R will rotate windows to the left

## Tab Pages
http://vimdoc.sourceforge.net/htmldoc/tabpage.html
When starting Vim "vim -p filename ..." opens each file argument in a separate tab page

**create a new tabpage**
	- :tabnew

**swtich to another tabpage**
	- :tabn[ext]
	- :tabp[revious]
	- gt
		○ go to the next tabpage
	- {count}gt
		○ go to tabpage #{count}

**Close all tabs**
`:qa`

## Swap panes from horizontal <-> Vertical

To change two vertically split windows to horizonally split

ˋCtrl-w t Ctrl-w Kˋ

Horizontally to vertically:

ˋCtrl-w t Ctrl-w Hˋ

Explanations:

Ctrl-w t makes the first (topleft) window current Ctrl-w K moves the current window to full-width at the very top Ctrl-w H moves the current window to full-height at far left


## Macros
http://robots.thoughtbot.com/post/15348543318/vim-macros-and-you
	1. press "q" to start recording
	2. press a character a-z0-9(A-Z?) to assign the macro to that character
	3. enter the commands that you want to store
	4. press "q" to stop recording

To Replay type @A (A is the character you chose in step 2 above)
To replay 7 times do 7@A

## refresh/reload document from disk
:e

## visual diff of files
vimdiff <file1> <file2>

## Sort lines
### lines can be selected before hand & they will appear in "range"
:{range}sort u

## Set colors in VIMDIff so BG & FG aren't the same
 hi clear Normal 
 set bg=dark 
 hi clear 

## jumping around a document
**Jump back & forth between the current & previous area**
	`` (double backtick)

**Mark the current location**
	ma
	
**Jump to mark**
	`a

## Select text
• Shift-v
	- Select whole lines of text
• Cntrl-v
	- Select  in block mode
• gv
	- re-select last selection (useful when running multiple commands on one selection)

## vimdiff commands
]c :        - next difference
[c :        - previous difference
do          - diff obtain
dp          - diff put
zo          - open folded text
zc          - close folded text
:diffupdate - re-scan the files for differences

## ignore whitespace
set diffopt+=iwhite

## indent code block
- place cursor on open or close character (paren, curly or square)
- type: '>%' OR '<%'
- to increase or decrease indent of block

## find & replace with backreferences
%s:\(.*\):\1\t\1:g

## Insert text from named file below cursor
:r filename

## Turn on soft line wrap
:set wrap

## Regular Expressions
### find this or that
/red\|green\|blue
### replace this or that with new
:%s/red\|green\|blue/purple/g

## Setting searches to case insensitive or case sensitive
### turn on ignore case to ignore case entirely
:set ignorecase
### turn on smartcase (searching in lowercase ignores case, adding in an uppercase matches case)
### smartcase requires ignorecase to be set
:set smartcase
### or use the \c \C options in any of the modes
/copyright      " Case insensitive
/Copyright      " Case sensitive
/copyright\C    " Case sensitive
/Copyright\c    " Case insensitive

## Marks (bookmarks)
http://vim.wikia.com/wiki/Using_marks

Marks are for a specific line and column.

Apostrophe <kbd>'</kbd> jumps to the beginning of the line of the mark.
Backtick <kbd>`</kbd> jumps to the line & column of the mark.

* Each file can have mark a – use a lowercase mark to jump within a file.
* There is only one file mark A – use an uppercase mark to jump between files. (you do not need to open the file prior to jumping to the mark)

Command	Description
ma	set mark a at current cursor location
'a	jump to line of mark a (first non-blank character in line)
`a	jump to position (line and column) of mark a
d'a	delete from current line to line of mark a
d`a	delete from current cursor position to position of mark a
c'a	change text from current line to line of mark a
y`a	yank text to unnamed buffer from cursor to position of mark a
:marks	list all the current marks
:marks aB	list marks a, B
Commands like d'a operate "linewise" and include the start and end lines.
Commands like d`a operate "characterwise" and include the start but not the end character.
It is possible to navigate between lowercase marks:
Command	Description
]'	jump to next line with a lowercase mark
['	jump to previous line with a lowercase mark
]`	jump to next lowercase mark
[`	jump to previous lowercase mark
The above commands take a count. For example, 5]` jumps to the fifth mark after the cursor.
Special marks
Vim has some special marks which it sets automatically. Here are some of the most useful:
Command	Description
`.	jump to position where last change occurred in current buffer
`"	jump to position where last exited current buffer
`0	jump to position in last file edited (when exited Vim)
`1	like `0 but the previous file (also `2 etc)
''	jump back (to line in current buffer where jumped from)
``	jump back (to position in current buffer where jumped from)
`[ or `]	jump to beginning/end of previously changed or yanked text
`< or `>	jump to beginning/end of last visual selection
See the full list at :help '[ and following.
### Deleting marks
If you delete a line containing a mark, the mark is also deleted.
If you wipeout a buffer (command :bw), all marks for the buffer are deleted.
The :delmarks command (abbreviated as :delm) may be used to delete specified marks.
Command	Description
:delmarks a	delete mark a
:delmarks a-d	delete marks a, b, c, d
:delmarks abxy	delete marks a, b, x, y
:delmarks aA	delete marks a, A
:delmarks!	delete all lowercase marks for the current buffer (a-z)

From <http://vim.wikia.com/wiki/Using_marks> 


## Jump to matching brace/bracket/paren
% - typing the percent symbol while a brace/bracket/paren is highlighted will jump to the matching item

## RegEx 

Reuse
	Put:
	source ~/.regexlist.vim
	into your vimrc.
	Do the search. Decide you might want to use that one again. Type this literally:
	:sp ~/.regexlist.vim<CR>
olet MyRegExName = '<C-R>/'<ESC>
:w<CR>
:so %<CR>
:q<CR>
	Where <C-R> is CtrlR, <CR> is ENTER and <ESC> is ESC.
	Next time you want to use it:
	/<C-R>=MyRegExName<CR><CR>
	Ctrl-R is your friend! Ctrl-R followed by / pulls up the last search. Ctrl-R followed by = allows you to enter an expression.
	
	From <https://stackoverflow.com/questions/2201174/save-commonly-used-regex-patterns-in-vim> 


## Open Multiple Files at once

To edit all files in the current folder, use:
`vim *`

To edit all files in tabs, use:
`vim -p *`

To edit all files in horizontally split windows, use:
`vim -o *`

## diff two already open files
Open the files in vertical panes & then run command ˋ:diffthisˋ in each pane.

## turn off diff
`:diffoff`

## Update Diff

`:diffupdate`
