folder_file=$HOME/.folder_base
config_file=$HOME/.config_base
command_file=$HOME/.command_base
misc_file=$HOME/.misc_base
alias_file=$HOME/.aliases

rm $HOME/.aliases

echo "# vi: syntax=zsh" >> $alias_file
echo -e "\n# Folder aliases\n" >> $alias_file
sed "/^#/d" $folder_file | awk '{print "alias "$1"=\"cd "$2"\""}' >> $alias_file
echo -e "\n# Config files aliases\n" >> $alias_file
sed "/^#/d" $config_file | awk '{print "alias "$1"=\"vim "$2"\""}' >> $alias_file
echo -e "\n# Command aliases\n" >> $alias_file
sed "/^#/d" $command_file | awk '{print "alias "$1"=\""$2" "$3"\""}' >> $alias_file
echo -e "\n# Function based aliases\n" >> $alias_file
sed "1d" $misc_file >> $alias_file

source ~/.zshrc
