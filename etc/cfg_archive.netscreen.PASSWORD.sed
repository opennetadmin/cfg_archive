# I'm not sure if there is a netscreen comment character.
# For now I'm using the ! just like cisco

# snmp community strings
s/\(.*snmp.*\)community \S*\(.*\)/#\1community [HIDDEN]\2/
s/\(.*snmp.*\)host \S*\(.*\)/#\1host [HIDDEN]\2/

# general passwords and secrets
s/\(.*\)secret \S*\(.*\)/#\1secret [HIDDEN]\2/
s/\(.*\)password \S*\(.*\)/#\1password [HIDDEN]\2/

# ike preshare
s/\(.*ike gateway.*\)preshare \S*\(.*\)/#\1preshare [HIDDEN]\2/

# ike hash
s/\(.*ike gateway.*\)hash \S*\(.*\)/#\1hash [HIDDEN]\2/
