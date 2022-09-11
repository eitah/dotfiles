# Dotfiles for eitah

This is an attempt at minimalist dotfiles without using a template.

Usually clutter creeps in but this is my attempt to forestall that for as long as I can.

## Glossary

* brew - contains brewfile which installs a bunch of stuff.
* strap - contains strapfile binary in ./strap/bin/strap.sh which bootstraps some settings in macos.
* zsh - contains arbitrary zsh settings including my current zsh system oh-my-zsh.

## Step-by-step stuff

1) Run the Strapfile to get some base machine stuff setup, eg homebrew
./strap/bin/strap.sh

2) Install shiftit, currently via hammerspoon (https://github.com/fikovnik/ShiftIt/#alternatives)

3) Make sure your brewfile has the right software configured then trigger the brewfile via:

```bash
cd ~/dotfiles/brew # or wherever your Brewfile is
brew bundle
```

Happy coding!
