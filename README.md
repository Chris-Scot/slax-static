# slax-static
Build modules &amp; tamper before committing to squashfs

Slax already has an excellent method of creating your own bespoke modules, savechanges.  It will most probably be used for including packages in a secure, efficient way.  Although savechanges will create a squashfs filesystem (ready to use), I find I need to tamper with the installation.

Repeating any installation, fixing your mistakes then savechanges again can be annoying.  So I invented savestatic.  This script is built from savechanges except, rather than making a squashfs filesystem, the changes are copied to a directory.  …/slax/static/.

You can mount &amp; umount this directory as if it were a module, change the contents & re-test the new configuration.  Repeat until you are happy.  Then, save the static as a squashfs module.  At this point the static directory is hidden (.directory) so is not mounted during boot (only directories starting 00 - 99 will be mounted).  When you are absolutely sure you have what you want and the squashfs module is working as required, you can delete the hidden static directory.

Static directory mounts work well as they are, without the need to convert to squashfs but you will not receive the benefit of compression.  They have the advantage over installing software in that they will persist if you start a clean session.  This can be a problem if you are short on RAM and you boot to ram.  If I remember, I shall modify preinit.sh so statics aren’t loaded with this option.  Until then rename the static directory.

The names of the scripts are self explanatory.

<B>lsaufs</B>  Will show how the filesystem is assembled (including static). <BR>
<B>savestatic</B>  Copy changes to a static directory. <BR>
<B>mountstatic</B>  Adds a static directory into the aufs filesystem. <BR>
<B>umountstatic</B>  Removes a static directory from the aufs filesystem. <BR>
<B>static2squash</B>  Create a squashfs filesystem from a static directory.

You can include these scripts in a static module of their own.

Note.  In this example, slax is installed on /dev/sda1.
Ensure the slax directory is available

It is best to mount the static directories along with the squashfs modules during the initrfs stage.
There is a hook in the default slax distribution which we can take advantage of.
To achieve this, create the prescribed path within the slax directory. <BR>
<B>mkdir -p /media/sda1/slax/rootcopy/run</B><BR>
Copy the preinit.sh script into the prescribed path and ensure it is executable. <BR>
<B>chmod 744 /media/sda1/slax/rootcopy/run/preinit.sh</B>

Create a directory.  Note "static" is hard coded.  (I know.  Don't give me a hard time) <BR>
<B>mkdir -pm 775 /media/sda1/slax/static/10-base/usr/local/bin</B>

Copy the scripts into this directory.
