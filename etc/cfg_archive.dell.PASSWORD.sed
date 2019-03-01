# tacacs keys
/.*tacacs.*key \S*$/s/\(.*\)key \S*/!\1key [HIDDEN]/

# snmp community strings
s/\(.*snmp.*\)version 2c \S*\(.*\)/!\1version 2c [HIDDEN]\2/

