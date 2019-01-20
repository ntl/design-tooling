complete_ssh() 
{
  local cur prev opts
  
  COMPREPLY=()

  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  opts=$(grep '^Host' ~/.ssh/config 2>/dev/null | grep -v '[?*]' | cut -d ' ' -f 2-)

  COMPREPLY=( $(compgen -W "$opts" -- ${cur}) )

  return 0
}
complete -F complete_ssh ssh
