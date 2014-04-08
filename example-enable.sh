#!/bin/bash

./etcdset sites-available/simple_cms/DOMAIN cms.lokalebasen.dk
./etcdset sites-available/simple_cms/ROOT /

./etcdset simple_cms/nodes/5d5998c/192.168.3.13 192.168.3.13:49160
./etcdset simple_cms/current_revision 5d5998c

./etcdset sites-enabled/simple_cms simple_cms




curl -XPUT $ETCD_URL/v2/keys/sites-available/imageproxy/DOMAIN -L -d value="imageproxy.lokalebasen.dk imageproxy0.lokalebasen.dk imageproxy1.lokalebasen.dk imageproxy2.lokalebasen.dk imageproxy3.lokalebasen.dk"
./etcdset sites-available/imageproxy/ROOT /

./etcdset imageproxy/nodes/ea9d523/192.168.3.13 192.168.3.13:49159
./etcdset imageproxy/current_revision ea9d523

./etcdset sites-enabled/imageproxy imageproxy



./etcdset sites-available/cb-import/DOMAIN cb-import.lokalebasen.dk
./etcdset sites-available/cb-import/ROOT /

./etcdset cb-import/nodes/2574946/192.168.3.13 192.168.3.13:49162
./etcdset cb-import/current_revision 2574946

./etcdset sites-enabled/cb-import cb-import
