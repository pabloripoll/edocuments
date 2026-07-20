MAKEFLAGS += --silent

# Settings
C_BLU='\033[0;34m'
C_GRN='\033[0;32m'
C_RED='\033[0;31m'
C_YEL='\033[0;33m'
C_END='\033[0m'

include ./.env

# -------------------------------------------------------------------------------------------------
#  Help
# -------------------------------------------------------------------------------------------------
.PHONY: help

help: ## shows this Makefile help message
	echo "Usage: $$ make "${C_GRN}"[target]"${C_END}
	echo ${C_GRN}"Targets:"${C_END}
	awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "$$ make \033[0;33m%-30s\033[0m %s\n", $$1, $$2}' ${MAKEFILE_LIST} | column -t -c 2 -s ':#'

# -------------------------------------------------------------------------------------------------
#  Repository
# -------------------------------------------------------------------------------------------------

repo-test: ## compares remote git repository connection with current set in .git/config
	git remote -v
	git ls-remote $(REPO_CONN)

name := ""
email := ""
repo-user: ## sets local git repository user
	if [ $${name:-''} = "" -o $${email:-''} = "" ]; then \
		echo ${C_RED}"Repository user name must be specified!"${C_END}; \
    else \
		git config user.name "${name}"; \
		git config user.email "${email}"; \
		echo ${C_GRN}"O.K.! repository's user has been set."${C_END}; \
	fi

repo-flush: ## clears local git repository cache
	git rm -rf --cached .; git add .; git commit -m "fix: cache cleared for untracked files"

# Default branch and comment variables with most common values
branch ?= "$(shell git branch | sed 's/^.\{2\}//')"
comment ?= feat: $(shell date +"%Y.%m.%d %H:%M:%S")

repo-preset:
	@echo "Repository preset "${C_YEL}"PUSH TO REPOSITORY"${C_END}" process:"
	@echo "$$ git stash \n\$$ git pull origin -u "${C_GRN}$(branch)${C_END}" \n\$$ git stash pop \n\
	$$ git add .  \n\$$ git commit -m \"$(comment)\"  \n\$$ git push origin -u "${C_GRN}$(branch)${C_END}
	@echo "Repository preset "${C_YEL}"PULL FROM REPOSITORY"${C_END}" process:"
	@echo "$$ git stash \n\$$ git pull origin -u "${C_GRN}$(branch)${C_END}" \n\$$ git stash pop"

repo-push: ## git push equivalent on current branch. Otherwise specified branch or comment $ make repo-update branch=??? comment="???"
	@echo ${C_YEL}"ATTENTION:"${C_END}
	@echo "All local changes from branch:"
	git branch;
	@echo "Is going to be pushed into * "${C_YEL}"$(branch)"${C_END}" branch,"
	@echo "On repository" ${C_YEL}$(shell git config --get remote.origin.url)${C_END}
	@echo "with the following commit comment:"
	@echo "*" ${C_GRN}${comment}${C_END};
	@echo -n ${C_YEL}"Are you sure? "${C_END}"[y/n]: " && read response && if [ $${response:-'n'} != 'y' ]; then \
        echo ${C_RED}"K.O.! update process has been stopped."${C_END}; \
    else \
		git stash; \
		git pull origin $(branch); \
		git stash pop; \
		git add .; \
		git commit -m "$(comment)"; \
		git push origin -u $(branch); \
        echo ${C_GRN}"O.K.! remote repository's branch has been updated from local."${C_END}; \
    fi

repo-pull: ## git pull equivalent on current branch.
	@echo ${C_YEL}"ATTENTION:"${C_END}
	@echo "Changes from remote branch:"
	git branch;
	@echo "Is going to be pulled into * "${C_YEL}"$(branch)"${C_END}" branch,"
	@echo "On repository" ${C_YEL}$(shell git config --get remote.origin.url)${C_END}
	@echo -n ${C_YEL}"Are you sure? "${C_END}"[y/n]: " && read response && if [ $${response:-'n'} != 'y' ]; then \
        echo ${C_RED}"K.O.! update process has been stopped."${C_END}; \
    else \
		git stash; \
		git pull origin $(branch); \
		git stash pop; \
        echo ${C_GRN}"O.K.! local repository's branch has been updated from remote."${C_END}; \
		git push origin -u $(branch); \
        echo ${C_GRN}"O.K.! remote repository has been updated from local."${C_END}; \
    fi

# -------------------------------------------------------------------------------------------------
#  Vault
# -------------------------------------------------------------------------------------------------

error-examples: #\ not used command - ftp.gnu.org/old-gnu/Manuals/make-3.79.1/html_chapter/make_6.html
	@[ "${comment}" ] || ( echo ">> commit comment is not set"; exit 1 )
	$(error comment variable is not set)