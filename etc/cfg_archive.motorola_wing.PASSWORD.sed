# This config file is used to convert passwords to
# a [HIDDEN] string to help protect configs stored
# in the database.

s/\(.*\)key-string 7 \S*\(.*\)/!\1key-string 7 [HIDDEN]\2/

# any enable secret stuff
s/\(.*\)secret 5 \S*\(.*\)/!\1secret 5 [HIDDEN]\2/

# any password 7 entries
s/\(.*\)password 7 \S*\(.*\)/!\1password 7 [HIDDEN]\2/

# any password keyword
#s/\(.*\)password \S*\(.*\)/!\1password [HIDDEN]\2/
/.*password . \S*$/s/\(.*\)password \(.\) \S*\(.*\)/!\1password \2 [HIDDEN]\3/
/.*password \S*$/s/\(.*\)password \(.*\)/!\1password [HIDDEN]\2/

# tacacs keys
/.*tacacs.*key . /s/\(.*\)key \(.\) \S*/!\1key \2 [HIDDEN]/
/.*tacacs.*key \S*$/s/\(.*\)key \S*/!\1key [HIDDEN]/

# radius keys
/.*radius.*key . /s/\(.*\)key \(.\) \S*/!\1key \2 [HIDDEN]/

# snmp community strings
s/\(.*snmp.*\)community \S*\(.*\)/!\1community [HIDDEN]\2/

# crypto keys
s/\(.*crypto.*\)key \S*\(.*\)/!\1key [HIDDEN]\2/

# tunnel keys
s/\(.*tunnel.*\)key \S*\(.*\)/!\1key [HIDDEN]\2/

# specific match for crypto key statement that begins the line
#s/^ key \S*\(.*\)/! key [HIDDEN]\2/

