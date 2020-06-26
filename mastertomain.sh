#!/usr/bin/env bash

set -eu

function create_main {
  echo "creating main..."
  git checkout master
  git pull origin master
  git checkout -b main  
  echo "done"
  echo ""
}

function find_master {
  git grep -w -q master
}

function delete_master {
  git pull
  git branch -d master
  git push origin :master
}

if git status porcelain; then
  true
else
  echo "Hey! I found uncommitted changes in your repo. Please commit/stage/nuke your changes and try again."
  exit 1
fi

echo "Welcome! I will help you convert your master branch to be called main."
echo "Black Lives Matter!"
echo "Some steps are automated, others you will need to do manually. I'll prompt you for each manual step,"
echo "after which you can come back here and continue."
echo ""
echo "First, some automated steps..."
echo ""

create_main
if find_master; then
  echo "I found some uses of the word 'master' in your code. I'm going to present them to you one at a time"
  echo "for you to review and accept or deny. Please review them carefully, because I will commit the changes"
  echo "you accept."
  echo ""
  for filename in $(find . -type f -name "*" ! -path './.git/*' ! -name 'mastertomain.sh' ! -path './vendor/*'); do 
    vim -c "%s/master/main/gc" -c "wq" "${filename}"; 
  done
  echo ""
  echo "Phew! All done!"
  echo ""
  echo "Committing changes..."
  git add .
  git commit -m "convert master to main"
  echo "done"
  echo ""
fi
echo "Pushing changes to github..."
git push --set-upstream origin main
echo "done"
echo ""

echo "Now I'm going to walk you through a series of manual steps, after I'll do a last few scripted steps."
echo ""
echo "I have opened a pull request for 'main’."
echo "Go to your repo on GitHub and merge the changes. Hit enter to continue"
read -r
echo "Still on Github, under settings => branches, update any branch protections. Hit enter to continue."
read -r
echo "Update any *external* dependencies, e.g, concourse. Hit enter to continue."
read -r
echo "Back on Github under settings => branches, update the default branch to 'main'. Hit enter to continue."
read -r

echo "Deleting master (drumroll please!)..."
delete_master
echo "done!"
echo ""
echo "Thanks for making your project a safer and more inclusive environment."
