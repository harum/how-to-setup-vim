# Vim Configuration

We can configure our Vim text editor using `.vimrc` file. This file can configure our basic setup, plugins, and key
stroke map.

## Create Configuration File
You can create your own `.vimrc` file. You can go to your `$HOME` directory, then create the file. After that you can
add your own setup inside it.
```bash
cd ~/
vim .vimrc
```

Everytime we update the `.vimrc` file, the new configuration is not automatically applied to current opened Vim text
editor. We need to reload the configuration using this command.

```vim
:source ~/.vimrc
```

## Add Plugins
There are a lot of plugin that we can use to make our experiece using Vim text editor better. There are plugins related
to color scheme to plugin that related to linting.

My recommendation is using [vim-plug](https://github.com/junegunn/vim-plug). It is simple to use. It also makes us
easier to apply our current configuration and plugin into other machine.

Follow the [vim-plug](https://github.com/junegunn/vim-plug) installation step. Add your favorite plugisn. And finally reload .vimrc and run :PlugInstall to install plugins.

## Use Existing Vim Configuration
Sometime it take times to setup the configuration. And it also can become difficult if you are new to Vim. Instead of
you create your own configuration from scratch, you can you other person Vim configuration.

You can use my Vim configuration by following these steps:
-  Download `.vimrc` file on [.vimrc](https://github.com/junegunn/vim-plug)
-  Copy the content of the file into your `.vimrc`. Or you can replace your current `.vimrc` file with this file.
-  Open vim text editor, then run `:PlugInstall`

If you want to try other configuration, take a look at these articles:
-  [https://github.com/amix/vimrc](https://github.com/amix/vimrc)
-  [https://opensource.com/article/21/12/vanilla-vim-config](https://opensource.com/article/21/12/vanilla-vim-config)
-  [https://github.com/spf13/spf13-vim](https://github.com/spf13/spf13-vim)

