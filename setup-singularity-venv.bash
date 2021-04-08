python -m venv singularity-venv --system-site-packages
. singularity-venv/bin/activate

echo "Working directory" $PWD

for installable in $@; do
    pip install -e file://$PWD/$installable || exit 1
done

deactivate
