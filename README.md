# jupyter-osx-app

## A standalone OS X app for Jupyter

Installing and uninstalling are both very simple and completely automated.

# Installation
- Open a terminal and enter the following lines:

    ```
    $ cd <your-jupyter-osx-app-repo-path>
    $ ./install
    ```

- This will create a new app at `/Applications/jupyter_chrome.app` that will, when opened, run a new instance of Jupyter Notebook, start up an independent browser, and redirect the browser to the root of your Notebook tree.

# Uninstallation
- Open a terminal and enter the following lines::
    
    ```
    $ cd <your-jupyter-osx-app-repo-path>
    $ ./uninstall
    ```
    
# Future work
- selectable install location (right now this is fixed at `/Applications`)
- selectable terminal for launching the Jupyter Notebook instance (currently this is dependent upon `iTerm2`)
