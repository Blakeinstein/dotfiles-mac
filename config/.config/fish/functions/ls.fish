function ls --wraps='exa -a --icons' --description 'alias ls=exa -a --icons'
  eza -a --icons $argv; 
end
