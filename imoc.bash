if [ -d $HOME/imoc ]; then
    echo "IMOC directory already exists"
    exit 0
fi

orig_dir=$PWD
mkdir $HOME/imoc && cd $HOME/imoc

git clone git@github.com:kngwyu/private-experiments.git && \
    git clone git@github.com:kngwyu/mujoco-maze.git && \
    git clone git@github.com:kngwyu/Rainy.git && \
    git clone git@github.com:kngwyu/intrinsic-rewards.git && \
    git clone git@github.com:kngwyu/rlpy3.git

echo $DEFAULT_CONTAINER

if [ -v DEFAULT_CONTAINER ]; then
    singularity exec $DEFAULT_CONTAINER bash $orig_dir/setup-singularity-venv.bash \
                mujoco-maze \
                Rainy \
                intrinsic-rewards \
                rlpy3
fi
