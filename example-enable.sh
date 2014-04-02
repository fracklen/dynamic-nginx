#!/bin/bash

./etcdset sites-available/simple_cms/DOMAIN simple_cms.localdocker
./etcdset sites-available/simple_cms/ROOT /

./etcdset simple_cms/nodes/foo/10.3.2.133 10.3.2.133:3080
./etcdset simple_cms/current_revision foo

./etcdset sites-enabled/simple_cms simple_cms




./etcdset sites-available/lokalebasen/DOMAIN lokalebasen.localdocker
./etcdset sites-available/lokalebasen/ROOT /

./etcdset lokalebasen/nodes/foo/10.3.2.133 10.3.2.133:3030
./etcdset lokalebasen/current_revision foo

./etcdset sites-enabled/lokalebasen lokalebasen
