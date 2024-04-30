# slax-static
Build modules &amp; tamper before comitting to squashfs

You can include these scripts in a static module of their own.

Note.  In this example, slax is installed on /dev/sda1.
Ensure the slax directory is available

It is best to mount the static directories along with the squashfs modules during the initrfs stage.
There is a hook in the default slax distribution which we can take advantage of.
To achieve this, create the prescribed path within the slax directory.
<B>mkdir -p /media/sda1/slax/rootcopy/run</B>
Copy the preinit.sh script into the prescribed path and ensure it is executable.
<B>chmod 744 /media/sda1/slax/rootcopy/run/preinit.sh</B>

Create a directory.  Note "static" is hard coded.  (I know.  Don't give me a hard time)
<B>mkdir -pm 775 /media/sda1/slax/static/10-base/usr/local/bin</B>

Copy the script into this directory.
