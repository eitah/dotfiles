# In the root of your filesystem include this a base git config

[include]
path = ~/dotfiles/git/gitconfig.simlink
[includeIf "gitdir:~/gatx"]
path = ~/dotfiles/gitconfig-gatx
