############ Dont change the following ##############

# Delete the first line with the command etc
1d
# Delete the last line. Removes any final CLI prompts
$d

# Delete lines with the the text defined between the /<deletethistext>/
/^Virus-DB: /d
/^Extended DB: /d
/^Extreme DB: /d
/^IPS-DB: /d
/^IPS-ETDB: /d
/^IPS Malicious URL Database: /d
/^Botnet DB: /d
/^System time: /d
