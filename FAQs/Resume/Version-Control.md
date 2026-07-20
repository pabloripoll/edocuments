# Version Control

## Connect local machine to remote repository

A ssh rsa key must be added to remote git account in order to connect local terminal/IDE to remote account repositories.
Check if already exists in computer a key to complete in ~/.ssh
```bash
$ ls ~/.ssh

id_rsa  id_rsa.pub  known_hosts
```

In case that directory is empty, create new key

Open local terminal and put the following command to generate a ssh-key. Press "enter key" leaving fields empty to have an easy key.

Creating a phrasepass is optional but it's strongly considered for security enviroment. [More at: this reference link](https://git-scm.com/book/en/v2/Git-on-the-Server-Generating-Your-SSH-Public-Key)

```bash
$ ssh-keygen -o
```

This will generate a RSA 3072 ssh-rsa key in the actually local user's home directory. Checkout generated files at ssh directory
```bash
$ ls ~/.ssh
```

Get the actual keys prompted on terminal.
```bash
$ cat ~/.ssh/id_rsa.pub
```

This key must be added in:
```
Github:    https://github.com/settings/keys

Gitlab:    https://github.com/settings/keys

Bitbucket: https://github.com/settings/keys
```

## Set repository from zero

Start git repository by the following command on the project's root directory
```bash
$ git init
```

First, remember to configure local git user and email
```bash
$ git config user.name "{user-name}" && git config user.email "{user-email}"
```
*WARNING!* DO NOT USE  `$ git config --global ...` because will change all projects configurations

## Cloning a repository

#### Never* use git pull
https://www.youtube.com/watch?v=xN1-2p06Urc

## Git pull vs fetch
"git pull" will pull latest remote repository updates to "local repository" and "working directory" while "git fetch" will only pull to "local repository" and it will merge to working directory by executing then "git merge"


## Sources
- https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow
- GIT & Github: https://www.linkedin.com/embed/feed/update/urn:li:ugcPost:7193829802435305472
