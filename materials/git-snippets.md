# Git Snippets

## Try to apply a particular patch to every tree

```
git fb -f --tree-filter '(git show SOME_REF | git apply --check 2>/dev/null) && (git show SOME_REF | git apply) || true'
```
