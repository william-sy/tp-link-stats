# tp-link-stats
Gather statistics of my local TP-link switches that do not have SNMP.

# Origin

I wanted to gather some statistics from my TP-Link "business" switches.
But found out they only allow that trough the web-interface, Hence the googling stared.

The result is first of all a very basic shell script that will login into your switch and gives you fail / succes.

Goal is to have some python script to give some fancy graphs orso who knows

# Supported devices:
* TL-SG108E (Hardware V5) 1.0.0 Build 20191021 Rel.53360
* TL-SG105E (Hardware V5) 1.0.0 Build 20191105 Rel.33503

Feel free to tell me if this works for other devices too.
