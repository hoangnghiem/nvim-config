map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

let g:rspec_command = 'call Send_to_Tmux("spring rspec {spec}\n")'
