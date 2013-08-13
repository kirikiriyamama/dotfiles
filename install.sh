repository=$(cd $(dirname $0);pwd)

find ${repository} -regex "${repository}/\.[a-z.]+$" |
sed -e "s|${repository}/||" |
while read dotfile
do
  case ${dotfile} in
    .git) continue;;
    .gitmodules) continue;;
    .gitignore) continue;;
  esac

  ln -sf ${repository}/${dotfile} ${HOME}/${dotfile}
  echo "ln -sf ${repository}/${dotfile} ${HOME}/${dotfile}"
done

ln -sf ${repository}/oh-my-zsh ${HOME}/oh-my-zsh
echo "ln -sf ${repository}/oh-my-zsh ${HOME}/oh-my-zsh"
