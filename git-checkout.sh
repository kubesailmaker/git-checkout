#!/bin/sh

: "${GIT_PROTOCOL:=ssh}"

if [[ -z ${GIT_PROJECTS} ]];
then
  echo GIT_PROJECTS must be configured.
  exit 1;
fi;

if [[ ${GIT_TOKEN_FILE} ]];
then
  GIT_TOKEN=$(cat ${GIT_TOKEN_FILE})
fi;

for x in ${GIT_PROJECTS[@]}
do
  IFS=',' read -r project folder branch <<< "$x";
  echo project $project

  git_url=""

  if [[ $GIT_TOKEN ]] && [[ $GIT_USER ]];
  then
    git_url=${GIT_PROTOCOL}://${GIT_USER}:${GIT_TOKEN}@${GIT_BASE}/${project}
  else
    git_url=${GIT_PROTOCOL}://${GIT_BASE}/${project}
  fi;
  if [[ -z $branch ]];
  then
    branch="master"
  fi;
  echo ${git_url} to ${folder}, checkout branch ${branch} 
  git clone --single-branch --branch $branch ${git_url} ${folder}
  last_cd=$?
  if [[ ${last_cd} -ne 0 ]];
  then
    echo "error checking out ${branch} from ${git_url} folder=\"${folder}\""
  fi;
done;



