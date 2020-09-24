# MasterToMain

MasterToMain is a script to help you change your branch name and all references from master to main.

## Background

The master-slave metaphor is outdated and offensive and does not have a place in modern technology. 
Arguments have been made that the master branch references a master copy relationship, but [evidence](
https://github.com/bitkeeper-scm/bitkeeper/blob/master/doc/HOWTO.ask#L223 "bitkeeper reference") points to the contrary. 
In either case empathy is important and if changing one term is less harmful, let's do it.

## Instructions

You may want to take a few minutes to clean up your repo before running `mastertomain`. We've done a fair bit
of hardening against common situations (e.g., open pull requests), but a clean repo is a happy repo.

The script currently assumes that you are running it from a local clone of a git repo on `ORIGIN`. Copy this script into
your local clone, and run it:

```
$ bash mastertomain.sh
```

What the script does, step by step:

1. Automatically creates a new branch `main`
1. Checks for any references to the word 'master'
   * If it finds references, provides an interactive interface to automatically update the references and commit any accepted changes.
1. Prompts you to:
   1. update any branch protections
   1. update any *open* pull requests to use `main` as the base rather than `master`
   1. update external dependencies
   1. change your default branch from `master` to `main` on Github
1. Finally, deletes `master` locally and at Github.

## What if I want to call the branch something else?

To call the branch something else, use the environment variable `MAIN`: `MAIN=dev bash mastertomain.sh`

## Additional Information

[kapwing](
https://www.kapwing.com/blog/how-to-rename-your-master-branch-to-main-in-git/ "Kapwing Blog") - does a great job of discussing the background. Their approach is different from ours, as they assume you don't have any tooling internal to the repo (github actions, travis, etc) which references master.

[history of master in git](
https://mail.gnome.org/archives/desktop-devel-list/2019-May/msg00066.html "Gnome Archive") - a collection of articles relating to the history of git and the use of the term master within it.

## Authors

Created by [Brandon Strittmatter](https://github.com/stritt) and [Hilary Holz](https://github.com/hilary)

## Acknowledgments

MasterToMain won the 2020 Q2 SharkaHack, [DigitalOcean's](https://digitalocean.com/) quarterly internal hackathon. Thanks to DO for giving us the time to work on it!
