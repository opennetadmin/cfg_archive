
#s/\(.*\)key-string 7 \S*\(.*\)/!\1key-string 7 [HIDDEN]\2/

# any enable secret stuff
#s/\(.*\)secret 5 \S*\(.*\)/!\1secret 5 [HIDDEN]\2/

# any password 7 entries
#s/\(.*\)password 7 \S*\(.*\)/!\1password 7 [HIDDEN]\2/

# any password keyword
#s/\(.*\)password \S*\(.*\)/!\1password [HIDDEN]\2/
#s/\(.*\)password \(.\) \S*\(.*\)/!\1password \2 [HIDDEN]\3/
#/.*password \S*$/s/\(.*\)password \(.*\)/!\1password [HIDDEN]\2/

# tacacs keys
#/.*tacacs.*key . /s/\(.*\)key \(.\) \S*/!\1key \2 [HIDDEN]/
#/.*tacacs.*key \S*$/s/\(.*\)key \S*/!\1key [HIDDEN]/

# radius keys
#/.*radius.*key . /s/\(.*\)key \(.\) \S*/!\1key \2 [HIDDEN]/

# snmp community strings
#s/\(.*snmp.*\)community \S*\(.*\)/!\1community [HIDDEN]\2/
#s/\(.*snmp.*\)md5 \S*\(.*\)/!\1md5 [HIDDEN]\2/
#s/\(.*snmp.*\)priv \S*\(.*\)/!\1priv [HIDDEN]\2/


# crypto keys
#s/\(.*crypto.*\)key \S*\(.*\)/!\1key [HIDDEN]\2/

# tunnel keys
#s/\(.*tunnel.*\)key \S*\(.*\)/!\1key [HIDDEN]\2/

# specific match for crypto key statement that begins the line
#s/^ key \S*\(.*\)/! key [HIDDEN]\2/



# Encrypted Passwords
s/\(.*\)set password ENC \S*\(.*\)/!\1set password ENC [HIDDEN]\2/

# SNMP Community String
#set name

# TACACS Encrypted Key
s/\(.*\)set key ENC \S*\(.*\)/!\1set key ENC [HIDDEN]\2/

# OSPF Encryption Key
s/\(.*\)set authentication-key ENC \S*\(.*\)/!\1set authentication-key ENC [HIDDEN]\2/

