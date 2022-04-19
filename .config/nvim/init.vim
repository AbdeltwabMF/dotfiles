""""""""""""""""""""""""""""""""""""""""""
"
"  ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"  ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"  ██║   ██║██║██╔████╔██║██████╔╝██║
"  ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"   ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"    ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
""""""""""""""""""""""""""""""""""""""""""

let mapleader =","

set nocompatible              " be iMproved, required
filetype off                  " required

if filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/bundle/Vundle.vim"'))
	echo "Downloading Vundle.vim to manage plugins..."
	silent !mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/bundle/"
	silent !git clone "https://github.com/VundleVim/Vundle.vim" "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/bundle/Vundle.vim"
	autocmd VimEnter * PluginInstall
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugins"'))

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Use release branch (recommend) `git checkout release` inside of coc.nvim dir
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'junegunn/goyo.vim'
Plugin 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plugin 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plugin 'junegunn/seoul256.vim'
Plugin 'mcchrish/nnn.vim'
Plugin 'kkoomen/vim-doge'
Plugin 'davidbeckingsale/writegood.vim'
Plugin 'glepnir/dashboard-nvim'
Plugin 'ap/vim-css-color'
Plugin 'preservim/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'preservim/vimux'
Plugin 'tpope/vim-surround'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'jreybert/vimagit'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-commentary'
Plugin 'junegunn/fzf.vim'
Plugin 'github/copilot.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'mxw/vim-jsx'
Plugin 'kana/vim-operator-user'
Plugin 'rhysd/vim-clang-format'
Plugin 'dense-analysis/ale'
Plugin 'mattn/emmet-vim'
Plugin 'tomlion/vim-solidity'
Plugin 'tpope/vim-haml'
" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plugin 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim'
Plugin 'sindrets/diffview.nvim'
Plugin 'vim-test/vim-test'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plugin 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json',
	\ 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html', 'solidity',
	\ 'ruby', 'python'] }

" All of your Plugins must be added before the following line
call vundle#end()            " required

" filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Some basics:
set title
" set bg=light
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus
set noshowmode
set noruler
set laststatus=0
set noshowcmd
" tabstop		-> Indentation width in spaces
" shiftwidth	-> Autoindentation width in spaces
" expandtab		-> Use actual spaces instead of tabs
set tabstop=2
set shiftwidth=2
set encoding=utf-8
set number relativenumber
" Enable autocompletion:
set wildmode=longest,list,full
nnoremap c "_c
syntax on

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Perform dot commands over visual blocks:
vnoremap . :normal .<CR>
" Goyo plugin makes text more readable when writing prose:
map <leader>f :Goyo \| set bg=light \| set linebreak<CR>
" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=en_us<CR>
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Replace ex mode with gq
map Q gq

" Fix visual mode selection after < and >
vmap < <gv
vmap > >gv

" Check file in shellcheck:
map <leader>s :!clear && shellcheck -x %<CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Enable Goyo by default for mutt writing
autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufRead,BufNewFile xresources set filetype=xresources
autocmd BufWritePost xresources !xrdb %

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
	highlight! link DiffText MatchParen
endif

" Function for toggling the bottom statusbar:
let s:hidden_all=1

function! ToggleHiddenAll()
	if s:hidden_all  == 0
		let s:hidden_all=1
		set noshowmode
		set noruler
		set laststatus=0
		set noshowcmd
	else
		let s:hidden_all=0
		set showmode
		set ruler
		set laststatus=2
		set showcmd
	endif
endfunction

nnoremap <leader>h :call ToggleHiddenAll()<CR>

" NNN configuration
" Mapping
" Disable default mappings
let g:nnn#set_default_mappings = 0
" Start n³ in the current file's directory
nnoremap <leader>n :NnnPicker %:p:h<CR>
" Set custom mappings
nnoremap <silent> <leader>m :NnnPicker<CR>

" Layout
" Opens the n³ window in a split
" let g:nnn#layout = 'vnew' " or vnew, tabnew etc.
" Or pass a dictionary with window size
" let g:nnn#layout = { 'left': '~40%' } " or right, up, down
" Floating window.
let g:nnn#layout = { 'window': { 'width': 0.8, 'height': 0.7, 'highlight': 'Debug' } }

" Abbreviations
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev X! x!

" vimwiki configuration
let g:vimwiki_list = [{'path': '~/vault/dox/vimwiki', 'path_html': '~/vault/dox/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]

" React refactor shortcut
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" make a vertical column in the background at 80 characters
set colorcolumn=80

" make it black in Graphical Vims (my vim background is dark gray)
" see help gui-colors for a list of suggseted color names
" see help guibg for how to specific specific rgb / hex colors
highlight ColorColumn guibg=#E19D00

" make it black in terminal vims (my terminal vim looks the same as my GUI vim)
" see :help ctermbg for a list of colors that can be used in the terminal
highlight ColorColumn ctermbg=12

" enable soft wrapping at the edge of the screen
" make it not wrap in the middle of a word
set wrap linebreak nolist

" Prettier setup
" Max line length that prettier will wrap on: a number or 'auto' (use
" textwidth).
" default: 'auto'
let g:prettier#config#print_width = 'auto'

" number of spaces per indentation level: a number or 'auto' (use
" softtabstop)
" default: 'auto'
let g:prettier#config#tab_width = '2'

" use tabs instead of spaces: true, false, or auto (use the expandtab setting).
" default: 'auto'
let g:prettier#config#use_tabs = 'auto'

" flow|babylon|typescript|css|less|scss|json|graphql|markdown or empty string
" (let prettier choose).
" default: ''
let g:prettier#config#parser = ''

" cli-override|file-override|prefer-file
" default: 'file-override'
let g:prettier#config#config_precedence = 'file-override'

" always|never|preserve
" default: 'preserve'
let g:prettier#config#prose_wrap = 'preserve'

" css|strict|ignore
" default: 'css'
let g:prettier#config#html_whitespace_sensitivity = 'css'

" false|true
" default: 'false'
let g:prettier#config#require_pragma = 'false'

" Define the flavor of line endings
" lf|crlf|cr|all
" defaut: 'lf'
let g:prettier#config#end_of_line = get(g:, 'prettier#config#end_of_line', 'lf')

" Emmet setup
let g:user_emmet_leader_key=","
" only enable normal mode functions.
let g:user_emmet_mode="n"
let g:user_emmet_next_key = '<leader>1'
let g:user_emmet_prev_key = '<leader>2'


" Vim Test Setup
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" Standard Setup
let g:ale_linters = {
\   'javascript': ['standard'],
\}
let g:ale_fixers = {'javascript': ['standard']}
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

" LaTeX Live Previewer
nmap <leader>i :LLPStartPreview<CR>
let g:livepreview_previewer = 'zathura'
let g:livepreview_engine = 'lualatex' . ' [options]'

" Development
" Java setup
autocmd FileType java setlocal omnifunc=javacomplete#Complete
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
nmap <F5> <Plug>(JavaComplete-Imports-Add)
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
" let g:seoul256_background = 235
" colo seoul256

" Dashboard
let g:dashboard_default_executive ='fzf'
let g:dashboard_custom_shortcut={
\ 'last_session'       : ', s l',
\ 'find_history'       : ', f h',
\ 'find_file'          : ', f f',
\ 'new_file'           : ', c n',
\ 'change_colorscheme' : ', t c',
\ 'find_word'          : ', f a',
\ 'book_marks'         : ', f b',
\ }

nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
