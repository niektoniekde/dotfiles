#! /usr/bin/env bash
DOTPATH="${HOME}/.local/share/dotfiles"
DRYRUN="-n"

if [[ -n ${1} && ${1} == "deploy" ]]; then
  DRYRUN=""
fi

if [[ -z ${DOTPATH} ]]; then
  DOTPATH="."
fi
  
if [[ ! -d ${DOTPATH} ]]; then
  exit 100
fi

while read -r DOTPKG; do
  if [[ -d "${DOTPATH}/${DOTPKG}" ]]; then
    stow ${DRYRUN} --ignore='^\.git$' -v 2 -t "${HOME}" "${DOTPKG}"
  fi
done <<< $(ls ${DOTPATH})
