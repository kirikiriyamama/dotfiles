repository=$(cd $(dirname $0);pwd)

find ${repository} -regex "${repository}/\.[a-z.]+$" |
sed -e "s|${repository}/||" |
while read dotfile
do
  case ${dotfile} in
    .git) continue;;
  esac

  ln -sf ${repository}/${dotfile} ${HOME}/${dotfile}
  echo "ln -sf ${repository}/${dotfile} ${HOME}/${dotfile}"
done

if [ ! -d ${HOME}/.zsh ]; then
  mkdir ${HOME}/.zsh
  echo "mkdir ${HOME}/.zsh"
fi
if [ ! -f ${HOME}/.zsh/.zshrc ]; then
  touch ${HOME}/.zsh/.zshrc
  echo "touch ${HOME}/.zsh/.zshrc"
fi
