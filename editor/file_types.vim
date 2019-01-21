autocmd BufNewFile,BufRead COMMIT_EDITMSG set colorcolumn=50,72

autocmd BufNewFile,BufRead *.adoc,*.md,*.txt set linebreak
autocmd BufNewFile,BufRead *.adoc,*.md,*.txt set nonumber
autocmd BufNewFile,BufRead *.adoc,*.md,*.txt set wrap
autocmd BufNewFile,BufRead *.adoc,*.md,*.txt set spell

autocmd BufNewFile,BufRead Vagrantfile,Procfile,Guardfile,Gemfile,gemspec,*.gemspec set filetype=ruby
