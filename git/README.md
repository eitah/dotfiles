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
```

`gitconfig` itself selects the right identity automatically based on the repo's
remote URL (Git 2.36+). Any repo with a Bitbucket (cnvrmedia / Epsilon) remote
uses the epsilon identity; everything else falls back to the default
(GitHub / `eitah`):

```ini
# in gitconfig
[includeIf "hasconfig:remote.*.url:ssh://git@git.cnvrmedia.net:7999/**"]
path = ~/dotfiles/git/gitconfig-epsilon
```

The epsilon SSH key is selected via `~/.ssh/config`:

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

# Epsilon / Publicis Bitbucket Server
Host git.cnvrmedia.net
  AddKeysToAgent yes
  IdentityFile ~/.ssh/ei-epsilon-ssh
```

Because identity follows the remote, you can clone epsilon repos normally
(`git clone ssh://git@git.cnvrmedia.net:7999/...`) with no special host alias.
