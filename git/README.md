# In the root of your filesystem include this a base git config

To confirm that it worked, check:

```sh
$ git config user.email
eli@spantree.net
```

The setting is:

```ini
[include]
path = ~/dotfiles/git/gitconfig
[includeIf "gitdir:~/gatx"]
path = ~/dotfiles/gitconfig-gatx
```
