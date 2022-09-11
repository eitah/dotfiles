# Dotfiles for eitah

This is an attempt at minimalist dotfiles without using a template.

Usually clutter creeps in but this is my attempt to forestall that for as long as I can.

1) Run the Strapfile to get some base machine stuff setup, eg homebrew
./strap/bin/strap.sh

2) Install shiftit, currently via hammerspoon (https://github.com/fikovnik/ShiftIt/#alternatives)

3) Make sure your brewfile has the right software configured then trigger the brewfile via:

```bash
cd ~/dotfiles/brew # or wherever your Brewfile is
brew bundle
```

Happy coding!
