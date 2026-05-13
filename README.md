# Dotfiles for eitah

This is an attempt at minimalist dotfiles without using a template.

Usually clutter creeps in but this is my attempt to forestall that for as long as I can.

## Glossary

* brew - contains brewfile which installs a bunch of stuff.
* zsh - contains arbitrary zsh settings including my current zsh system oh-my-zsh.
* asdf - contains tool versions file that I have to simlink and install plugins for all the things I use with it.

## Step-by-step stuff

1) Run the brewfile
```
 brew bundle --file=brew/Brewfile
 ```

2) Install shiftit, currently via hammerspoon (<https://github.com/fikovnik/ShiftIt/#alternatives>) Installing the plugin is here https://github.com/fikovnik/ShiftIt/wiki/The-Hammerspoon-Alternative

3) Make sure your brewfile has the right software configured then trigger the brewfile via:

```bash
cd ~/dotfiles/brew # or wherever your Brewfile is
brew bundle
```

4) Tweak iterm settings if not somehow inherited. Turn on natural presets. https://www.reddit.com/r/iterm/comments/1e0gsnk/getting_d_and_c_when_pressing_optionarrow_to_move/?rdt=39391

Happy coding!
