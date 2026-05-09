# Install Yeah Archy user-level customizations without modifying Omarchy source files.

mkdir -p ~/.local/bin
install -m 0755 "$OMARCHY_PATH/yeah-archy/bin/yeah-archy-capture-screenshot-hdr" ~/.local/bin/yeah-archy-capture-screenshot-hdr

HYPR_BINDINGS=~/.config/hypr/bindings.conf

if [[ -f $HYPR_BINDINGS ]] && ! grep -q 'yeah-archy-capture-screenshot-hdr' "$HYPR_BINDINGS"; then
  {
    printf '\n# Yeah Archy: use HDR-aware screenshot capture.\n'
    printf 'unbind = , PRINT\n'
    printf 'bindd = , PRINT, Screenshot, exec, %s/.local/bin/yeah-archy-capture-screenshot-hdr\n' "$HOME"
  } >>"$HYPR_BINDINGS"
fi
