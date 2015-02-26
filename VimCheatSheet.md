# Vim Cheat Sheet

> http://www.thegeekstuff.com/2009/03/8-essential-vim-editor-navigation-fundamentals/

## Line 

* 0 – go to the starting of the current line.
* ^ – go to the first non blank character of the line.
* $ – go to the end of the current line.
* g_ – go to the last non blank character of the line.

## Screen

* H – Go to the first line of current screen.
* M – Go to the middle line of current screen.
* L – Go to the last line of current screen.
* ctrl+f – Jump forward one full screen.
* ctrl+b – Jump backwards one full screen
* ctrl+d – Jump forward (down) a half screen
* ctrl+u – Jump back (up) one half screen

## Special

* N% – Go to the Nth percentage line of the file.
* NG – Go to the Nth line of the file.
* G – Go to the end of the file.
* `” – Go to the position where you were in NORMAL MODE while last closing the file.
* `^ – Go to the position where you were in INSERT MODE while last closing the file.
* g – Go to the beginning of the file.

## Word

* e – go to the end of the current word.
* E – go to the end of the current WORD.
* b – go to the previous (before) word.
* B – go to the previous (before) WORD.
* w – go to the next word.
* W – go to the next WORD.

## Parragraph

* { – Go to the beginning of the current paragraph. By pressing { again and again move to the previous paragraph beginnings.
* } – Go to the end of the current paragraph. By pressing } again and again move to the next paragraph end, and again.

## Search

* /i – Search for a pattern which will you take you to the next occurrence of it.
* ?i – Search for a pattern which will you take you to the previous occurrence of it.
* * - Go to the next occurrence of the current word under the cursor.
* # - Go to the previous occurrence of the current word under the cursor.

## Code

* % – Go to the matching braces, or parenthesis inside code.

## Command Line

* vim +10 /etc/passwd
* vim +/install README

