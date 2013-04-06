#!/bin/bash
# Update script for handling dotfiles
# Script mainly taken from https://github.com/durdn/cfg



debug=false;
version="0.1";
home=$HOME;
dotfilesname=".dotfiles";
bkpname=".dotfiles_backup";
gitrepo="git@github.com:TheMiles/dotfiles.git";
gitrepo_ro="git://github.com/TheMiles/dotfiles.git";
gitrepo_zip="https://github.com/TheMiles/dotfiles/archive/master.zip"
ignored="update.sh|.git$|.gitmodule|.gitignore|README.md";

#----debug setup----
#home=$1
#gitrepo=$2;
#------------------

dotfiles_folder=$home/$dotfilesname;
backup_folder=$home/$bkpname;

function md5prog {
  if [ $(uname) == "Darwin" ]; then
    md5 -q $1
  fi
  if [ $(uname) == "Linux" ]; then
    md5sum $1 | awk {'print $1'}
  fi
}

function update_submodules {
  return;
  if [ $debug == true ];
    then
      cd $dotfiles_folder
      echo "|- initializing submodules [fake]"
      echo "|- updating submodules [fake]"
    else
      echo "|* initializing submodules"
      cd $dotfiles_folder && git submodule -q init
      echo "|* updating submodules"
      cd $dotfiles_folder && git submodule update
  fi
}

function link_assets {
  for asset in $assets ;
  do
    if [ ! -e $home/$asset ];
    then
      #asset does not exist, can just copy it
      echo "N [new] $home/$asset";
      if [ $debug == false ];
        then ln -s $dotfiles_folder/$asset $home/$asset;
        else echo ln -s $dotfiles_folder/$asset $home/$asset;
      fi
    else
      #asset is there already
      if [ -d $home/$asset ];
      then
        if [ -h $home/$asset ];
        then echo "Id[ignore dir] $home/$asset";
        else
          echo "Cd[conflict dir] $home/$asset";
          mv $home/$asset $backup_folder/$asset;
          ln -s $dotfiles_folder/$asset $home/$asset;
        fi
      else
        ha=$(md5prog $home/$asset);
        ca=$(md5prog $dotfiles_folder/$asset);
        if [ $ha == $ca ];
        #asset is exactly the same
        then
          if [ -h $home/$asset ];
          #asset is exactly the same and as link, all good
          then echo "I [ignore] $home/$asset";
          else
            #asset must be relinked
            echo "L [re-link] $home/$asset";
            if [ $debug == false ];
            then
              mv $home/$asset $backup_folder/$asset;
              ln -s $dotfiles_folder/$asset $home/$asset;
            else
              echo mv $home/$asset $backup_folder/$asset;
              echo ln -s $dotfiles_folder/$asset $home/$asset;
            fi
          fi
        else
          #asset exist but is different, must back it up
          echo "C [conflict] $home/$asset";
          if [ $debug == false ];
          then
            mv $home/$asset $backup_folder/$asset;
            ln -s $dotfiles_folder/$asset $home/$asset;
          else
            echo mv $home/$asset $backup_folder/$asset;
            echo ln -s $dotfiles_folder/$asset $home/$asset;
          fi
        fi
      fi
    fi
  done
}

echo "|* dotfiles version" $version
echo "|* debug is" $debug
echo "|* home is" $home
echo "|* backup folder is" $backup_folder
echo "|* dotfiles folder is" $dotfiles_folder

if [ ! -e $backup_folder ];
  then mkdir -p $backup_folder;
fi

#clone config folder if not present, update if present
if [ ! -e $dotfiles_folder ];
then 

  if [[ -z $(command -v git) ]]
  then

    #git is not available, juzt unpack the zip file
    echo "|* git not available downloading zip file..."
    curl -LsO $gitrepo_zip
    unzip master.zip
    mv dotfiles-master $dotfiles_folder
    rm master.zip

  else

    #git is available, clone from repo
    echo "|* git clone from repo $gitrepo"
    git clone --recursive $gitrepo $dotfiles_folder;

    if [ ! -e $dotfiles_folder ];
    then

      echo "!!! ssh key not installed on github for this box, cloning read only repo"
      git clone --recursive $gitrepo_ro $dotfiles_folder
      echo "|* changing remote origin to read/write repo: $gitrepo"
      cd $dotfiles_folder && git config remote.origin.url $gitrepo

      if [ -e $home/id_rsa.pub  ];
      then

        echo "|* please copy your public key below to github or you won't be able to commit";
        echo
        cat $home/.ssh/id_rsa.pub
      else

        echo "|* please generate your public/private key pair with the command:"
        echo
        echo "ssh-keygen"
        echo
        echo "|* and copy the public key to github"
        echo "|* more details: https://help.github.com/articles/generating-ssh-keys"
      fi

    else

      update_submodules

    fi
  fi
else

  echo "|* dotfiles already cloned to $dotfiles_folder"
  echo "|* pulling origin master"
  cd $dotfiles_folder && git pull origin master
  update_submodules

fi

assets=$(ls -A1 $dotfiles_folder | egrep -v $ignored | xargs);
echo "|* tracking assets: [ $assets ] "
echo "|* linking assets in $home"
link_assets
