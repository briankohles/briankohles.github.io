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
