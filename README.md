HackNYFall2012
==============

An amusing access point that runs from your Raspberry Pi.

NOTE
----
An easy installation procedure is currently being devised. If you still want to try this right now, you will have to modify the iptables.conf file to work with your specific network config.

Intallation
-----------
On a Raspberry Pi running Rasbian with a wifi usb dongle, intall the following packages:

1. dnsmasq
2. squid

On a server accessible from the internet and running php, drop the directory `troll` in a location that your webserver can access. Back on the Raspberry Pi, modify troll.pl to point at this url.

On the Raspberry Pi, `dnsmasq.conf` goes in `/etc/` and all the files in `squid/` go in `/etc/squid`. Once these are installed reload or restart the squid and dnsmasq services.

Currently, you will have to modify the iptables.conf file to match your network. It should be configured to redirect any traffic from the wlan interface to the squid proxy, and then to the nnetwork gateway. See the provided file for an example.

Finally, run trollnet.sh to create the wifi network.
