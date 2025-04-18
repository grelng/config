# config
Storage place for various config files.

## Bash
```
##### .bashrc
# prompt stuff
 parse_git_branch() {
      git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
 }

 if [ "$color_prompt" = yes ]; then
     PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[01;90m\]\$(parse_git_branch)\[\033[00m\]$ "
     #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
 else
     PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
 fi
 unset color_prompt force_color_prompt
 export HISTTIMEFORMAT="%F %T "
 
  # profiling alias
 alias cpu_profile='LD_PRELOAD=/usr/lib/libprofiler.so CPUPROFILE=/tmp/cpu_profile_$(date '+%Y%m%d_%H%M%S_%Z').out CPUPROFILESIGNAL=12 '
 alias heap_profile='LD_PRELOAD=/usr/lib/libtcmalloc.so HEAPPROFILE=/tmp/heap_profile_$(date '+%Y%m%d_%H%M%S_%Z').out HEAPPROFILESIGNAL=12 HEAP_PROFILE_ALLOCATION_INTERVAL=0 HEAP_PROFILE_INUSE_INTERVAL=0'
 alias cpu_profile_full='LD_PRELOAD=/usr/lib/libprofiler.so CPUPROFILE=/tmp/cpu_profile_$(date '+%Y%m%d_%H%M%S_%Z').out'
 alias heap_profile_full='LD_PRELOAD=/usr/lib/libtcmalloc.so HEAPPROFILE=/tmp/heap_profile_$(date '+%Y%m%d_%H%M%S_%Z').out HEAP_PROFILE_ALLOCATION_INTERVAL=0 HEAP_PROFILE_INUSE_INTERVAL=0'

alias vim="nvim"
```
## Git
```
[user]
    name = Greg Long
    email = glong@nuro.ai
[color]
    ui = true
[alias]
    list = log --all --graph --abbrev-commit --decorate --format=format:'%C(auto)%h - %C(dim white)(%ar)%C(auto) %s - %C(dim white)%an%C(auto)%d'
    lg = log --all --graph --abbrev-commit --decorate --format=format:'%C(auto)%h - %C(dim white)(%ar)%C(auto) %s - %C(dim white)%an%C(auto)%d'
    blist = log --graph --abbrev-commit --decorate --format=format:'%C(auto)%h - %C(dim white)(%ar)%C(auto) %s - %C(dim white)%an%C(auto)%d'
    blg = log --graph --abbrev-commit --decorate --format=format:'%C(auto)%h - %C(dim white)(%ar)%C(auto) %s - %C(dim white)%an%C(auto)%d'
    cos = "!f() { \
    git checkout develop && \
    git pull && \
    git checkout -b \"$1\"; \
    }; \
    f"
    recommit = "!f() { \
    git add -u && \
    git commit --amend; \
    }; \
    f"
[filter "lfs"]
        process = git-lfs filter-process
        required = true
        clean = git-lfs clean -- %f
        smudge = git-lfs smudge -- %f
[push]
        default = current
[core]
        editor = vim
[lfs]
        fetchexclude = *
[http]
        sslCAPath = /home/glong/.certs
        sslverify = false
[fetch]
        prune = true
[pull]
        ff = only
```
## zsh
WIP
## Neovim
* install nvim
* install plug: https://github.com/junegunn/vim-plug
* put `nvim` folder into `~/.config`
## FZF
- install fzf `sudo apt install fzf`
- configure:
```
 source /usr/share/doc/fzf/examples/key-bindings.bash
 source /usr/share/doc/fzf/examples/completion.bash
 if type rg &> /dev/null; then
     export FZF_DEFAULT_COMMAND='rg --files --hidden'
 fi
```
## Colors
color script:
```
awk 'BEGIN{
    s="/\\/\\/\\/\\/\\"; s=s s s s s s s s s s s s s s s s s s s s s s s;
    for (colnum = 0; colnum<256; colnum++) {
        r = 255-(colnum*255/255);
        g = (colnum*510/255);
        b = (colnum*255/255);
        if (g>255) g = 510-g;
        printf "\033[48;2;%d;%d;%dm", r,g,b;
        printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
        printf "%s\033[0m", substr(s,colnum+1,1);
    }
    printf "\n";
}'
```
### Client side
- Make sure client side terminal supports true color, reports xterm-256color as terminal
- check if your ssh command supports (ssh supports, mosh doesn't)
- Mosh supports if you build from source:
```
$ git clone [](https://github.com/mobile-shell/mosh)
$ cd mosh
$ ./autogen.sh
$ ./configure
$ make
$ make install
```
### SSH terminal
- make sure $TERM is being reported properly
- verify colors work with color script
### Tmux
- add this to your .tmux.conf:
 ```set -g default-terminal "xterm-256color"
   set -ga terminal-overrides ",xterm-256color:Tc"
   ```
   - restart tmux and verify colors work with color script
## iTerm2
To make navigate by word work with option+b/option+f:
- Preferences > Keys (or Preferences > Profiles > Keys)
- Click the plus.
- move forward one word
 ```option+right
   send escape sequence
   f
   ```
- move back one word
 ```option+left
   send escape sequence
   b
   ```
- delete to beginning of word (credit)
 ```option+delete
   send hex code
   0x1B 0x08
   ```
- delete to end of word
 ```fn+option+delete
   send escape sequence
   d
   ```

## Misc utilities
- https://zaiste.net/posts/shell-commands-rust/
- https://github.com/ibraheemdev/modern-unix
- bat https://github.com/sharkdp/bat
- ripgrep https://github.com/BurntSushi/ripgrep
- fd https://github.com/sharkdp/fd
- delta https://github.com/dandavison/delta
- dust https://github.com/bootandy/dust
- duf https://github.com/muesli/duf
