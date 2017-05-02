[ ! -r /etc/onabase ] && echo "[$0] ERROR: Unable to read /etc/onabase." && exit 1
ONABASE=`cat /etc/onabase`

# make sure they have netcat
type -P netcat &>/dev/null || { echo "Unable to find netcat binary. Please install netcat (http://netcat.sf.net)." >&2; exit 1; }  

# Remove existing symlinks
# cisco_cmd is not in this list as it is a special case below
# cisco_ucs_cmd is not in this list as it is a special case below
# netscreen_cmd is not in this list as it is a special case below
BINARIES=( \
  "cfg_archive" \
  "cfg_archive_procspool" \
  "cfg_archive_cisco_trapscript" \
  "cisco_cfg_snmp" \
  "cisco_cfg_expect" \
  "cisco_asa_cmd" \
  "motorola_wing_cmd" \
  "juniper_cmd" \
  "extreme_networks_cmd" \
)
for BINARY in "${BINARIES[@]}"
do
  [ -f $ONABASE/bin/$BINARY ] && rm $ONABASE/bin/$BINARY
  ln -s $ONABASE/www/local/plugins/cfg_archive/bin/$BINARY $ONABASE/bin/$BINARY
done

# special case binaries
[ -f $ONABASE/bin/cisco_cmd ] && rm $ONABASE/bin/cisco_cmd
ln -s $ONABASE/bin/cisco_cfg_expect $ONABASE/bin/cisco_cmd
[ -f $ONABASE/bin/cisco_ucs_cmd ] && rm $ONABASE/bin/cisco_ucs_cmd
ln -s $ONABASE/bin/cisco_cfg_expect $ONABASE/bin/cisco_ucs_cmd
[ -f $ONABASE/bin/netscreen_cmd ] && rm $ONABASE/bin/netscreen_cmd
ln -s $ONABASE/bin/juniper_cmd $ONABASE/bin/netscreen_cmd
[ -f $ONABASE/bin/f5_cmd ] && rm $ONABASE/bin/f5_cmd
ln -s $ONABASE/bin/cisco_cfg_expect $ONABASE/bin/f5_cmd

# Move our initial configuration files into place
# Only copy the file over it it does not already exist.
for FILE in $(ls ./etc)
do
  [ -f $ONABASE/etc/$FILE ] || cp ./etc/$FILE $ONABASE/etc && chmod 644 $ONABASE/etc/$FILE
done

# Create local archive directory
[ -d $ONABASE/cfg_archive_local ] || mkdir $ONABASE/cfg_archive_local && chmod 0600 $ONABASE/cfg_archive_local

# Create spool directory
[ -d $ONABASE/spool ] || mkdir $ONABASE/spool
[ -d $ONABASE/spool/cfg_archive ] || mkdir $ONABASE/spool/cfg_archive

echo "Done."

echo
