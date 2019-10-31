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

map <f5> :w \| :call system("tmux resize-pane -t1 -y20 && tmux send -t1 !! c-j")<cr>
imap <f5> <esc> <f5>
map <f6> :w \| :call system("tmux resize-pane -t0 -Z")<cr>
imap <f6> <esc> <f6>
map <f7> :w \| :call system("tmux resize-pane -t1 -y40")<cr>
imap <f7> <esc> <f7>

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
