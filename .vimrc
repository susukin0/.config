" Startup Settings
	filetype plugin on
	syntax on
	let mapleader=" "
	let maplocalleader=" "
	set title
	set background=dark
	set go=a
	set mouse=a
	set nohlsearch
	set clipboard+=unnamedplus
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4
	set fileformat=unix
	set splitbelow splitright
	set wrap
	set noerrorbells
	set smarttab
	set smartindent
	set smartcase
	set autoindent
	set nofoldenable
	set noswapfile
	set nobackup
	set incsearch
	set history=25
	set nocompatible
	set number relativenumber
	set encoding=utf-8
	set wildmenu
	set wildmode=longest,list,full
	set wildchar=<Tab>
	set laststatus=2
	set scrolloff=8
	set showcmd
	set showmode
	set ttyfast
	set lazyredraw
	set nomodeline
	set secure
	set ffs=unix,dos,mac
	set completeopt=longest,menuone
	set complete-=i
	set spelllang=en_us,en_gb
	set esckeys
	set ruler
	set autoread
	set shortmess+=c
	set ttyfast
	set showmatch
	set noshiftround
	set nostartofline
	set nolist
	set backspace=indent,eol,start

	if !has('gui_running')
	  set t_Co=256
	endif

" Center cursor when entering insert mode
	autocmd InsertEnter * norm zz

" Show the complete menu when switching to insert mode or pressing space key
	autocmd InsertEnter * :call feedkeys("\<C-p>")
	inoremap <expr> <Space> pumvisible() ? "\<Space><C-e>\<Space>" : "\<Space><C-p>"

" Navigate the complete menu items like CTRL+n / CTRL+p would
	inoremap <expr> <Down> pumvisible() ? "<C-n>" : "<Down>"
	inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"

" Select the complete menu item like CTRL+y would
	inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"
	inoremap <expr> <CR> pumvisible() ? "<C-y>" : "<CR>"
	inoremap <expr> <Tab> pumvisible() ? "<C-y>" : "<Tab>"

" Cancel the complete menu item like CTRL+e would
	inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"

" Set CTRL-Delete or ALT-Delete act as delete words forwards
	inoremap <C-Delete> <C-o>diw
	inoremap <M-Delete> <C-o>diw
" Set CTRL-Backspace or ALT-Backspace act as delete words backwards
	inoremap <C-Backspace> <C-w>
	inoremap <M-Backspace> <C-w>

" Undo/Redo are aliased to CTRL+z
	inoremap <C-z> <Esc>Ui

" Map CTRL+c in visual mode to copy to clipboard
	vnoremap <C-c> y:call system('xclip -selection clipboard', @")<CR>
" Map CTRL+v in insert mode to paste from clipboard
	inoremap <C-v> <C-r>=system("xclip -selection clipboard -o")<CR>

" Map ALT+Enter in normal mode to open new split window vertically
	nnoremap <M-Enter> :vsplit .<Enter>
" Map ALT+Backspace in normal mode to open new split window horizontally
	nnoremap <M-Backspace> :split .<Enter>
" Map navigations
	nnoremap <M-Left> <C-w>h
	nnoremap <M-Right> <C-w>l
	nnoremap <M-Up> <C-w>k
	nnoremap <M-Down> <C-w>j
	nnoremap <M-A> :bp<Enter>
	nnoremap <M-D> :bn<Enter>
	nnoremap <M-1> :bfirst<Enter>
	nnoremap <M-3> :blast<Enter>

" Map CTRL+t in normal mode to bring terminal
	nnoremap <C-t> :term<Enter>
" Map CTRL+e in normal mode to explore working directory
	nnoremap <C-e> :e .<Enter>
" Map CTRL+d in normal mode to change working directory
	nnoremap <C-d> :lcd<Space>

" Map CTRL+s in normal mode to write file
	nnoremap <C-s> :w<Enter>
" Map CTRL+q in normal mode to quit file
	nnoremap <C-q> :q<Enter>
	nnoremap <C-z> :q<Enter>
	nnoremap <C-x> :q<Enter>
" Map CTRL+c in normal mode to force quit file
	nnoremap <C-c> :q!<Enter>

" Map CTRL+F in normal mode to find in files
	nnoremap <C-F> :vimgrep //g **/*<Left><Left><Left><Left><Left><Left><Left>
" Map CTRL+n and CTRL+p in normal mode to navigate in files
	nnoremap <C-n> :cn<Enter>
	nnoremap <C-p> :cp<Enter>
" Map R in normal mode to replace in files
	nnoremap R :cfdo %s///gc \| update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" Map ALT+r in normal mode to replace all
	nnoremap <M-r> :%s///gc<Left><Left><Left><Left>

" Map CTRL+Backspace to go to top
	noremap <C-Backspace> GVgg
" Map CTRL+a to go to bottom
	noremap <C-a> ggVG

" More navigation mappings
	noremap , *
	noremap ; #
	noremap <C-Up> 5k
	noremap <C-Down> 5j
	noremap <C-Left> b
	noremap <C-Right> w
	noremap <M-a> ^
	noremap <M-d> $
	vnoremap <M-Up> <C-b>
	vnoremap <M-Down> <C-f>

" Status Line
	function! BufferList()
	  let buf_list = []
	  for i in range(1, bufnr('$'))
		if buflisted(i)
		  let buf_name = bufname(i) != '' ? fnamemodify(bufname(i), ':t') : '[No Name]'
		  let buf_list += [buf_name]
		endif
	  endfor
	  return join(buf_list, ' ')
	endfunction

	set statusline=%m\ %{getcwd()}/\%{BufferList()}\ %=\ %{&filetype}\ [%{&fileencoding}]\ L%l\/%L\,C%c%V\ %{strftime('[%H:%M]')}

" Automatically set/unset Vim's paste mode when you paste
	let &t_SI .= "\<Esc>[?2004h"
	let &t_EI .= "\<Esc>[?2004l"

	inoremap <special> <expr> <Esc>[200~ AutoPaste()

	function! AutoPaste()
	  set pastetoggle=<Esc>[201~
	  set paste
	  return ""
	endfunction

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable
	if &diff
	  highlight! link DiffText MatchParen
	endif

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically deletes all trailing whitespace and newlines at end of file on save & reset cursor position
 	autocmd BufWritePre * let currPos = getpos(".")
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\+\%$//e
  	autocmd BufWritePre *.[ch] %s/\%$/\r/e " add trailing newline for ANSI C standard
  	autocmd BufWritePre * cal cursor(currPos[1], currPos[2])

" When shortcut files are updated, renew bash and ranger configs with new material:
  	autocmd BufWritePost bm-files,bm-dirs !shortcuts

" Save file as sudo on files that require root permission
	cabbrev w! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
