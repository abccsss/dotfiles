
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/abccsss/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

# disable greeting
set fish_greeting

# zoxide
zoxide init --cmd cd fish | source

# starship
set -x STARSHIP_CONFIG ~/.config/starship/config.toml
starship init fish | source

function starship_transient_prompt_func
  starship module character
end

enable_transience

# # oh-my-posh
# oh-my-posh init fish --config ~/.config/oh-my-posh/fish.toml | source

# enter vi mode and turn off indicator
fish_vi_key_bindings
function fish_mode_prompt; end

# GUI
set -x DISPLAY (ip route | awk '/default/ {print $3}'):0.0
set -x GDK_SCALE 2
set -x GDK_DPI_SCALE 1

