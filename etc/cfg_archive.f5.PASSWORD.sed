
# any secret stuff
s/\(.*\)secret \S*\(.*\)/#\1secret [HIDDEN]\2/

# any password entries
s/\(.*\)password \S*\(.*\)/#\1password [HIDDEN]\2/

# any password keyword
s/\(.*\)password \(.\) \S*\(.*\)/#\1password \2 [HIDDEN]\3/
/.*password \S*$/s/\(.*\)password \(.*\)/#\1password [HIDDEN]\2/

# SNMP junk
s/\(.*\)community-name \S*\(.*\)/#\1community-name [HIDDEN]\2/

# API keys
s/\(.*\)apikey "\(.*\)"/#\1apikey [HIDDEN]/
