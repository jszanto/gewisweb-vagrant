1) open puphet/config.yaml in your favorite text editor.
2) replace /path/to/your/gewisweb by the path where your gewisweb files are located.
3) run the start.bat script on windows or the start.sh script on mac or linux or just use vagrant up from the command line.
4) Vagrant will now do the initial setup and configuration, this will take a while.
5) For optimal usage edit your hosts file:

Windows: c:\windows\system32\drivers\etc\hosts

Linux and OS X: /etc/hosts

Add the following two lines:
192.168.42.42 gewisweb.dev
192.168.42.42 pma.dev

6) you should now be able to access gewisweb at gewisweb.dev and phpmyadmin at pma.dev
7) To stop the vm use stop.bat or stop.sh or vagrant halt from the command line
