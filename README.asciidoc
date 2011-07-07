:Author:    Igor Ramos Tiburcio
:Revision:  0.1

== Simple vim config

=== How to install

.Clone this repo

[source,shell]
git clone git://github.com/irtigor/irtvim.git ~/.irtvim

.Init and update submodules

[source,shell]
git submodule init
git submodule update

.Link

[source,shell]
ln -s ~/.irtvim/vimrc ~/.vimrc
ln -s ~/.irtvim/vim ~/.vim

=== How to update

[source,shell]
cd ~/.irtvim
git pull
git submodule update

=== How to uninstall

[source,shell]
unlink ~/.vim
unlink ~/.vimrc
rm -rf ~/.irtvim
