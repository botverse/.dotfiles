# notes

Control volume via cli

```bash
amixer -D pulse sset Master 5%+
amixer -D pulse sset Master 5%-
```

Get Spotify current playing song

```bash
dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata'
```

## Cheat Sheets

* [Vim](https://gist.github.com/botverse/0ba56adc7c19da785c78#file-vim-cheatsheet-md)
* [Tmux](https://gist.github.com/MohamedAlaa/2961058#file-tmux-cheatsheet-markdown)
