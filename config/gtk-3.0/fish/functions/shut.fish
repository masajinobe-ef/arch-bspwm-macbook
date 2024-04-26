function shut --wraps='sudo shutdown now' --description 'alias shut=sudo shutdown now'
  sudo shutdown now $argv
        
end
