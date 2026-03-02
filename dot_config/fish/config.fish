# ~/.config/fish/config.fish
# Fish shell configuration

# --- Homebrew ---------------------------------------------------------------
fish_add_path /opt/homebrew/bin /opt/homebrew/sbin

# --- PATH tweaks ------------------------------------------------------------
# LM Studio CLI
set -x PATH $HOME/.lmstudio/bin $PATH

# --- Conda ------------------------------------------------------------------
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/anaconda3/bin/conda
    eval /opt/anaconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/opt/anaconda3/etc/fish/conf.d/conda.fish"
        source /opt/anaconda3/etc/fish/conf.d/conda.fish
    else
        set -x PATH /opt/anaconda3/bin $PATH
    end
end
# <<< conda initialize <<<

# --- Utilities --------------------------------------------------------------
# Yazi: cd into the directory you quit into
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file=$tmp
    set cwd (cat $tmp)
    if test -n "$cwd" -a "$cwd" != "$PWD"
        cd "$cwd"
    end
    rm -f -- "$tmp"
end


# --- Aliases ----------------------------------------------------------------
alias ls="lsd"
alias lsc="lsd --classic"
alias ll="lsd -lh"
alias la="lsd -lha"
alias lt="lsd --tree"
alias lt1="lsd --tree --depth 1"
alias lt2="lsd --tree --depth 2"
alias lt3="lsd --tree --depth 3"
alias cat="bat"
alias du="dust"

# --- Vi Key Bindings --------------------------------------------------------
fish_vi_key_bindings

# Make jk act as <Esc> (like many Vim configs)
function fish_user_key_bindings
    fish_vi_key_bindings

    # jk in insert mode → escape to normal
    bind -M insert -m default jk backward-char force-repaint
end

# Open command line in Vim with Ctrl-X Ctrl-E (same as bash/zsh)
bind \cx\ce edit_command_buffer

set fish_greeting "      /`·.¸
     /¸...¸`:·
 ¸.·´  ¸   `·.¸.·´)
: © ):´;      ¸  {
 `·.¸ `·  ¸.·´\`·¸)
     `\\\´´\¸.·´
"

# --- Extras -----------------------------------------------------------------
# zoxide (smart cd)
zoxide init fish | source

# Starship prompt
starship init fish | source

# uv
fish_add_path "/Users/andrea/.local/bin"

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/andrea/.lmstudio/bin
# End of LM Studio CLI section

