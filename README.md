# s9y

s9y is a thin wrapper for [singularity](https://sylabs.io/guides/3.7/user-guide/) container.

## Why?
For shortening the commands and enabling the directory-specific
configuration of containers, options, and Python virtualenvs.

## Install
`s9y` is a standalone bash script.
Copy to a directiry in `$PATH` (e.g., `$HOME/.local/bin`).

## Usage
Make your config file named `.s9y-env`.
This file currently  supports three variables.

```bash:.s9y-env
export S9Y_CONTAINER="my-container.sif"  # Path to your singularity container.
export S9Y_VENV=".s9y-venv"  # Path to your Python virtualenv.
export S9Y_EXEC_OPTIONS=(--nv)  # CLI options for singularity exec.
```

Then, you can use `s9y` under the all child directries.
See `s9y help` for its usage.
```
Usage: s9y <subcommand> [options]

Subcommands:

    exec  Execture any command. Wrapper of singularity exec.
    shell Enter the login shell of image. Wrapper of singularity shell.
    py    Execute a python program, possibly with virtualenv,
          specified by S9Y_VENV.
    venv  Execute any command (e.g., pip) in a virtualenv.

For help with each subcommand, run s9y <subcommand> -h|--help

```
