# In the root of your filesystem include this a base git config

```ini
[include]
path = ~/dotfiles/git/gitconfig
[includeIf "gitdir:~/gatx"]
path = ~/dotfiles/gitconfig-gatx
```
