filetype plugin indent on
syntax on

set nocompatible

colorscheme torte

let mapleader = " "

" Appearance
set title
" set laststatus=2
" set statusline=
" set statusline+=%<%f\ %h%w%m%r%=
" set statusline+=\ %{&ff}
" set statusline+=\ %{&fileencoding}
" set statusline+=%14.(%l:%c%V%)
" set statusline+=\ %P

" Utils
set ruler
set showcmd
set wildmenu

" Line numbers
set number
set relativenumber
set numberwidth=4

" Tabs and indentation
set autoindent
set expandtab
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Search
set ignorecase
set smartcase
set incsearch
set hlsearch

" Scroll off
set scrolloff=4
set sidescrolloff=8

" Line wrap
set nowrap
set breakindent
set formatoptions=l
set lbr

" Key code timeout and tty speed
set ttimeout
set ttimeoutlen=100
set ttyfast

" Disable swap files and backups
set noswapfile
set nobackup
set nowritebackup

" Spellcheck
set nospell
set spelllang=en_us

" Paste in visual mode without overwriting the yank register
vnoremap p "_dP

" Disable single 'q' recording, use 'qq' instead
nnoremap q <Nop>
nnoremap qq q

" Clear trailing white space on write
autocmd BufWritePre * %s/\s\+$//e

" Buffer navigation keymaps
noremap gb :bn<CR>
noremap gB :bp<CR>
autocmd filetype netrw nmap <buffer> gb :bn<CR>
autocmd filetype netrw nmap <buffer> gB :bp<CR>
nnoremap <Leader>b :ls<CR>:b<Space>

" Toggle line numbers
noremap <leader>r :set relativenumber!<CR>
noremap <leader>R :set relativenumber! number!<CR>

" Netrw
let g:netrw_banner=0
let g:netrw_bufsettings='number relativenumber'
let g:netrw_liststyle=1
autocmd FileType netrw setlocal nocursorline

" -----------------------------
" f = preview (quickfix only)
" v = open (load into buffers)
" -----------------------------

" Preview grep (fz)
" function! s:PreviewGrep(pattern)
"     if empty(a:pattern)
"         return
"     endif
"     let l:results = systemlist('grep -RInH --color=always "' . a:pattern . '" . 2>/dev/null')
"     if empty(l:results)
"         echo "No matches"
"         return
"     endif
"     for line in l:results
"         echom line
"     endfor
" endfunction

function! s:PreviewGrep(pattern)
    if empty(a:pattern)
        return
    endif
    let l:cmd = 'grep -RIn --color=always "' . a:pattern . '" . | less -R'
    execute 'terminal ' . l:cmd
    autocmd TermClose <buffer> bd!
endfunction

:command! -nargs=1 PreviewGrep call s:PreviewGrep(<q-args>)

" " Preview find (ff)
" nnoremap <leader>ff :call s:PreviewFind()<CR>
" function! s:PreviewFind()
"     let l:pattern = input('Find pattern (glob): ')
"     if empty(l:pattern)
"         return
"     endif
"     " run find and populate quickfix
"     let l:files = split(system('find -L . -type f -path "' . l:pattern . '" 2>/dev/null'), "\n")
"     if empty(l:files)
"         echo "No matches"
"         return
"     endif
"     let qf_items = map(l:files, '{ "filename": v:val }')
"     call setqflist(qf_items, 'r', {'title': 'Find results'})
"     copen
" endfunction
"
" " Open grep matches (vz)
" nnoremap <leader>vz :call s:OpenGrep()<CR>
" function! s:OpenGrep()
"     let l:pattern = input('Grep pattern: ')
"     if empty(l:pattern)
"         return
"     endif
"     " load matching files into arglist
"     let l:files = split(system('grep -rl "' . l:pattern . '" . 2>/dev/null'), "\n")
"     if empty(l:files)
"         echo "No matches"
"         return
"     endif
"     execute 'args ' . join(l:files, ' ')
"     " open first file (optional, can remove if you just want arglist)
"     argdo edit
" endfunction
"
" " Open find matches (vf)
" nnoremap <leader>vf :call s:OpenFind()<CR>
" function! s:OpenFind()
"     let l:pattern = input('Find pattern (glob): ')
"     if empty(l:pattern)
"         return
"     endif
"     let l:files = split(system('find -L . -type f -path "' . l:pattern . '" 2>/dev/null'), "\n")
"     if empty(l:files)
"         echo "No matches"
"         return
"     endif
"     execute 'args ' . join(l:files, ' ')
"     argdo edit
" endfunction
