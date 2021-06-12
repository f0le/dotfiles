" vim-plug, vim plugin manager
" Plugins will be downloaded under the specified directory.
call plug#begin('/home/trustno1/.vim/plugged')

" Declare the list of plugins.
" sane defaults
Plug 'tpope/vim-sensible'

" fuzzy search
Plug 'junegunn/fzf'

" directory tree in left pane
Plug 'preservim/nerdtree'

" show git status flags in nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'

" nerdtree syntax highlight
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" syntax highlighting 
Plug 'sheerun/vim-polyglot'

" coc plugin, completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" highlighter, good for webdev, needs truecolor support, different terminal
Plug 'norcalli/nvim-colorizer.lua'

" vim lightline
Plug 'itchyny/lightline.vim'

" git integration for lightline
Plug 'tpope/vim-fugitive'

" nerdtree icons
Plug 'ryanoasis/vim-devicons'


" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" activate nvim-colorizer.lua , doenst work with 256 color term only with
" truecolor
" lua require'colorizer'.setup()

" Nerdtree config
" Open Nerdtree with Control-n
nnoremap <C-n> :NERDTreeToggle<CR>

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Start NERDTree on vim startup and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" disable the default arrows for folders
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" lightline config
" Disable showing of Mode at the bottom, it is shown in statusline
set noshowmode

" colorscheme and configuration of statusline
" charvaluehex shows the character under the cursor in hex
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' , 'charvaluehex' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
" alternative colroschemes 'one light' 'ayu_light' 'nord'

" Old vim config below
" When started as evim, evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

"fix colorscheme inside tmux and screen
if &term =~ 'tmux-256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab                           " Converts tabs to spaces
"set nowrap                              " Display long lines as just one line
set wrap                              " Display long lines as two or more lines
set pumheight=10                        " Makes popup menu smaller
set ruler              			            " Show the cursor position all the time
"set cmdheight=2                         " More space for displaying messages
set conceallevel=0                      " So that I can see `` in markdown files
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set clipboard=unnamedplus               " Copy paste between vim and everything else

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"Personal config
set backupdir=~/.vim/backup
set wrapscan

"show line numbers
set number

"search options
set incsearch ignorecase smartcase hlsearch

set runtimepath^=~/.vim/redact_pass/redact_pass.vim
