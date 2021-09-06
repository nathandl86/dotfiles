# holman does dotfiles

Your dotfiles are how you personalize your system. These are mine.

I was a little tired of having long alias files and everything strewn about
(which is extremely common on other dotfiles projects, too). That led to this
project being much more topic-centric. I realized I could split a lot of things
up into the main areas I used, so I structured the project accordingly.

If you're interested in the philosophy behind why projects like these are
awesome, you might want to [read my post by holman on the
subject](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/).

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.

## what's inside

A lot of stuff. Seriously, a lot of stuff. Check them out in the file browser
above and see what components may mesh up with you.
[Fork it](https://github.com/holman/dotfiles/fork), remove what you don't
use, and build on what you do use.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **Brewfile**: This is a list of applications for [Homebrew Cask](http://caskroom.io) to install: things like Chrome and 1Password and Adium and stuff. Might want to edit this file before running any initial setup.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.

## install

Run this:

```sh
git clone https://github.com/nathandl86/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

`dot` is a simple script that installs some dependencies, sets sane OS X
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

You may find it necessary to run `dot` after running `script/bootstrap`

## submodules

There are a handful of submodules in config.symlink and vim.symlink that should be setup by the dot command
but if not, they can be initialized or updated by running `git submodule update --init --recursive`

If you encounter issues when running `dot`, you may need to run `git rm --cached -r vim.symlink/plugged`
to remove any staged changes for the plugins (the error i was getting resembled: "fatal:
no submodule mapping found in .gitmodules for path 'vim.symlink/plugged/YUNOcommit.vim'").

Some helpful links about git submodules:
* https://git-scm.com/book/en/v2/Git-Tools-Submodules
* https://chrisjean.com/git-submodules-adding-using-removing-and-updating/

## zsh

After running `script/bootstrap`, there were a couple steps necessary to setup zsh to be the default shell.

* Run `sudo nano /etc/shells` and make sure the zsh there matches what is returned when
running `which zsh`. You may need to add `/usr/local/bin/zsh` to the shells file
* Then run `chsh -s $(which zsh)` to set zsh to the shell.
* Restart iTerm and verify that the shell is now using zsh instead of bash
* Run `compaudit | xargs chmod g-w` to resolve insecure directory warnings

## vim

So much vim goodness in here it hurts.

#### before:
* [npm install instant-markdown-d](https://www.npmjs.com/package/instant-markdown-d)
* [patched powerline-fonts](https://github.com/powerline/fonts)
* brew install ctags-exuberant
* [base16-vim](https://github.com/chriskempson/base16-vim)
* [base16-shell](https://github.com/chriskempson/base16-shell)
** uses readlink --f option which isn't available in OSX, brew install coreutils, alias readlink='greadlink' for work around. If already using base16-shell, update to latest version and read new README.
* [vim-plug](https://github.com/junegunn/vim-plug)
* set terminals font to one of the installed powerline fonts (if you plan on using vim in the term) for both Font and Non-ASCII Font
* `pip install spotipy` or `easy_install spotipy` (for spotify plugin \o/)
* remove iterm2's border: Open Preferences, click the Profiles tab, select your profile, click Window and select No Title Bar from the Style dropdown menu
* iterm `base16_default-dark`

#### after:
* open vim -> run "PlugInstall" -> quit & re-open vim
* cd ~/.vim/plugged/tern_for_vim && npm install

## vscode

For vs code, install "Visual Studio Code Settings Sync" and use the command pallete to download the settings

## devpi

* ```
  devpi-init
  devpi-gen-config
  ```
* [follow the steps](https://devpi.net/docs/devpi/devpi/stable/+doc/quickstart-server.html#launchd-start-at-bootup-on-mac-os-x) for setup with `launchd` on MacOS
* depending upon where you generated the configs, you may want to remove them when it's setup

## troubleshooting

### bad mysql
I've had it occur where the mysql install is invalid and complains with either of the following:
  - `ERROR 2003 (HY000): Can't connect to MySQL server on '127.0.0.1' (61)`
  - `ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/tmp/mysql.sock' (2)`

When this has occurred, I've been able to [clean and reinstall](https://medium.com/@at0dd/install-mysql-5-7-on-mac-os-mojave-cd07ec936034) completely to resolve

### want vim with lua and other options
Homebrew removed or has modified the way install options are supplied. I've been able to use [this](https://github.com/skwp/dotfiles/issues/817#issuecomment-496861257) to successfully install

## thanks

Holman forked [Ryan Bates](http://github.com/ryanb)' excellent
[dotfiles](http://github.com/ryanb/dotfiles) for a couple years before the
weight of my changes and tweaks inspired me to finally roll my own. But Ryan's
dotfiles were an easy way to get into bash customization, and then to jump ship
to zsh a bit later. A decent amount of the code in these dotfiles stem or are
inspired from Ryan's original project.
