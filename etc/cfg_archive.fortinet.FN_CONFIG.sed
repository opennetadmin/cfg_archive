############ Dont change the following ##############

# Delete the last line. Removes any final CLI prompts
$d

# Delete lines with the the text defined between the /<deletethistext>/
#/config-version=/d
/^#conf_file_ver=/d
