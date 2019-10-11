# Jupyter-app

## The fastest standalone app for JupyterLab
A standard OS X `.app` that, when double-clicked, starts `jupyter lab` in a fresh terminal and launches an independent instance of the Chromium browser, and redirects the browser to the JupyterLab client. Best of all, the browser and the `jupyter` server are linked, such that closing/quitting one will also close the other.

## Features 
- Single command, no hassle installation and uninstallation via dedicated scripts.
- EZ startup and shutdown:
    - Starting the app is as easy as double-clicking on it.
    - Exiting the browser will cleanly shut down the server launched by the `jupyter` command, and vice-versa.
- Everything that can be automated has been automated, including the handling of the Jupyter security token.
- Built on top of a fresh, unmodified, unextended copy of stock Chromium, so it's as fast as it can be.
- No compiling required, and zero external dependencies (aside from JupyterLab itself).
- The app can also be launched via the command line.

## Requirements

The only requirements are OS X and JupyterLab. You can install the latest version of JupyterLab with a single command:

```bash
pip install jupyterlab
```

See the [JupyterLab docs](https://jupyterlab.readthedocs.io/en/stable/getting_started/installation.html) for alternative installs (eg using `conda`) and more details.

# Installation
- Open a terminal and enter the following lines:

    ```bash
    git clone https://github.com/telamonian/jupyter-app.git
    cd jupyter-app
    ./install
    ```

    This will create a new app at `/Applications/Jupyter.app` that will, when opened, run a new instance of JupyterLab, start up an independent browser, and redirect the browser to the JupyterLab page.

- You can perform a dryrun of the installation by adding a `-d` flag to the `install` command:

    ```bash
    ./install -d
    ```

    In this mode, all commands are printed to `stdout` instead of executed.

# Uninstallation
- Open a terminal, `cd` to your `jupyter-app` repo directory, then enter the following single command:

    ```bash
    ./uninstall
    ```

    You can also perform a dryrun of the uninstall by adding a `-d` flag to the command.

# More info

## Command line only workflow

In addition to double clicking on the app installed at `/Applications/Jupyter.app`, you can also launch the app via the command line.

- Launch the app with this command:

    ```bash
    open -a Jupyter
    ```

- Can also optionally pass args to the internal `jupyter` command using the `--args` flag. For example:

    - If you want the app to start Jupyter Notebook classic instead of JupyterLab, you'd run:

        ```bash
        open -a Jupyter --args notebook
        ```

    - If you want the app to start JupyterLab in development mode, you'd' run:

        ```bash
        open -a Jupyter --args lab --dev-mode
        ```

## Installation options
The default install should work in most cases. However, if you want to customize your installation of Jupyter app there are many options available in `install.conf`:
- `APP_NAME`
    - Sets the name that the app will be displayed as both in Finder and on the dock.
    - Default = `Jupyter`
- `APP_DIR`
    - Sets the installation directory for Jupyter app. When `./install` is run, the new app will be created at `${APP_DIR}/${APP_NAME}.app`.
    - Default = `/Applications`
- `JUPYTER_CMD`
    - Should be "lab" for jupyterlab, or "notebook" for standard jupyter notebook.
    - Default = `"lab"`
- `APP_BASE`
    - The browser used by Jupyter app. Needs to be one of chrome | chromium.
    - Default = `chromium`
- `TERM_NAME`
    - Which terminal application the app should use to launch the Jupyter server when it starts up. Currently only the standard Apple Terminal and iTerm2 are supported.
    - Default = `Terminal`
- `VIRTUAL_ENV`
    - Absolute path to virtual environment activation script, if any.
    - Default = none
    
## Adding your own themes/extensions to the automated installer
- More information to come. For now, take a peek at `resource/chrome_extension_specs` in the repo and [this Chrome dev page](https://developer.chrome.com/extensions/external_extensions) if you want to know more.

## The schpiel

I've been a user of IPython and Jupyter notebooks for years (in fact, I'm now a core developer for JupyterLab). The notebooks are the perfect middle ground in between coding on the command line and full-on scripting. My biggest complaint is that their performance, while not abysmal, is not so great. When I have a long notebook, or a short notebook with 4 or 5 figures or long output cells, there tends to be quite a bit of lag.

So what I've wanted for a while is a dedicated Jupyter application, one that isn't bogged down by unnecessary extensions (adblock, for example) or the 20 Wikipedia tabs I happen to have open at the time. After trying many different browsers and standalone projects (most notably [pineapple](https://github.com/nwhitehead/pineapple)), I found that none of them were as fast as stock Chrome when it came to running a notebook. I started to wonder if it was possible to run two separate copies of Chrome side-by-side... and, well, after a year or-so of intermittent tinkering, I got it to work.

I figured that a patched copy of Chrome would be hard to maintain with the march of their versions, not to mention the copyright issues. Instead, I designed Jupyter-app as a set of wrappers, and made only minimal changes to the underlying app and its contents. So far this approach has worked out well, as I've been able to get Chrome to do everything I've wanted by tweaking the behavior of the program during its kickoff.

## Future work
- Add a way to keep track of options used for latest install
    - Currently there are a few ways in which a user could break the uninstaller if they change any options before uninstalling the program.

## Finished work

The following items were previously under "Future work", but are now done:

- ~~Add a command-line only workflow, ie make a way to launch Jupyter and the customized browser together without needing to invoke the .app directly.~~
    - Done!
- ~~Find a way to automatically terminate the `jupyter notebook` session when the linked browser is closed~~
    - Done!
    - Works via the bash `wait` command.
    - Look in `resource/app_mid_wrap` for details.
- ~~selectable install location (right now this is fixed at `/Applications`)~~
    - Done!
- ~~selectable terminal for launching the Jupyter Notebook instance (currently this is dependent upon `iTerm2`)~~
    - Done!
    
# The next version of `jupyter-app`

In part, this project has been a way to sharpen my bash scripting skills, and to answer an age-old question in the field of yak shaving studies: "how complicated of a program can you write using nothing but bash?".

I feel like I've more or less come to a definitive answer to that question. Since the initial release of `jupyter-app`, I've added many features. Currently, I think I'm coming up against the limitations of bash, especially since OS X is stuck with bash `v3` (due to to licensing issues), and will never ship with bash `v4` preinstalled.

Eventually, I plan to replace `jupyter-app` with a more flexible Python-based JupyterLab installation tool. Here's some features I'd like to add in the Python version:

- Run cross-platform, and be able to install a working desktop app on OS X, Linux, and Windows.

- Handle installation of JupyterLab itself.

- Handle setup and management of JupyterLab compatible virtual environments, including setup of all data/config paths used by `jupyter`
