if [ -d $HOME/imoc ]; then
    echo "IMOC directory already exists"
    exit 0
fi

cd $HOME/imoc
git clone git@github.com:kngwyu/private-experiments.git && \
    git clone git@github.com:kngwyu/mujoco-py.git && \
    git clone git@github.com:kngwyu/Rainy.git && \
    git clone git@github.com:kngwyu/intrinsic-rewards.git && \
    git clone git@github.com:kngwyu/rlpy3.git

if [ -v DEFAULT_CONTAINER ]; then
    singularity exec $DEFALT_CONTAINER bash setup-singularity-venv.bash
fi

