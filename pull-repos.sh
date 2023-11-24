#!/bin/bash

# Add this file in the root folder of your project. 

MAIN_DIR="$(pwd)"
BRANCH="develop"

# Color variables
R='\033[0;31m'   #'0;31' is Red's ANSI color code
NO_COLOR='\033[0m'

# Iterate over subdirectories in MAIN
for project_dir in "$MAIN_DIR"/*; do
    if [ -d "$project_dir" ]; then
        cd "$project_dir"
	echo ">>REPO: ${project_dir}"
        # Check if it's a Git repository
        if [ -d ".git" ]; then
            # Check if the current branch is "develop"
            current_branch=$(git rev-parse --abbrev-ref HEAD)
            if [ "$current_branch" == "develop" ]; then

		   echo "Pulling ..."
		    git pull
            else
		    echo -e  "${R}Repository is not on the '${BRANCH}' branch. Skipping${NO_COLOR}."
            fi
        else
            echo "$project_dir is not a Git repository. Skipping."
        fi
    fi
done
