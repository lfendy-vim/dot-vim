set t_Co=256
"let g:solarized_termcolors=256
"colorscheme solarized
set background=dark
colorscheme anotherdark
syntax on

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
nnoremap <silent><S-D-Up> :wincmd k<cr>
nnoremap <silent><S-D-Down> :wincmd j<cr>
nnoremap <silent><S-D-Left> :wincmd h<cr>
nnoremap <silent><S-D-Right> :wincmd l<cr>
let g:unite_source_history_yank_file=$HOME.'/.vim/yankring.txt'
let g:unite_source_history_yank_enable=1
nnoremap <silent><leader>yy :Unite -buffer-name=yank history/yank<cr>
nnoremap <silent><leader>ff :Unite -start-insert file_rec<cr>
nnoremap <silent><leader>be :Unite -start-insert buffer<cr>
nnoremap <silent><leader>tt :!ctags -R --exclude=.git --exclude=log *<cr>
nnoremap ,, :wa<cr> :Unite -start-insert file_rec<cr>
nnoremap <leader>aw :Ack '<C-r><C-w>'<CR>
set backspace=indent,eol,start

"Javascript
let g:javascript_conceal=0
set conceallevel=0

"Ack grep using the silver searcher
"let g:ackprg = 'ag --nogroup --nocolor --column'

"Unite config
 call unite#custom_source(
         \ 'file_rec', 'matchers', ['matcher_fuzzy'])

let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
let g:unite_source_grep_recursive_opt = ''

"run test
nnoremap <silent><leader>vc :VimuxClose<cr>
nnoremap <silent><leader>vf :wa<cr> :call VimuxRunCommand("ccc && be rspec " . bufname("%"))<cr>
nnoremap <silent><leader>vt :wa<cr> :call VimuxRunCommand("ccc && be rspec " . bufname("%") . ":" . line("."))<cr>
nnoremap <silent><leader>va :wa<cr> :call VimuxRunCommand("ccc && be rspec ")<cr>
"nnoremap <silent><leader>rt :!be rspec %


command! Tidy execute "0,$! tidy -i -xml -q"

let g:VimuxHeight=40
