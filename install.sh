repository=$(cd $(dirname $0);pwd)

find . -regex "^\.\/\.[a-z.]+$" |
sed -e "s/.\///" |
while read dotfile
do
  case ${dotfile} in
    .git) continue;;
  esac

  ln -sf ${repository}/${dotfile} ${HOME}/${dotfile}
  echo "ln -sf ${repository}/${dotfile} ${HOME}/${dotfile}"
done
