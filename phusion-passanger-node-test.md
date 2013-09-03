Lets try Phusion Passanger Node.js!!!
=====================================

FooBarWidget asked, and I said ok.

Start here:

https://github.com/phusion/passenger/wiki/Node.js

2300 lets start by cloning the vm-image
2307 login to new debian wheezy clone
2309 start with quickstart instructions
  - apt-get removing nginx in case that may cause problems
  - apt-get installing libz etc
  - let passenger -installer install nginx
2328 installer and some phusion blog reading done (use bcrypt!)
reading discussion forums on a finnish mc losing his nerve in facebook comments
2345 continue
Find out I have downloaded the non-node supporting version
2352 Start over, download zip, screw it, ´´´$ git clone https://github.com/phusion/passenger.git
0000 sudo passenger/bin/passenger-install-nginx-module
0002 selected customize existing server but cannot find source -- remove existing from dpkg and restart install
0010 slight mod of the confs to accomodate new install arrangement
0013 standalone passenger running
