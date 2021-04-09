if [ -d $HOME/imoc ]; then
    echo "IMOC directory already exists"
    exit 0
fi

mkdir $HOME/imoc && cd $HOME/imoc

git clone git@github.com:kngwyu/private-experiments.git && \
    git clone git@github.com:kngwyu/mujoco-maze.git && \
    git clone git@github.com:kngwyu/Rainy.git && \
    git clone git@github.com:kngwyu/intrinsic-rewards.git && \
    git clone git@github.com:kngwyu/rlpy3.git

echo 'export S9Y_CONTAINER="$HOME/singularity-containers/py38-torch181-cuda111-mujoco200.sif"' >> .s9y-env
echo 'export S9Y_VENV="$HOME/imoc/.imoc-venv"' >> .s9y-env

s9y venv --create
s9y venv pip install -e file://mujoco-maze
s9y venv pip install -e file://Rainy
s9y venv pip install -e file://intrinsic-rewards
s9y venv pip install -e file://rlpy3
