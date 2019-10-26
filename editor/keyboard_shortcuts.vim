let mapleader=","

noremap <Esc>h :vertical resize -5<cr>
noremap <Esc>j :resize +5<cr>
noremap <Esc>k :resize -5<cr>
noremap <Esc>l :vertical resize +5<cr>

noremap te :tabe<cr>
noremap th :tabp<cr>
noremap tH :tabfirst<cr>
noremap tl :tabn<cr>
noremap tL :tablast<cr>

map t1 1gt
map t2 2gt
map t3 3gt
map t4 4gt
map t5 5gt
map t6 6gt
map t7 7gt
map t8 8gt
map t9 9gt

map <F1> t1
map <F2> t2
map <F3> t3
map <F4> t4

map <F5> :!! <cr>
map <F6> :!ruby --disable-gems --disable-did_you_mean --enable-frozen-string-literal test/automated.rb <cr>
map <C-r> :!ruby --disable-gems --disable-did_you_mean --enable-frozen-string-literal % <cr>

map <silent> <Up> gk
map <silent> <Down> gj
map <silent> <Left> h
map <silent> <Right> l
map <silent> <home> g<home>
map <silent> <End> g<End>

map <C-J> <C-W><C-J>
map <C-K> <C-W><C-K>
map <C-L> <C-W><C-L>
map <C-H> <C-W><C-H>

map <Leader>t :NERDTreeToggle<cr>

command! -nargs=* -bar -complete=file TabnewLeft :execute (tabpagenr()-1).'tabnew '.<q-args>
ca tabel TabnewLeft
