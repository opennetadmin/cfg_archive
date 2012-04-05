############ Dont change the following, put user stuff at the end ##############

# Delete the first line with the Using x bytes info
1d

# Delete lines with the the text defined between the /<deletethistext>/
/Last configuration change/d
/NVRAM config last updated/d
/Current configuration/d
/Uncompressed configuration/d
/!Time:/d
/!Startup config saved at:/d
/-Status:/d

######## Put User defined info below this line ############


# Find IDS access lists and remove them
/^ip access-list extended IDS_.*_./,/^ip access-list extended/ { 
 1,2d;        # Delete the first two lines, this deletes the access-list name
 /^ .*/d;     # Delete the ACL content lines
}

# I have to define one as well that matches if it is the last ACL in the list, couldn't combine with the one above?
/^ip access-list extended IDS_.*_./,/^!/ {
 1,2d;        # Delete the first two lines, this deletes the access-list name
 /^ .*/d;     # Delete the ACL content lines
}

# Strip out the IDS ACL name iteration number
#  ip access-group IDS_Vlan10_in in
s/ip access-group IDS_\(.*\)_./ip access-group IDS_\1_POST/
