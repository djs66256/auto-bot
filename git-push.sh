
#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
USER_HOME="$HOME"

source $SCRIPT_DIR/git-push.conf.sh
source $USER_HOME/.bash_profile

function auto_git_operations() {
    echo ""
    echo "-----------BEGIN-------------"
    echo "[GIT-PUSH] start git add all and commit using auto-commit"

    git add .
    git commit -m "auto-commit"

    echo "[GIT-PUSH] start git pull"

    git pull --rebase || true

    echo "[GIT-PUSH] start git push"
    git push

    echo "-----------END-------------"
    echo ""
}

echo "==========BEGIN============"
date
echo "[GIT-PUSH] Start git push script"
echo "==========BEGIN============"
echo ""

for path in ${GIT_PATHS[@]}
do
    cd $path

    # git submodule 循环提交
    for submodule in $(git submodule | awk '{print $2}')
    do
        echo "[GIT-PUSH] cd submodule: $submodule"
        cd $submodule

        auto_git_operations

        cd ..
    done

    echo "[GIT-PUSH] cd $path"

    auto_git_operations

done


echo "===========END==========="
echo "[GIT-PUSH] Thank you for using git-push script"