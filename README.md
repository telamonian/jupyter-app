# Jupyter-app

## The fastest standalone app for Jupyter Notebook
A standard OS X `.app` that, when double-clicked, starts `jupyter notebook` in a fresh terminal, launches an independent instance of the Chrome browser, and redirects the browser to the Jupyter file tree.

## Features 
- Single command, no hassle installation and uninstallation via dedicated scripts.
- Everything that can be automated has been automated, including the handling of the Jupyter security token.
- Built on top of a fresh, unmodified, unextended copy of stock Google Chrome, so it's as fast as it can be.
- No compiling required, and zero external dependencies (aside from Jupyter itself).

# Installation
- Open a terminal and enter the following lines:

    ```
    $ cd <your-jupyter-app-repo-path>
    $ ./install
    ```

- This will create a new app at `/Applications/Jupyter.app` that will, when opened, run a new instance of Jupyter Notebook, start up an independent browser, and redirect the browser to the root of your Notebook tree.
- `./install -d` will perform a dryrun of the installation. In this mode, all commands are printed to `stdout` instead of executed.

# Uninstallation
- Open a terminal and enter the following lines::
    
    ```
    $ cd <your-jupyter-app-repo-path>
    $ ./uninstall
    ```
- `./uninstall -d` will perform a dryrun of the uninstallation. In this mode, all commands are printed to `stdout` instead of executed.

# More info

## Installation options
The default install should work in most cases. However, if you want to customize your installation of Jupyter app there are many options available in `install.conf`:
- `APP_NAME`
    - Sets the name that the app will be displayed as both in Finder and on the dock.
    - Default = `Jupyter`
- `APP_DIR`
    - Sets the installation directory for the Jupyter app. When `./install` is run, the new app will be created at `${APP_DIR}/${APP_NAME}.app`.
    - Default = `/Applications`
- `TERM_NAME`
    - Which terminal application the app should use to launch `jupyter notebook` when it starts up. Currently only the standard Apple Terminal and iTerm2 are supported.
    - Default = `iTerm`
- `JUPYTER_BIN`
    - If `jupyter` is not on your `PATH`, or if you have more than one copy installed, you can specify the full path your Jupyter executable in this variable.
    - Default = `jupyter`
- `EXTENSIONS`
    - If `true`, extensions will be automatically installed into the Jupyter-specific copy of Chrome. Currently the only included extension is the [Material Dark Theme](https://chrome.google.com/webstore/detail/material-dark/npadhaijchjemiifipabpmeebeelbmpd).
    - Default = `true`
    
## Adding your own themes/extensions to the automated installer
- More information to come. For now, take a peek at `resource/external_extensions_json` in the repo and [this Chrome dev page](https://developer.chrome.com/extensions/external_extensions) if you want to know more.

## The schpiel

I've been a user of IPython and Jupyter for years, and I'm a big fan. The notebooks are the perfect middle ground in between coding on the command line and full-on scripting. My biggest complaint is that their performance, while not abysmal, is not so great. When I have a long notebook, or a short notebook with 4 or 5 figures or long output cells, there tends to be quite a bit of lag.

So what I've wanted for a while is a dedicated Jupyter application, one that isn't bogged down by unnecessary extensions (adblock, for example) or the 20 Wikipedia tabs I happen to have open at the time. After trying many different browsers and standalone projects (most notably [pineapple](https://github.com/nwhitehead/pineapple)), I found that none of them were as fast as stock Chrome when it came to running a notebook. I started to wonder if it was possible to run two separate copies of Chrome side-by-side... and well, after a year of tinkering, here we are.

I figured that a patched copy of Chrome would be hard to maintain with the march of their versions, not to mention the copyright issues. Instead, I designed Jupyter-app as a set of wrappers, and made only minimal changes to the underlying app and its contents. So far this approach has worked out well, as I've been able to get Chrome to do (almost) everything I've wanted by tweaking the behavior of the program during its kickoff.

## Future work
- Add a command-line only workflow
    - Make a way to launch Jupyter and the customized browser together without needing to invoke the .app directly.
- Find a way to automatically terminate the `jupyter notebook` session when the linked browser is closed
    - Currently this only works the other way around.
- Add a way to keep track of options used for latest install
    - Currently there are a few ways in which a user could break the uninstaller if they change any options before uninstalling the program.
- ~~selectable install location (right now this is fixed at `/Applications`)~~
    - done!
- ~~selectable terminal for launching the Jupyter Notebook instance (currently this is dependent upon `iTerm2`)~~
    - done!
    
