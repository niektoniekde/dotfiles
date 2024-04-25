# dotfiles
Deploy dotfiles to ${DOTPATH} and then install them to ${HOME} using GNU Stow.
Process is self-explaining by bash interpretation bellow.
````bash
DOTPATH="${HOME}/.local/share"; DOTPKG="dotfiles"; \
test -d "${DOTPATH}/${DOTPKG}" || git clone "https://github.com/niektoniekde/dotfiles" "${DOTPATH}/${DOTPKG}"; \
test -d "${DOTPATH}/${DOTPKG}" && cd "${DOTPATH}" && stow -v 2 -t "${HOME}" "${DOTPKG}"
````
