function pkittypd 
  find /usr/local/share/pretty-kitty/colors/dark -type f -name "*.conf" | shuf -n 1 | tee /dev/tty | xargs -I '{}' cp '{}' "$HOME/.config/kitty/colors.conf"
end
