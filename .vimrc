" Startup Settings
	syntax on
    let mapleader=" "
  set title
  set go=a
  set mouse=a
  set nohlsearch
  set clipboard=unnamedplus
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
	set fileformat=unix
	set splitbelow splitright
  set noerrorbells
	set tabstop=2 softtabstop=2
	set shiftwidth=2
	set expandtab
	set smartindent
    set nofoldenable
	set nowrap
	set smartcase
	set noswapfile
	set nobackup
	set incsearch
	set history=25
	set nocompatible
	set number relativenumber
    set background=dark
    set termguicolors
	filetype plugin on
	set encoding=utf-8
	set wildmenu
	set wildmode=longest,list,full
	set laststatus=2
	if !has('gui_running')
	  set t_Co=256
	endif
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
	set spell spelllang=en_gb
" Key Maps
	map <C-o> :NERDTreeToggle<CR>
	map <C-\> :Goyo<CR>
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
	vnoremap <C-c> "+y
 	map <C-p> "+P
 	nnoremap c "_c
	nnoremap <silent> <C-t> :tabnew<CR>
	map <S-Insert> <C-i>
	inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
	vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
	map <leader><leader> <Esc>/<++><Enter>"_c4l
	nnoremap <F5> :UndotreeToggle<CR> :UndotreeFocus<CR>
    nnoremap <Leader>i :w !ix<CR>
" Persistent_undo
	set undodir=~/.vim/undodir"
	set undofile
	let g:undotree_WindowLayout = 2
" Tab edit keybinds
    nnoremap <Leader>1 1gt<CR>
    nnoremap <Leader>2 2gt<CR>
    nnoremap <Leader>3 3gt<CR>
    nnoremap <Leader>4 4gt<CR>
    nnoremap <Leader>5 5gt<CR>
" Replace all is aliased to S.
    nnoremap S :%s//g<Left><Left>
" Markdown Edits
    let g:vim_markdown_autowrite = 1
    let g:vim_markdown_no_extensions_in_markdown = 1
    let g:vim_markdown_conceal = 0
    let g:vim_markdown_override_foldtext = 0
    let g:vim_markdown_folding_disabled = 1
" Automatically deletes all trailing whitespace on save.
      autocmd BufWritePre * %s/\s\+$//e
    	autocmd BufWritePre * %s/\n\+\%$//e
    	autocmd BufWritePre *.[ch] %s/\%$/\r/e
" When shortcut files are updated, renew bash and ranger configs with new material:
      autocmd BufWritePost bm-files,bm-dirs !shortcuts
