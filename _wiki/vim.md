—
title: Vim
layout: page
collection: wiki
author: Brian Kohles
tags: wiki vim
categories: vim
—
 
**Note:** Items with multiple keystrokes seperated by a comma should by typed one at a time in that order. ex: <kbd>g</kbd>, <kbd>g</kbd> -- Press "g" twice in a row.

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

Note: Pressing <kbd>Esc</kbd> after typing something will become habit after a while. Doing this outside of  vim will cause you to accidentally close an IM window at some point.

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

### Copying (yank)

* <kbd>y</kbd> - copy current selection
* <kbd>y</kbd>, <kbd>w</kbd> - copy to end of current word
* <kbd>y</kbd>, <kbd>$</kbd> - copy to end of line
* <kbd>y</kbd>, <kbd>y</kbd> - copy the selected line

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

* <kbd>Ctrl-w</kbd>, <kbd>Cntrl-w</kbd> - move to next viewport
* <kbd>Ctrl-w</kbd>, <kbd>j</kbd> - moves one viewport down.
* <kbd>Ctrl-w</kbd>, <kbd>k</kbd> - moves one viewport up.
* <kbd>Ctrl-w</kbd>, <kbd>h</kbd> - moves one viewport to the left.
* <kbd>Ctrl-w</kbd>, <kbd>l</kbd> - moves one viewport to the right.
* <kbd>Ctrl-w</kbd>, <kbd>=</kbd> - tells Vim to resize viewports to be of equal size.
* <kbd>Ctrl-w</kbd>, <kbd>-</kbd> - reduce active viewport by one line.
* <kbd>Ctrl-w</kbd>, <kbd>+</kbd> - increase active viewport by one line.

### Tabs

* `:tabnew` - Open a new tab
* `:tabn` - Next Tab
* `:tabp` - Previous Tab
* <kbd>g</kbd>, <kbd>t</kbd> - Go to the next tabpage
* {count}<kbd>g</kbd>, <kbd>t</kbd> - Go to tabpage #{count}
