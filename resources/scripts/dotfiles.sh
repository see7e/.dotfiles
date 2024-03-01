# #!/usr/bin/env bash

cd $HOME/dotfiles # just to be sure
RESOURCES= "$1" # Resources location

# Check what shell is being used
SH=".bashrc"
SH_PATH="${HOME}/${SH}"
if [ -f "${HOME}/.zshrc" ]; then
    SH=".zshrc"
    SH_PATH="${HOME}/${SH}"
fi

# Check for Stow
@apt get install stow
# echo ".git" > .stow-local-ignore
# echo ".gitignore" > .stow-local-ignore
echo "install.sh" > .stow-local-ignore
echo "$RESOURCES/*.bak" > .stow-local-ignore
echo "$RESOURCES/.vscode" > .stow-local-ignore # gonna leave this here just for now
echo "$RESOURCES/.dotlist.txt" > .stow-local-ignore
echo "$RESOURCES/scripts/" > .stow-local-ignore
echo "$RESOURCES/theme" > .stow-local-ignore

# Backups
TIMESTAMP=$(date +%s)

mkdir "backups/$TIMESTAMP"
mv $SH_PATH "backups/$TIMESTAMP/$SH"

# # alacritty
# if [ -f ~/.config/alacritty.tom ]; then
#     cp -r ~/.config/alacritty .config
# else
#     @echo "The .tom file of alacritty is not present"
# fi

git pull # in the moment i'm using "static" files, so it only requires a pull

stow .

# Loop to check if every path in the txt file exists
non_existing_paths="" # Initialize a variable to store non-existing paths
while IFS= read -r path; do
    if [ ! -e "$path" ]; then
        non_existing_paths+="$path\n"  # Append the non-existing path to the list
    fi
done < "$RESOURCES/.dotlist.txt"
# Echo the non-existing paths
if [ -n "$non_existing_paths" ]; then
    echo "The following paths do not exist:"
    echo -e "$non_existing_paths"
    exit 1
else
    echo "All dotfiles (links) created."
fi

@echo "----------------------------------------"