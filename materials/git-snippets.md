# Git Snippets

## Try to apply the changes of a particular commit to every tree

```
git fb -f --tree-filter '(git show SOME_REF | git apply --check 2>/dev/null) && (git show SOME_REF | git apply) || true'
```

## Split a diff into individual patch files

```
splitdiff -a ~/Projects/stage/some_patch.diff
```

(Produces ~/Projects/stage/some_patch.diff.part001.patch

## Try to apply a diff split into individual patches to every tree

```
git fb --force --tree-filter "ls /path/to/some_patch.diff.part* | xargs -I {} sh -c 'git apply --3way --check {} 2>/dev/null && git apply --3way {} || true'"
```
