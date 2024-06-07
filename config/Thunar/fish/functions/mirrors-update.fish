function mirrors-update --wraps='sudo reflector --verbose --sort rate -p https --save /etc/pacman.d/mirrorlist -l 50' --description 'alias mirrors-update=sudo reflector --verbose --sort rate -p https --save /etc/pacman.d/mirrorlist -l 50'
  sudo reflector --verbose --sort rate -p https --save /etc/pacman.d/mirrorlist -l 50 $argv
        
end
