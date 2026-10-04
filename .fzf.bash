# Setup fzf
# ---------
for FZFBIN in /opt/homebrew/opt/fzf/bin /usr/local/opt/fzf/bin; do
  if [[ -d "$FZFBIN" && ! "$PATH" == *$FZFBIN* ]]; then
    export PATH="${PATH:+${PATH}:}$FZFBIN"
  fi
done
unset FZFBIN

# first existing directory with the shell integration (same candidates as in .zshrc)
for FZFPATH in \
  /opt/homebrew/opt/fzf/shell \
  /usr/local/opt/fzf/shell \
  /usr/share/doc/fzf/examples \
  /usr/share/fzf \
  ""
do
  [[ -d "$FZFPATH" ]] && break
done

if [[ -n "$FZFPATH" ]]; then
  # Auto-completion
  # ---------------
  [[ $- == *i* ]] && source "${FZFPATH}/completion.bash" 2> /dev/null

  # Key bindings
  # ------------
  [[ -f "${FZFPATH}/key-bindings.bash" ]] && source "${FZFPATH}/key-bindings.bash"
fi
