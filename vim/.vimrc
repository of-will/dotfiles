syntax on
color monokai

set laststatus=2

autocmd InsertLeave * set cursorline!
autocmd InsertEnter * set cursorline

set autoindent

map <Enter> O<ESC>
map <Space> i<Space><ESC>

nnoremap <S-z><S-w> :w<ENTER>
nnoremap <leader>q :q<ENTER>
nnoremap <leader>x :x<ENTER>
nnoremap <leader>w :w<ENTER>
nnoremap <leader>e :ex .<ENTER>

set mouse=i
nnoremap <leader>m :set mouse=a<ENTER>
nnoremap <leader>n :set mouse=<ENTER>

nnoremap <leader>3 :set nu!<ENTER>

nnoremap <leader>/ :noh<ENTER>
set incsearch

" insert datetime now
nnoremap <leader>; :r!date<ENTER>

" source ~/.vimrc
autocmd BufRead,BufNewFile *.vimrc nnoremap <leader>] :w<ENTER>:so ~/.vimrc<ENTER>

" html
autocmd BufRead,BufNewFile *.html set tabstop=8 expandtab shiftwidth=2 softtabstop=2

" sql
autocmd BufRead,BufNewFile *.sql set tabstop=8 expandtab shiftwidth=4 softtabstop=4

" python
autocmd BufRead,BufNewFile *.py set tabstop=8 expandtab shiftwidth=4 softtabstop=4

" bash
autocmd BufRead,BufNewFile *.sh nnoremap <leader>] :w<ENTER>:!clear && ./%<ENTER>

" bashrc
autocmd BufRead,BufNewFile .bashrc nnoremap <leader>] :w<ENTER>:!clear && source ~/.bashrc<ENTER>

" make
autocmd FileType make setlocal noexpandtab

" nodejs
autocmd BufRead,BufNewFile *.js set expandtab shiftwidth=2 softtabstop=2

" text
autocmd BufNewFile,BufFilePre,BufRead *.txt set filetype=markdown.pandoc
autocmd BufRead,BufNewFile *.txt set tabstop=8 expandtab shiftwidth=4 softtabstop=4

" commenting 
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> <leader>cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <leader>cx :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
