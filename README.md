This Vagrant ([What is vagrant?](https://www.vagrantup.com/about.html "vagrant")) configuration is intented to be used for development of [gewisweb](https://github.com/GEWIS/gewisweb "gewisweb"). To get started all you need is a fresh copy of the code from the git repo and then this Vagrant configuration will take care of the rest for you. Dependencies and the database schema are kept up to date automatically for you. All initial setup happens automatically as well.

### Setup instructions
0. Install [Vagrant](https://www.vagrantup.com/downloads.html "Vagrant") and [Virtualbox](https://www.virtualbox.org/wiki/Downloads "Virtualbox")
1. Open puphet/config.yaml in your favorite text editor.
2. Replace /path/to/your/gewisweb by the path where your gewisweb files are located.
3. Run the start.bat script on windows or the start.sh script on mac or linux or just use `vagrant up` from the command line.
4. Vagrant will now do the initial setup and configuration, this will take a while.
5. For optimal usage edit your hosts file:

   Windows: `C:\windows\system32\drivers\etc\hosts`

   Linux and OS X: `/etc/hosts`

   Add the following two lines:
   ```
   192.168.42.42 gewisweb.dev
   192.168.42.42 pma.dev
   ```
6. You should now be able to access gewisweb at gewisweb.dev and phpmyadmin at pma.dev
7. To stop the vm use stop.bat or stop.sh or `vagrant halt` from the command line

### Additional features
You can enter the virtual machine at any time using `vagrant ssh` to make changes or to test things as needed. In many cases Vmware will offer some increased performance of virtual box. If you have Vmware installed you can edit the config.yaml file to use Vmware instead of Virtualbox.
