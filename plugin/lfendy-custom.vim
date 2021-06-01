if has('termguicolors')
  set termguicolors
endif

set t_Co=256
set background=dark
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material
syntax on

let g:VimTodoListsKeepSameIndent = 0

set hlsearch
set nocompatible
set number
set showmatch
set incsearch
set ignorecase
set smartcase
set scrolloff=2
set wrap
set ruler
set directory=/tmp
set laststatus=2
set cursorline
set expandtab
set sw=2
set tabstop=2
set softtabstop=2
set undodir=~/.vim/undo
set undofile

set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " buffer number, and flags
set statusline+=%f\                    	  " relative path
set statusline+=%=                        " seperate between right- and left-aligned
set statusline+=%1*%y%*%*\                " file type
set statusline+=%10(L(%l/%L)%)\           " line
set statusline+=%2(C(%v/125)%)\           " column
set statusline+=%P                        " percentage of file
set statusline+=%#warningmsg#
set statusline+=%*


"Pimping colors
hi User1 gui=NONE ctermfg=White        ctermbg=DarkGray  guifg=#a7dfff guibg=#333333 " File name
hi User2 gui=NONE ctermfg=LightRed     ctermbg=DarkGray  guifg=#ff9999 guibg=#333333 " File Flag
hi User3 gui=NONE ctermfg=White        ctermbg=DarkGray  guifg=#ffffff guibg=#333333 " File type
hi User4 gui=NONE ctermfg=Green        ctermbg=DarkGray  guifg=#90ff90 guibg=#333333 " Fugitive
hi User5 gui=NONE ctermfg=LightYellow  ctermbg=DarkGray  guifg=#ffffa0 guibg=#333333 " RVM
hi User6 gui=NONE ctermfg=White        ctermbg=DarkRed   guifg=#ffffff guibg=#af0000 " Syntax Errors
hi User7 gui=NONE ctermfg=White        ctermbg=Yellow    guifg=#ffff00 guibg=#333333
hi User8 gui=NONE ctermfg=Magenta      ctermbg=DarkGray  guifg=#99a0f9 guibg=#333333 " Position


"Show trailing Whitespaces
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

""Highlight too-long lines
"autocmd BufRead,InsertEnter,InsertLeave * 2match LineLengthError /\%126v.*/
"highlight LineLengthError ctermbg=red guibg=red
"autocmd ColorScheme * highlight LineLengthError ctermbg=black guibg=black

map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>
map <silent> <LocalLeader>gu :GundoToggle<CR>

nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR><C-o>
nnoremap <leader>ss :source ~/.vim/plugin/lfendy-custom.vim<cr>
nnoremap <leader>ee :tabe ~/.vim/plugin/lfendy-custom.vim<cr>
nnoremap <leader>bb :tabe $MYVIMRC<cr>
nnoremap <silent> <LocalLeader><space> :noh<CR>
nnoremap <F1> <ESC>
inoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap ; :
nnoremap <silent> <LocalLeader><cr> :tabe<cr>
nnoremap <silent> <LocalLeader>[ :tabp<cr>
nnoremap <silent> <LocalLeader>] :tabn<cr>
nnoremap <silent> <LocalLeader>p :tabn<cr>
nnoremap <silent> <LocalLeader>o :tabp<cr>
nnoremap <silent><S-D-Up> :wincmd k<cr>
nnoremap <silent><S-D-Down> :wincmd j<cr>
nnoremap <silent><S-D-Left> :wincmd h<cr>
nnoremap <silent><S-D-Right> :wincmd l<cr>
nnoremap <silent><leader>ff :CtrlP<cr>
" nnoremap <silent><leader>tt :!ctags -R --exclude=node_modules --exclude=.git --exclude=log *<cr>
nnoremap <silent><leader>tt "=strftime("%F")<CR>PyypVr-
nnoremap <silent><leader>ds :DiffSaved<cr>
nnoremap ,, :wa<cr> :Unite -start-insert file_rec<cr>
nnoremap <leader>aw :Ack '<C-r><C-w>'<CR>
set backspace=indent,eol,start



"Javascript
let g:javascript_conceal=0
set conceallevel=0

"Ack grep using the silver searcher
let g:ackprg = 'ag --nogroup --nocolor --column'

"run test
nnoremap <silent><leader>vc :VimuxClose<cr>
nnoremap <silent><leader>vf :wa<cr> :call VimuxRunCommand("ccc && be rspec " . bufname("%"))<cr>
nnoremap <silent><leader>vt :wa<cr> :call VimuxRunCommand("ccc && be rspec " . bufname("%") . ":" . line("."))<cr>
nnoremap <silent><leader>va :wa<cr> :call VimuxRunCommand("ccc && be rspec ")<cr>
"nnoremap <silent><leader>tt :wa<cr> :call VimuxRunCommand("clear && tmux clear-history && ./run.sh ")<cr>
"nnoremap <silent><leader>rt :!be rspec %


command! Tidy execute "0,$! tidy -i -xml -q"


let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 1000
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules|\.git|\.hg|\.svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:NERDTreeDirArrows=0
let g:VimuxHeight=40


function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

set autoread
au CursorHold,CursorHoldI * :checktime
au FocusGained,BufEnter * :checktime
