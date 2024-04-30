for Each in $(ls -1d $DATA/static/[0-9][0-9]-* 2>/dev/null); do
   if [ -d "$Each" ]; then
      if grep -q "^$Each=" /sys/fs/aufs/si_*/br[0-9]*; then
         echo "$Each already mounted."
      else
         mount -o remount,add:1:$Each=ro $1
      fi
   fi
done

cat $(ls -1 /sys/fs/aufs/si_*/br[0-9]*|sort -t/ -nk6.3)
