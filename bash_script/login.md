# login.sh

The curl gets a `200` status weather its a succes or not, The clue to see if you were succesfull
is on line number 3 of the response page:

Here is a snippet:
```
<script>
var logonInfo = new Array(
0,
0,0);
var g_Lan = 320;
var g_year=2019;
```

* `0` - Succes
* `1` - Fail

At the end of the curl we do this:
` | sed -n '3,3p' | tr -d ","`
Which is get line 3, and remove the comma, then do a simple if statement to tell you the result.

# Minimal login
The script `login.sh` has a log of options but you can get a succesfull login with the following:

```bash
LOGN=$(curl -s -XPOST "http://$SWITCH_IP/logon.cgi" --data "$DATA" | sed -n '3,3p' | tr -d ",")
```

# Side efect:
One side effect of this is that the switch seems to remember you by IP / MAC
Once you are authenticated, all your browsers on that machine are able to open the webpage without login credentials.


# Other use-full URLS:

* `http://$SWITCH_IP/Logout.htm` - Logs you out
* `http://$SWITCH_IP/PortStatisticsRpm.htm` - The port stat page
* `http://$SWITCH_IP/SystemInfoRpm.htm` - General sysinfo
* `http://$SWITCH_IP/led_on_set.cgi` - Turn on or off the leds
 * `\?rd_led\=1\&led_cfg\=Apply` -  added to the URL.
* `http://$SWITCH_IP/reboot.cgi` - Reboot the switch
 * `reboot_op=reboot&save_op=false` - as body

There is probably more but these seem the most use-full the rest can be done by interface.
