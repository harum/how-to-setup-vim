# Installation

There are two common version of Vim that can be used on MacOS, such as:
-  Terminal version of Vim 
-  GUI Mac application using [MacVim](https://github.com/macvim-dev/macvim)

## Vim Installation
According to [Homebrew Formulae](https://formulae.brew.sh/formula/vim), run command below for installation.
```bash
brew install vim
```

After installation, you can use `vim` command to open folder or file on `vim`.
```bash
# open current folder
vim .

# open file, example README.md file
vim README.md
```


## MacVim Installation
There are two option to install MacVim. First via direct download of `.dmg` file, and second using `homebrew`. Choose according to your need.

### Direct download
Download MacVim `.dmg` file on the download [link](https://macvim-dev.github.io/macvim/). After downloading, you can double click on the downloaded file and drag it into the application.

To run MacVim, go to `Application` folder, or go to `Launchpad` then double click on `MacVim` application.

At this moment, you can not directly open `MacVim` from terminal. To make it executable form terminal, we need to add `MacVim` alias on our `.bashrc` or `.zshrc`.

Assume we use `.zshrc`, then run
```bash
# open .zshrc on terminal
vim ~/.zshrc

# or open .zshrc on MacVim
/Applications/MacVim.app/Contents/bin/mvim ~/.zshrc
```

Add this line
```bash
alias mvim=/Applications/MacVim.app/Contents/bin/mvim
```

After saving the changes you can run this command to apply the newest changes on `~/.zshrc`
```.bash
source ~/.zshrc
```

Now you can open file or folder using `mvim` command on terminal.


### Using homebrew
If you want to install MacVim using `homebrew`, you do not have to install `vim` using homebrew first. If you already install `vim` using `homebrew`, run this command first
```bash
brew unlink vim
``` 

According to [Homebrew Formulae](https://formulae.brew.sh/formula/macvim), run this command to install MacVim

```bash
brew install macvim
```

After the installation done, you can run `mvim` command on terminal.
