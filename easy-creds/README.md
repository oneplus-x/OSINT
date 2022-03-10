# v3.8-dev Garden of New Jersey

Purpose:
This script leverages tools for stealing credentials during a pen test.

This version has gone through a complete code cleanup -> Thanks al14s & zero_chaos

Added - Macchanger thx to SilverFoxx
Added - Prerequisite test

########################################################################

1. Prereqs
2. Installation
3. Working with easy-creds in screen
4. Instructional videos

1. Prereqs:

* screen
* freeradius (with wpe patches)
* hamster
* ferret
* sslstrip
* dsniff
* urlsnarf
* metasploit
* airbase-ng
* airodump-ng
* hostapd
* mdk3
* ipcalc
* asleap


2. Installation:

Most can be installed from repos, we've included some instruction on installing from source when helpful.

easy-creds is available in some Linux distros already, so before spending a lot of time, try just installing it with your package manager.

If easy-creds is not available already in the repo for your distro please open a bug for them (no us) to add it, then feel free to follow the directions below:

To install SOME of the dependencies for debian/ubuntu based distros use the following command:

apt-get install screen hostapd dsniff dhcp3-server ipcalc aircrack-ng

###
aircrack-ng suite

There are known issues for airbase-ng with the base v1.1 version included in many distros. If that is what your distro provides it is recommended that you grab the latest nightly build from 
the SVN repo and recompile.

Full instructions for installing aircrack-ng available here:
http://www.aircrack-ng.org/doku.php?id=install_aircrack

Follow either svn or nightly tarball guide:
http://www.aircrack-ng.org/doku.php?id=install_aircrack#latest_svn_development_sources
http://www.aircrack-ng.org/doku.php?id=install_aircrack#nightly_build


## freeradius-wpe

The freeradius in the repo most likely does not include the wpe patch. It is best to install from source unless you are using a distro that already applied this very non-standard patch:

	wget ftp://ftp.freeradius.org/pub/radius/old/freeradius-server-2.1.11.tar.bz2 -O /tmp/freeradius-server-2.1.11.tar.bz2
	wget http://www.opensecurityresearch.com/files/freeradius-wpe-2.1.11.patch -O /tmp/freeradius-wpe-2.1.11.patch
	cd /tmp
	tar xf freeradius-server-2.1.11.tar.bz2
	mv freeradius-wpe-2.1.11.patch /tmp/freeradius-server-2.1.11/freeradius-wpe-2.1.11.patch
	cd freeradius-server-2.1.11
	patch -p1 < freeradius-wpe-2.1.11.patch
	./configure && make && make install
	cd /usr/local/etc/raddb/certs/
	./bootstrap

## Hamster & Ferret

	mkdir /opt/sidejack
	cd /tmp
	wget http://www.erratasec.com/erratasec.zip -O /tmp/erratasec.zip
	unzip erratasec.zip
	cd hamster/build/gcc4/
	make
	cp /tmp/ec-install/hamster/bin/* /opt/sidejack
	rm -rf /tmp/ferret

	svn checkout http://ferret.googlecode.com/svn/trunk/ /tmp/ferret
	cd /tmp/ferret/
	make
	cp /tmp/ferret/bin/ferret /opt/sidejack/ferret

## asleap

Asleap may be available in your package manager, if not, you can install like this:

	wget http://www.willhackforsushi.com/code/asleap/2.2/asleap-2.2.tgz -O /tmp/asleap.tgz
	cd /tmp
	tar xf asleap.tgz
	cd asleap
	make
	cp asleap /usr/local/sbin
	cp genkeys /usr/local/bin

## MDK3

	wget http://homepages.tu-darmstadt.de/~p_larbig/wlan/mdk3-v6.tar.bz2 -O /tmp/mdk3-v6.tar.bz2
	cd /tmp
	tar xf mdk3-v6.tar.bz2
	cd mdk3-v6
	make && make install

3. Working with easy-creds within a screen

I don't want to assume everyone is perfectly comfortable with screen, but please read some tutorials from the web.

easy-creds will look for X windows running, but shouldn't find it on the pwnie and launch everything in a screen sessions. This can feel a bit like Inception once you're in a screen within a screen

The main thing to remember is once the easy-creds screen session launches you should do the following from command prompt.

screen -list (you should see the easy-creds session)
screen -r easy-creds

You are now interacting with the easy-creds screen session. Normally to view your screens you would press ctrl-a then " and this will show you what screens you have open in the session.

Where it gets tricky is when you have a screen session, then launch another screen session (easy-creds attacks). When that happens you will need to do the following:

ctrl-a then a then "

That extra 'a' lets the screen program know you want to work with the inner screen session.

Yes it is confusing a bit at first but you'll get the hang of it.

4. Instructional Videos:
Instructional videos can be found here -> http://www.youtube.com/user/Brav0Hax

Even if the version is not the same, the base functionality is.

[Happy hunting!!](mailto:jbrav.hax@gmail.com)

