#!/bin/bash

GITHUB_URI="https://github.com"
GITHUB_API="https://api.github.com"
K8S="kubernetes"

function usage() {
cat <<_EOT_
USAGE:
  $0 username -r repository_name

DESCRIPTION:
  Setup your PR environment with SSH key authentication.  Specify a repository
  name, and the repository is cloned from your own github host.  Then, this
  script make the local repos enable to send PR with SSH key authentication.

REQUIREMENT:
  jq, git, curl

OPTIONS:
  -u          Gihub username
              E.g. https://github.com/kubernetes/website.git -> 'kubernetes'
  -r          Repository name.
              E.g. https://github.com/kubernetes/website.git -> 'website'
  --dry-run   Show all execute commands
_EOT_
exit 1
}

function setup() {
  echo "Setup environment"
  echo $USER_NAME
}


function check() {
  MY_REPOS=(`curl -s ${GITHUB_API}/users/$USER_NAME/repos | jq -c '.[] .name'`)
  echo ${MY_REPOS[@]}
  if ! `echo ${MY_REPOS[@]} | grep -q "$TARGET_REPOS"`; then
      echo "[ERROR] Specified repository $TARGET_REPOS doesn't exist."
      exit 1
  fi
}

if [ "$OPTIND" = 1 ]; then
  while getopts u:r:-:h OPT; do
    case $OPT in
      -)
        case "${OPTARG}" in
          help)
            usage
            ;;
          dry-run)
            DRY_RUN=1
            ;;
        esac
        ;;
      r)
        TARGET_REPOS=${OPTARG}
        ;;
      u)
        USER_NAME=${OPTARG}
        ;;
      h)
        usage
        ;;
      \?)
        echo "[ERROR] Try to enter the h option." 1>&2
        usage
        ;;
    esac
  done
else
  echo "[ERROR] Not installed getopts-command." 1>&2
  exit 1
fi

if [ -z "$USER_NAME" -o -z "$TARGET_REPOS" ]; then
  echo "[ERROR] You must specify -u and -r"
  usage
fi


if [ -n "$DRY_RUN" ]; then
  echo "git clone ${GITHUB_URI}/${USER_NAME}/${TARGET_REPOS}.git"
  echo "pushd $TARGET_REPOS"
  echo "git remote add upstream ${GITHUB_URI}/${K8S}/${TARGET_REPOS}.git"
  echo "git remote set-url --push upstream no_push"
  echo "git remote set-url origin git@github.com:${USER_NAME}/${TARGET_REPOS}.git"
  echo "git fetch upstream"
  echo "git checkout master"
  echo "git rebase upstream/master"
  echo "popd"
else
  check
  git clone ${GITHUB_URI}/${USER_NAME}/${TARGET_REPOS}.git
  if [ $? -ne 0 ]; then
    echo "Failed to clone ${USER_NAME}/${TARGET_REPOS}.git"
    exit 1
  fi
  pushd $TARGET_REPOS
  git remote add upstream ${GITHUB_URI}/${K8S}/${TARGET_REPOS}.git
  git remote set-url --push upstream no_push
  git remote set-url origin git@github.com:${USER_NAME}/${TARGET_REPOS}.git
  git fetch upstream
  git checkout master
  git rebase upstream/master
  popd
fi
