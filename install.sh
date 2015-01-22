#!/usr/bin/env bash

# Do all automatable steps to install useful stuff in Ubuntu.

# Install the SSH survival kit:

  #wget -O- https://raw.githubusercontent.com/cirosantilli/linux/master/ubuntu/install.sh | bash -s min-ssh

# To install GUI survival kit use:

  #wget -O- https://raw.githubusercontent.com/cirosantilli/linux/master/ubuntu/install.sh | bash -s min

# Non-automatable steps shall be labelled with: `MANUAL`

## installation procedures

  ## SSH survival kit

    # Packages.

      sudo apt-get update
      sudo apt-get install -y aptitude
      sudo aptitude update

    # git

      sudo aptitude install -y git
      sudo aptitude install -y curl
      mkdir ~/bin
      cd ~/bin
      curl -O https://raw.github.com/git/git/master/contrib/diff-highlight/diff-highlight
      chmod +x diff-highlight

    # Dotfiles: only if not a shared home directory.

      git clone https://github.com/cirosantilli/dotfiles
      cd dotfiles
      #./install.sh

    # Editor

      sudo aptitude install -y vim
      git clone https://github.com/gmarik/vundle.git "$HOME/.vim/bundle/vundle"
      # TODO fails from bash pipe becuase not TTY.
      #vim +PluginInstall +qall

  if [ "$1" = "min-ssh" ]; then exit 0; fi

  ## GUI survival kit

    ## package management

        # Enable all sources: main, universe, restricted, multiverse and partner.
        sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"
        sudo add-apt-repository "deb http://archive.canonical.com/ubuntu $(lsb_release -sc) partner"
        sudo aptitude update
        sudo aptitude install -y apt-rdepends
        sudo aptitude install -y apt-file
        apt-file update
        sudo aptitude install -y ppa-purge
        # Automatically run upgrades without confirmation.
        # TODO automatically accept ncurses confirmation
        sudo dpkg-reconfigure unattended-upgrades

      # Usefull stuff that does not come by default or Canonical would have to pay royalties:

        sudo aptitude install -y ubuntu-restricted-extras

    # GTK theme

      sudo add-apt-repository ppa:noobslab/themes
      sudo apt-get update
      sudo apt-get install gnomishdark

    # Terminal

      sudo aptitude install -y guake

    # Editor

      sudo aptitude install -y vim-gtk

    ## File manager

    ## File manager

      ## Krusader

        sudo aptitude install -y krusader
        # Needed to manage bookmarks,
        # otherwise button does nothing:
        # https://bugs.launchpad.net/ubuntu/+source/krusader/+bug/999695
        sudo aptitude install -y kde-baseapps-bin
        #sudo aptitude install -y konqueror
        # Terminal emulator
        sudo aptitude install -y konsole
        # Help
        #sudo aptitude install -y khelpcenter4
        # Password manager
        sudo aptitude install -y kwalletmanager

        sudo aptitude install -y fdupes

      # Terminal based:

        sudo aptitude install -y lfm
        sudo aptitude install -y mc
        sudo aptitude install -y vifm

    ## Browser

        sudo aptitude install -y chromium-browser

      # Google Chrome: <http://askubuntu.com/questions/79280/how-to-install-chrome-browser-properly-via-command-line>

        wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
        sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
        sudo apt-get update
        sudo apt-get install google-chrome-stable

      ## Flash

        # Ubuntu 12.02:

          #sudo aptitude install -y flashplugin-installer

          sudo aptitude install -y adobe-flashplugin

    # PDF

      sudo aptitude install -y okular okular-extra-backends

    ## Communication

        sudo aptitude install -y pidgin

      # Skype. Source: partner.

        sudo aptitude install -y skype

      # Google talk.

        wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
        sudo sh -c 'echo "deb http://dl.google.com/linux/talkplugin/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
        sudo aptitude update
        sudo aptitude install -y google-talkplugin

      # Hipchat:

        sudo su
        echo "deb http://downloads.hipchat.com/linux/apt stable main" > \
          /etc/apt/sources.list.d/atlassian-hipchat.list
        wget -O - https://www.hipchat.com/keys/hipchat-linux.key | apt-key add -
        apt-get update
        apt-get install hipchat

    # X

      #sudo aptitude install -y xclip
      sudo aptitude install -y xsel
      sudo aptitude install -y wmctrl

    # Media:

      sudo aptitude install -y vlc

    ## Configuration

      # Fundamental system configurations.

      # sudo without password: commented out because only for single user machines:

        #sudo sh -c "echo '$(id -un) ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers"

      # Quick OS system choice and show kernel messages:

        #sudo sh -c "printf 'GRUB_TIMEOUT=1\nGRUB_CMDLINE_LINUX_DEFAULT=""\n'" >> /etc/default/grup"
        #sudo update-grub

      # Autohide launcher:

        # http://askubuntu.com/questions/9865/how-can-i-configure-unitys-launcher-auto-hide-behavior

      # Change esc and caps lock
      # <http://askubuntu.com/questions/363346/how-to-permanently-switch-caps-lock-and-esc>

        sudo apt-get install dconf-tools
        dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"

  if [ "$1" = 'min' ]; then exit 0; fi

  ## Uncategorized

  ## Misc

    # xxencode, BASE64, quoted printable, BinHex

      sudo aptitude install -y uudeview

    # mime messages

      #sudo aptitude install -y mpack

    # Bitcoin

      sudo add-apt-repository -y ppa:bitcoin/bitcoin && sudo aptitude update
      sudo aptitude install -y bitcoin-qt

  ## text

      sudo aptitude install -y dos2unix
      sudo aptitude install -y pcregrep

  ## sysadmin

      sudo aptitude install -y acct
      sudo aptitude install -y finger
      # Multiverse.
      sudo aptitude install -y gddrescue
      sudo aptitude install -y finger
      sudo aptitude install -y htop
      sudo aptitude install -y makepasswd
      sudo aptitude install -y puppet

  ## printer

    # MANUAL

    # Tested for: EPSON xp-202.

    # Type `printer` in dash.

    # The guide shows you everything.

  ## book

    sudo aptitude install -y okular okular-extra-backends
    #sudo aptitude install -y fbreader
    #sudo aptitude install -y calibre

    sudo aptitude install -y pdftk
    sudo aptitude install -y djvulibre-bin

    ## chm

      sudo aptitude install -y chmsee
      sudo aptitude install -y chm2pdf
      sudo aptitude install -y archmage
      #sudo aptitude install -y kchmreader

    # Texlive 2009:

      #sudo aptitude install -y texlive

    # Texlive 2009 full: latex

      #sudo aptitude install -y texlive-full

    # Texlive 2013 full:

      curl https://raw.github.com/cirosantilli/latex-cheat/master/install-texlive2013-ubuntu12.04.sh | bash

      sudo aptitude install -y asciidoc
      sudo aptitude install -y blahtexml

    # Up to date version with `cabal install`.

      sudo aptitude install -y pandoc

  ## audio

    sudo aptitude install -y abcde
    sudo aptitude install -y cplay
    sudo aptitude install -y cuetools
    sudo aptitude install -y flac
    sudo aptitude install -y id3tool
    sudo aptitude install -y lame
    sudo aptitude install -y shntool
    sudo aptitude install -y libportaudio-dev libportaudio-doc
    # pico2wave
    sudo aptitude install -y libttspico-utils
    sudo aptitude install -y wavpack

    sudo add-apt-repository -y ppa:flacon && sudo aptitude update
    sudo aptitude install -y flacon

  ## image

    sudo aptitude install -y aview
    sudo aptitude install -y caca-utils
    sudo aptitude install -y dvipng
    #sudo aptitude install -y exactimage
    sudo aptitude install -y imagemagick
    sudo aptitude install -y imagemagick-doc

    # Graph UML GUI:

      #sudo aptitude install -y dia

    # Batch graph draw CLI:

      #sudo aptitude install -y dot

    # GIMP 2.6: no single window mode.

      #sudo aptitude install -y gimp

    # GIMP 2.8: single window mode.

      sudo apt-add-repository -y ppa:otto-kesselgulasch/gimp && sudo aptitude update
      sudo aptitude install -y gimp

      sudo aptitude install -y inkscape

  ## dict

    sudo aptitude install -y aspell
    sudo aptitude install -y aspell-fr
    sudo aptitude install -y aspell-pt-br
    sudo aptitude install -y goldendict

  ## sox

      sudo aptitude intall -y sox
      sudo aptitude intall -y libsox-fmt-mp3

    # Now search for formats and install those you want:

      #apt-cache search libsox-fmt-

    sudo aptitude install -y sysstat

  ## ocr

    ## tesseract

        sudo aptitude install -y tesseract-ocr

        # MANUAL: find available languages

          #apt-cache search tesseract-ocr-

        # English

          sudo aptitude install -y tesseract-ocr-eng

      #chinese hack

        #sudo aptitude install -y tesseract-ocr-chi-sim #simplified chinese
        #cd /usr/share/tesseract-ocr/tessdata
        #sudo ln -s chi_sim.traineddata zho.traineddata

      sudo aptitude install -y cuneiform

  ## video

    # handbreak

      sudo add-apt-repository -y ppa:stebbins/handbrake-releases
      sudo aptitude install -y handbrake-cli
      #sudo aptitude install -y handbrake-gtk

    # vobsub2srt

      sudo add-apt-repository -y ppa:ruediger-c-plusplus/vobsub2srt
      sudo aptitude update
      sudo aptitude install -y vobsub2srt

    sudo aptitude install -y mkvtoolnix
    sudo aptitude install -y oggvideotools

    # ffmpeg:

      sudo aptitude install -y libav-tools

    ## editors

      # Cinelerra:

        #sudo apt-add-repository ppa:cinelerra-ppa/ppa
        #sudo apt-get update
        #sudo apt-get install cinelerra-cv

      ## pitivi

        # A bit too old, missing key features like multi selection on video line:

          #sudo aptitude install -y libav-tools

        # From source:

          sudo aptitude build-deps -y pitivi
          sudo aptitude install -y libcairo-dev python-cairo-dev itstool
          cd /tmp
          wget -O- http://ftp.gnome.org/pub/GNOME/sources/pitivi/0.93/pitivi-0.93.tar.xz | tar xvz
          cd pitivi-0.93
          ./configure
          make
          sudo make install

  ## compression

      sudo aptitude install -y zip unzip

    #7 zip:

      sudo aptitude install -y p7zip-full

    #.ace files

      #sudo aptitude install -y unace

      sudo aptitude install -y rar
      sudo aptitude install -y unrar

    # Shell archives:

      #sudo aptitude install -y sharutils

    # .arj files:

      #sudo aptitude install -y arj

    # Microsoft cabinet format:

      #sudo aptitude install -y cabextract

    # .lzh files used on DOS, legacy:

      #sudo aptitude install -y lha

      sudo aptitude install -y file-roller

  ## game

    ## getdeb

      # Non Launchapd ppa with lots of good games.

        wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
        # REPLACE precise with the codename for your distro!
        sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu precise-getdeb games" > /etc/apt/sources.list.d/getdeb.list'
        sudo aptitude update
        sudo aptitude install urbanterror
        #sudo aptitude install worldofpadman

    sudo aptitude install -y nethack-console
    sudo aptitude install -y fortune
    sudo aptitude install -y cowsay
    sudo aptitude install -y robotfindskitten
    sudo aptitude install -y bsdgames
    sudo aptitude install -y greed
    #sudo aptitude install -y ninvaders
    sudo aptitude install -y netrek-client-cow
    #sudo aptitude install -y urban-terror
    #sudo aptitude install -y golly
    #sudo aptitude install -y gnotski

    # super maryo chronicles:

      #sudo aptitude install -y smc

      #sudo aptitude install -y wesnoth

      #sudo aptitude install -y supertuxkart

    ## emulator

      ## NES

        sudo aptitude install -y fceux

      ## SNES.

        # 32 bit only:

          sudo aptitude install -y zsnes

        # 64 bit also:

          sudo add-apt-repository ppa:bearoso/ppa
          sudo apt-get update
          sudo apt-get install snes9x-gtk

      ## Nintendo 64

        sudo aptitude install -y mupen64plus

      sudo aptitude install -y desmume
      sudo aptitude install -y pcsxr
      sudo aptitude install -y visualboyadvance-gtk
      sudo aptitude install -y visualboyadvance-gtk

      ## dosbox

          sudo aptitude install -y dosbox

        # MANUAL: get the sound working

          # TODO get working

            #pmidi -l
            #vim "$HOME/.dosbox/dosbox-*.conf"

          # Put the port in:

            #[midi]
            #midiconfig=14:0

          sudo aptitude install -y pmidi

  ## editors

      sudo aptitude install -y eclipse

    ## Libreoffice

        sudo aptitude install -y libreoffice

      # Database editor:

        sudo aptitude install -y libreoffice-base

    ## Atom

      # Requires: node, C++

      # First install a recent node *as root*:

        sudo add-apt-repository ppa:chris-lea/node.js
        sudo apt-get update
        sudo aptitude install -y nodejs

      # Then:

        sudo aptitude install -y libgnome-keyring-dev
        git clone https://github.com/atom/atom
        cd atom
        script/build # Creates application at $TMPDIR/atom-build/Atom
        sudo script/grunt install # Installs command to /usr/local/bin/atom
        script/grunt mkdeb # Generates a .deb package at $TMPDIR/atom-build

  ## terminal emulators

      sudo aptitude install -y yakuake

      sudo aptitutde install -y tmux

      sudo add-apt-repository -y ppa:finalterm/daily
      sudo aptitude update
      sudo aptitude install -y finalterm

  ## program

      sudo aptitude install -y ant
      sudo aptitude install -y automake
      sudo aptitude install -y bison
      sudo aptitude install -y build-essential
      sudo aptitude install -y cmake
      sudo aptitude install -y doxygen
      sudo aptitude install -y doxygen-doc
      sudo aptitude install -y exuberant-ctags
      sudo aptitude install -y flex
      sudo aptitude install -y g++
      sudo aptitude install -y libtool
      sudo aptitude install -y m4

    ## version control

        # Very outdated:
        sudo aptutide install -y tig

        sudo aptitude install -y bzr
        sudo aptitude install -y cvs
        sudo aptutide install -y mercurial
        sudo aptitude install -y subversion

    ## C and C++ gcc g++

      # gcc docs:

        sudo aptitude install -y gcc-doc

      # Installed at: `/usr/share/doc/gcc-doc`

      # gcc and c++ 4.8. Default on Ubuntu 12.04 is 4.6.

        sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
        sudo aptitude -y update
        # GCC
        sudo aptitude install -y gcc-4.8
        sudo aptitude install -y gcc-4.8-doc
        sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 50
        # G++
        sudo aptitude install -y g++-4.8
        sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 50

      # Boost c++

        # Install all packages:

          sudo aptitude install -y libboost-all-dev

      # Blas C / Fotran and lapack fortran:

        sudo aptitude install -y liblapack-dev

      # Lapack C via LAPACKE:

        #sudo aptitude install -y liblapacke-dev

        sudo aptitude install -y libgsl0-dev
        sudo aptitude install -y gsl-doc-info

      # glx utils:

        sudo aptitude install -y mesa-utils

      # Many source code for examples to learn qt4.

        sudo aptitude install -y libqt4-dev
        sudo aptitude install -y qt4-demos

      ## gtk

          sudo aptitude install -y libgtk-3-dev
          sudo aptitude install -y libgtk-3-doc
          sudo aptitude install -y gtk2.0-examples

      ## KDE

        # KDE core dev libs:

          sudo aptitude install -y kdelibs5-dev

        # KDE game development files:

          sudo aptitude install -y libkdegames-dev

      ## Build requirements

        # Stuff that is only needed if you want to develop those programs.

        # VLC:

          sudo aptitude install -y liblua5.1-0-dev libmad0-dev liba52-0.7.4-dev \
            libxcb-composite0-dev libxcb-xv0-dev libxcb-randr0-dev libgcrypt11-dev

        # Konqueror:

          sudo aptitude install -y libkonq5-dev

          sudo aptitude install -y libirrlicht-dev
          sudo aptitude install -y libirrlicht-doc

          sudo aptitude install -y freeglut3-dev

          sudo aptitude install -y libopencv-dev
          sudo aptitude install -y opencv-doc

          sudo aptitude install -y libplplot-dev
          sudo aptitude install -y plplot11-driver-xwin

          sudo aptitude install -y linux-source linux-headers
          #sudo aptitude install -y check
          sudo aptitude install -y libncurses5-dev

    ## Java

      # Java is a pain to make work sometimes.

      # Make sure you get the latest version, or things may not work.

      # If things don't work, do the standard procedure: uninstall everything related to java, and try again.

      # To clear everything, first find all realted packages via:

        dpkg -l | grep -E '(java|openjdk|icedtea)' | grep -iv javascript | perl -F'/\s+/' -lane 'print $F[1]'

      # and then do:

        #sudo aptitude purge $PKG

      # Then install Oracle version (some things only work with it):

        sudo add-apt-repository -y ppa:webupd8team/java
        sudo aptitude update
        sudo aptitude install -y oracle-java8-installer
        sudo aptitude install -y oracle-java7-installer

      # This already comes with the browser plugin.

      # Openjdk version + firefox plugin:

        sudo aptitude install openjdk-7-jre
        sudo aptitude install icedtea-7-plugin

      # Maven 3:

        sudo aptitude install -y maven

      # Maven:

        sudo aptitude install -y maven2

    ## Python

      # pip:

        wget -O- 'https://bootstrap.pypa.io/get-pip.py' | sudo python

      sudo aptitude install -y gunicorn

    ## Ruby

      # RVM and similar are the best method:

        curl -L 'https://get.rvm.io' | bash -s stable
        # WARNING: fails with `-eu`.
        . "$HOME/.rvm/scripts/rvm"
        rvm install '2.1.1'
        # Logout, login, and works for all shells.

      # Brigthbox is maintaining quite a few Rubies on their PPA:

        sudo add-apt-repository ppa:brightbox/ruby-ng
        sudo apt-get update
        sudo aptitude install -y ruby2.1 ruby2.1-dev

    ## Node.js

      ## NVM

          VERSION='0.10.26'
          curl 'https://raw.githubusercontent.com/creationix/nvm/v0.7.0/install.sh' | sh
          # WARNING: fails with `-eu`.
          . "$HOME/.nvm/nvm.sh"
          echo '. "$HOME/.nvm/nvm.sh"
          nvm use "'"$VERSION"'" &>/dev/null
          ' >> "$HOME/.bashrc"
          nvm install "$VERSION"

        # After install, configure with:

          npm config set registry 'http://registry.npmjs.org/'

        # Uninstall:

          rm -rf -- "${HOME}/.nvm" "${HOME}/.npm" "${HOME}/.bower"

      # Package node: old. Use NVM.

        sudo aptitude install -y nodejs

      # NPM: comes together with up to date nodes.

      # Good up to date PPA, but NVM is better:

        sudo add-apt-repository ppa:chris-lea/node.js
        sudo apt-get update
        sudo aptitude install -y nodejs

    ## Go

        # Requires: mercurial, bison.
        if [ ! -f "$HOME/.gvm/scripts/gvm" ]; then
          bash < <(curl -LSs 'https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer')
        fi
        . "$HOME/.gvm/scripts/gvm"
        gvm install 'go1.2.2'
        gvm use 'go1.2.2' --default

    ## Lua

        #sudo aptitude install -y lua5.2

      # Not compatible with lua5.2: already requires lua5.1:

        #sudo aptitude install -y luarocks

      # TODO even if installaed alone some packages installed with it fail.

      # Manual install:

        dir='luarocks'
        cd '/tmp'
        git clone https://github.com/keplerproject/luarocks "$dir"
        cd "$dir"
        git checkout "$(git describe --tags --abbrev=0)"
        ./configure
        make
        sudo make install
        cd '..'
        rm -rf -- "$dir"

    ## Virtualization ##VM

      # MANUAL: don't forget to enable virtualization on your BIOS when using virtualization tools.
      # Some features may only be available with it enabled.

      ## Virtualbox

          wget -q -O - http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc | sudo apt-key add -
          sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian precise non-free contrib" >> /etc/apt/sources.list.d/virtualbox.org.list'
          sudo aptitude update
          sudo aptitude install -y virtualbox-4.3

        # On the guest:

          #sudo aptitude install virtualbox-guest-utils

        ## vagrant

          # MANUAL download:

            firefox http://www.vagrantup.com/downloads.html
            cd download_dir
            sudo dpkg -i vagrant*.deb

          # Aptitude install failed on 12.04 and is generally too old.

            #sudo aptitude install -y vagrant

      ## docker

        # Only exists for 64 bit, not 32.
        # Instructions at: http://docs.docker.io/en/latest/installation/ubuntulinux/

          sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-keys '36A1D7869245C8950F966E92D8576A8BA88D21E9'
          sudo sh -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
          sudo aptitude update
          sudo aptitude install -y lxc-docker

        ## drone

            cd /tmp
            wget http://downloads.drone.io/latest/drone.deb
            sudo dpkg -i drone.deb

        ## jenkins

            wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
            sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
            sudo apt-get update
            sudo aptitude install -y jenkins

      ## wine

          sudo add-apt-repository ppa:ubuntu-wine/ppa
          sudo aptitudeapt-get update
          sudo aptitude install -y wine1.7
          sudo aptitude install -y winetricks
          winetricks winxp d3dx9 vcrun2005 vcrun2008 wininet corefonts

      # play on linux:

          sudo aptitude install -y playonlinux

    ## perl

      # Interpreters and related libs.

        sudo aptitude install -y perl-doc

    ## haskell

      # Glasgow Haskell Compiler:

        #sudo aptitude install -y ghc

      # Glasgw Haskell Compiler, libs, package manager, etc. Convenient.

        sudo aptitude install -y haskell-platform
        echo ''

        printf '\nexport PATH="$PATH:$HOME/.cabal/bin"\n' >> "$HOME/.profile"

        # Because Ubuntu's default `.profile` sources `.bashrc` which does `[ -z "$PS1" ]`, which fails on `-u`.
        # Only needed if you will run downloaded binaries immediately.
        export PS1=''
        . "$HOME/.profile"

        cabal update

    ## fortran

      # GNU fortran 77:

        sudo aptitude install -y g77

      # GNU fortran 95:

        sudo aptitude install -y gfortran

      sudo aptitude install -y nasm

  ## fs

      sudo aptitude install -y gparted
      sudo aptitude install -y inotify-tools

  ## net

      sudo aptitude install -y apache2
      sudo aptitude install -y libapache2-mod-fastcgi

      sudo aptitude install -y mongodb-client
      sudo aptitude install -y mongodb-server

      sudo aptitude install -y ngrok-client
      sudo aptitude install -y ngrok-server
      sudo aptitude install -y nmap
      sudo aptitude install -y openssh-client
      sudo aptitude install -y openssh-server
      sudo aptitude install -y squid3

      sudo aptitude install -y tomcat7
      sudo aptitude install -y tomcat7-admin
      sudo aptitude install -y tomcat7-docs
      sudo aptitude install -y tomcat7-examples

      sudo aptitude install -y traceroute
      sudo aptitude install -y tshark
      sudo aptitude install -y whois
      sudo aptitude install -y wireshark

    ## PHP

        sudo aptitude install -y php5

      # php Apache module:

        sudo aptitude install -y libapache2-mod-php5
          #Will ask you to initialize the password for the `root` user.
        sudo aptitude install -y sqlite

    ## phpmyadmin

      # First make sure that php and mysql are installed.

        sudo aptitude install -y libapache2-mod-auth-mysql php5-mysql phpmyadmin

        sudo vim /etc/apache2/apache2.conf

      # Ensure following line is anywhere in the file:

        #Include /etc/phpmyadmin/apache.conf

        sudo service apache2 restart

      # Test phpmyadmin and mysql:

        firefox http://localhost/phpmyadmin &

      # Login: 'root'. password: what you entered at installation.

    ## phantomjs

      # Very outdated:

        #sudo aptitude install -y phantomjs

      # Latest precompiled stable:

        cd /usr/local/share
        arch="$(uname -i)"
        sudo wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.7-linux-$arch.tar.bz2
        sudo tar xjf phantomjs-1.9.7-linux-$arch.tar.bz2
        sudo ln -s /usr/local/share/phantomjs-1.9.7-linux-$arch/bin/phantomjs /usr/local/share/phantomjs
        sudo ln -s /usr/local/share/phantomjs-1.9.7-linux-$arch/bin/phantomjs /usr/local/bin/phantomjs
        sudo ln -s /usr/local/share/phantomjs-1.9.7-linux-$arch/bin/phantomjs /usr/bin/phantomjs

      # Build from source takes too long (30 min +).

    ## browser

      # Terminal web browser:

        sudo aptitude install -y w3m w3m-img

      # Tor:

        sudo add-apt-repository ppa:webupd8team/tor-browser
        sudo apt-get update
        sudo apt-get install tor-browser

    ## db

      # MySQL:

        sudo aptitude install -y mysql-server

      ## remove mysql

        # Sometimes, misterious forces will prevent you mysql server from starting
        # and you will fell like erasing everything and restarting.
        # purging mysql-server may not be enough.
        # A hardcore solution that causes dataloss that worked for me once use:

          #sudo aptitude purge -y mysql-server
          #sudo aptitude purge -y mysql-common
          #sudo rm -rf /var/log/mysql
          #sudo rm -rf /var/log/mysql.*
          #sudo rm -rf /var/lib/mysql
          #sudo rm -rf /etc/mysql
          #sudo aptitude install -y mysql-server

        sudo aptitude install -y libmysqld-dev
        sudo aptitude install -y libmysqlclient-dev
        sudo aptitude install -y libmysql++-dev
        sudo aptitude install -y libmysql++-doc
        sudo aptitude install -y libmysqlcppconn-dev

      # PostgreSQL:

        sudo aptitude install -y libpq-dev
        sudo aptitude install -y postgresql
        sudo aptitude install -y postgresql-client
        # GUI PG viewer / editor. Not browser based.
        sudo aptitude install -y pgadmin3

      # Redis

        # Server and cli client:

          sudo aptitude install -y redis-server

        # More recent:

          sudo apt-add-repository ppa:chris-lea/redis-server
          sudo aptitude update
          sudo aptitude install -y redis-server

      # MongoDB server and cli client:

        sudo aptitude install -y mongodb

    ## mail

        sudo aptitude install -y mutt
        sudo aptitude install -y ssmtp

      # Conflicts with ssmtp:

        #sudo aptitude install -y postfix

  ## desktop

        sudo aptitude install -y xbacklight
        sudo aptitude install -y xsel
        sudo aptitude install -y wmctrl
        sudo aptitude install -y xdotool

        #sudo apt-add-repository ppa:cdekter/ppa
        #sudo aptitude install -y autokey-gtk

      # Modify GTK theme:

        sudo aptitude install -y gnome-tweak-tool

        sudo aptitude install -y compizconfig-settings-manager

      #sudo aptitude install zenity

      #sudo add-apt-repository ppa:webupd8team/y-ppa-manager && sudo aptitude update
      #sudo aptitude install -y yad

      sudo aptitude install -y alarm-clock-applet
      # GNOME tweak tool:
      sudo aptitude install -y gconf-editor
      sudo aptitude install -y logkeys
      sudo aptitude install -y recordmydesktop
      sudo aptitude install -y gtk-recordmydesktop
      sudo aptitude install -y guvcview

      # ibus input methods for QT:
      sudo aptitude install -y ibus-qt4
      # Useful for example if you want Chinese input for Qt applications.

      sudo add-apt-repository -y ppa:tualatrix/ppa && sudo aptitude update
      sudo aptitude install -y ubuntu-tweak

      sudo add-apt-repository -y ppa:atareao/atareao && sudo aptitude update
      sudo aptitude install my-weather-indicator

      sudo add-apt-repository -y ppa:daniel.pavel/solaar && sudo aptitude update
      sudo aptitude install -y solaar

      git clone https://git.lekensteyn.nl/ltunify.git
      cd ltunify
      make install-home

    ## desktop system

      # Gnome shell:

        sudo add-apt-repository -y ppa:gnome3-team/gnome3 && sudo aptitude update
        sudo aptitude install -y gnome-shell

      # Linux Mint shell cinnamon:

        sudo add-apt-repository -y ppa:gwendal-lebihan-dev/cinnamon-stable && sudo aptitude update
        sudo aptitude install -y cinnamon

      # KDE shell plasma:

        sudo aptitude install -y kde-plasma-desktop

      # Xubuntu shell xfce:

        sudo aptitude install -y xfce4
        sudo aptitude install -y xfce4-battery-plugin

      # Lubuntu lxde:

        sudo aptitude install -y lxde

      #  For `qtconfig-qt4`:

        sudo aptitude install -y qt4-qtconfig

  ## file sharing

    ## torrent

      #deluge

        sudo add-apt-repository -y ppa:deluge-team/ppa
        sudo aptitude update
        sudo aptitude install -y deluge

    #dropbox

      # Also installs dropbox, not just nautilus extension.

        sudo aptitude install -y nautilus-dropbox

    #ubuntuone taskbar indicator

      sudo add-apt-repository -y ppa:noobslab/initialtesting
      sudo apt-get update
      sudo aptitude install indicator-ubuntuone

    ## soulseek

      sudo aptitude install -y nicotine+

    ## ftp

      # Very secure FTP deamon FTP server:

        sudo aptitude install -y vsftpd

      sudo aptitude install -y filezilla

      # Higher level FTP operations such as recursive dir addition:

        sudo aptitude install -y lftp

    sudo aptitude install -y samba

  ## GPU

    # Nvidia.

      sudo aptitude install -y nvidia-319
      sudo aptitude install -y nvidia-settings-319
      sudo aptitude install -y nvidia-prime
      sudo aptitude install -y nvidia-opencl-dev

  ## encoding

      sudo aptitude install convmv

  ## init

      sudo aptitude install -y chkconfig

  ## PaaS

    ## Google

      # Google Compute Engine gcutil

        curl https://dl.google.com/dl/cloudsdk/release/install_google_cloud_sdk.bash | bash
