# s9y
s9y is a thin wrapper for [singularity](https://sylabs.io/guides/3.7/user-guide/) container.

## Why?
For shortening the commands and enabling directory-specific
configurations of containers, CLI options, and Python virtualenvs.

## Install
`s9y` is a standalone bash script, so simply copy to a directiry in `$PATH`.
E.g., if you use `$HOME/.local/bin`, run
`wget -O $HOME/.local/bin/s9y https://git.io/JOsUn && chmod +x $HOME/.local/bin/s9y`.

### Dependecies
singularity, bash, and sed

## Usage
Place a config file named `.s9y-env` under the directory you want to use
singularity.

`s9y` currently supports three variables set in this file:

#### **`.s9y-env`**
```bash
export S9Y_CONTAINER="my-container.sif"  # Path to your singularity container.
export S9Y_VENV=".my-venv"  # Path to your Python virtualenv.
export S9Y_EXEC_OPTIONS=(--nv)  # CLI options for singularity exec.
export S9Y_PYTHON="python3"  # Name of Python executable used by s9y. Set "python" by default.
```

This file is simply `source`d in the script, so you can set other
env-vars.
For example, `export SINGULARITY_BIND="$SSH_AUTH_SOCK"` would be
helpful to use an SSH agent from a container.

Then, you can use `s9y` under the all child directries.

```bash
❯ s9y venv --create --system-site-packages
INFO: Creating Python virtual env .my-venv

❯ s9y exec ls .my-venv
bin  include  lib  lib64  pyvenv.cfg  share

❯ s9y venv pip install cowsay
INFO: S9Y_VENV found, use .my-venv for executing Python script
Collecting cowsay
  Downloading cowsay-3.0-py2.py3-none-any.whl (19 kB)
Installing collected packages: cowsay
Successfully installed cowsay-3.0

❯ s9y python -c 'import cowsay; cowsay.cow(\'Hello World\')'
INFO: S9Y_VENV found, use .my-venv for executing Python script
  ___________
< Hello World >
  ===========
                \
                 \
                   ^__^
                   (oo)\_______
                   (__)\       )\/\
                       ||----w |
                       ||     ||
```

See `s9y help` for more usage.
```
Usage: s9y <subcommand> [options]

Subcommands:

    exec  Execture any command. Wrapper of 'singularity exec.'
    shell Enter the login shell of the container. Wrapper of 'singularity shell'.
    python    Execute a Python program, possibly within
          the virtualenv specified by S9Y_VENV.
    venv  Execute any command (e.g., pip) in the virtualenv.
          Equivalent to '. your-venv/bin/activate && ...'.

For help with each subcommand, run s9y <subcommand> -h|--help
```
