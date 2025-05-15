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

OK the above is a good start but I ultimately also solved by updating my
~/.ssh/config per the below

```
Host elipi.local
  HostName elipi.local

Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519
  IdentitiesOnly yes
  UseKeychain yes
  AddKeysToAgent yes

  # Github for GATX Org
  Host github.com-gatx
    HostName github.com
    User git
    IdentityFile ~/.ssh/Eli-Itha_GATX
    IdentitiesOnly yes
    UseKeychain yes
    AddKeysToAgent yes
```

I don't really understand what all the options do, but it works so long as when
you clone the repos you use the below (notice the `-gatx`)

```sh
git clone git@github.com-gatx:GATX-Corp/...
```
