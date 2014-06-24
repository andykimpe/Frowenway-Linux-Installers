#!/bin/bash
#Téléchargement et extraction de FrozenWay
cd
sudo rm -rf "FrozenWay 1."*
ARCH=$(uname -m)
if [ "$ARCH" == "x86_64" ]
then
FROZENWAY="FrozenWay 1.6.5 x86_64.tar.gz"
else
FROZENWAY="FrozenWay 1.6.5 i386.tar.gz"
fi
wget "http://www.frozenway.com/downloads/$FROZENWAY"
tar -xvf "$FROZENWAY"
rm -f "$FROZENWAY"


#Mise à jour openvpn


rm -f "$HOME/FrozenWay 1.6.5/bin/openvpn"
mkdir $HOME/openvpn-build
cd $HOME/openvpn-build
wget http://swupdate.openvpn.org/community/releases/openvpn-2.3.4.tar.gz
tar -xvf openvpn-2.3.4.tar.gz
cd openvpn-2.3.4
./configure
make
install -c $HOME/openvpn-build/openvpn-2.3.4/src/openvpn/openvpn "$HOME/FrozenWay 1.6.5/bin/openvpn"
cd
rm -rf $HOME/openvpn-build


#Configurer la sécurité de FrozenWay


sudo "$HOME/FrozenWay 1.6.5/bin/FrozenWayHelper" secure

echo "Installation de FrozenWay Terminer"
exit
