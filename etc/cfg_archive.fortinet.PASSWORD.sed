# Encrypted Passwords
#s/\(.*\)set password ENC \S*\(.*\)/!\1set password ENC [HIDDEN]\2/
/.*set password ENC /s/\(.*\)ENC \S*/!\1ENC [HIDDEN]/
/.*set passphrase ENC /s/\(.*\)ENC \S*/!\1ENC [HIDDEN]/

# TACACS Encrypted Key
#s/\(.*\)set key ENC \S*\(.*\)/!\1set key ENC [HIDDEN]\2/
/.*set key ENC /s/\(.*\)ENC \S*/!\1ENC [HIDDEN]/
/.*set secondary-key ENC /s/\(.*\)ENC \S*/!\1ENC [HIDDEN]/
/.*set tertiary-key ENC /s/\(.*\)ENC \S*/!\1ENC [HIDDEN]/

# Radius Encrypted Secret
/.*set secret ENC /s/\(.*\)ENC \S*/!\1ENC [HIDDEN]/
/.*set secondary-secret ENC /s/\(.*\)ENC \S*/!\1ENC [HIDDEN]/

# VPN Pre-shared Key
/.*set psksecret ENC /s/\(.*\)ENC \S*/!\1ENC [HIDDEN]/

# OSPF Encryption Key
/.*set authentication-key ENC /s/\(.*\)ENC \S*/!\1ENC [HIDDEN]/

# Private Keys
/-----BEGIN ENCRYPTED PRIVATE KEY-----/,/-----END ENCRYPTED PRIVATE KEY-----/ {/-----BEGIN ENCRYPTED PRIVATE KEY-----/n;/-----END ENCRYPTED PRIVATE KEY-----/!{s/./x/g;}}

# SNMP Community String
/\(config system snmp community\)/{N;N;s/\(config system snmp community\)\r\n\(.*\)\r\n\(.*set name \)\(\S*\)/\1\n\2\n!\3[HIDDEN]/;P;D}


