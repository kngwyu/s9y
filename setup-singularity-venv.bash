python -m venv singularity-venv
. singularity-venv/bin/activate

for installable in $@; do
    pip install -e installable || exit 1
done

deactivate
