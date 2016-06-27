set tabstop=2
set shiftwidth=2
set autoindent
set expandtab
set incsearch
set hlsearch
set colorcolumn=80

let g:linewidth = 80

function! COMLINE(row, col)
  let l:str = ""
  let l:col = 0

  call cursor(a:row, 1)
  execute "normal! D"

  while l:col < a:col
    let l:str = l:str . " "
    let l:col = l:col + 1
  endwhile

  let l:str = l:str . "/"

  while l:col < g:linewidth - 3
    let l:str = l:str . "*"
    let l:col = l:col + 1
  endwhile

  let l:str = l:str . "/"
  s/$/\=l:str/
  s/$/\r/
endfunction

function! COMBODY(row, col)
  let l:str = ""
  let l:col = 0

  call cursor(a:row, 1)
  execute "normal! D"

  while l:col < a:col
    let l:str = l:str . " "
    let l:col = l:col + 1
  endwhile

  let l:str = l:str . "/*   */"
  s/$/\=l:str/
  s/$/\r/
endfunction

function! COM()
  let l:row = getpos('.')[1]
  let l:col = getpos('.')[2]
  call COMLINE(getpos('.')[1], l:col)
  call COMBODY(getpos('.')[1], l:col)
  call COMLINE(getpos('.')[1], l:col)
  call cursor(l:row + 1, l:col + 4)
  execute "normal! A"

endfunction

nmap <silent> <C-c> :call COM()<cr>
imap <C-c> <esc><C-c>
