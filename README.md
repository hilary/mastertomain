# MasterToMain

MasterToMain is a script to help you change your branch name and all references from master to main.

## Background

The master-slave is an outdated and offensive metaphor and does not have a place in modern technology. Arguments can be made that the master branch references a master copy relationship, but [evidence](
https://github.com/bitkeeper-scm/bitkeeper/blob/master/doc/HOWTO.ask#L223 "bitkeeper reference") points to the contrary. In either case empathy is important and if changing one term is less harmful, let's do it.

## Instructions

The easiest way to do this is to copy this script into your local repo, and run:

```
$ bash mastertomain.sh
```

The script will automatically create a new branch called 'main' it will then delete your local master branch and check for any references of the word 'master'.

If references are found it provides an interactive interface to automatically update the references.

After you have updated all the references the script will prompt you to update any branch protections, external dependencies, and lastly to change your default branch from master to 'main'.

After that it will delete your remote master branch, and thats it you're all done!

## Additional Information

[kapwing](
https://www.kapwing.com/blog/how-to-rename-your-master-branch-to-main-in-git/ "Kapwing Blog") - does a great job of discussing the background. Their approach is different from ours, as they assume you don't have any tooling internal to the repo (github actions, travis, etc) which references master.

[history of master in git](
https://mail.gnome.org/archives/desktop-devel-list/2019-May/msg00066.html "Gnome Archive") - a collection of articles relating to the history of git and the use of the term master within it.
