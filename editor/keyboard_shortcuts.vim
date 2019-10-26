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

map <F1> 1gt
map <F2> 2gt
map <F3> 3gt
map <F4> 4gt

map <F5> :w \| :call system("tilix --action=session-add-down --profile=RunCommand --command 'ruby --disable-gems test/automated.rb'")<cr>

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
