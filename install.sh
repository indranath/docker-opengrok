#!/bin/sh
mkdir $OPENGROK_INSTANCE_BASE
mkdir $OPENGROK_INSTANCE_BASE/data
mkdir $OPENGROK_INSTANCE_BASE/etc

wget -O - http://java.net/downloads/opengrok/opengrok-0.12.1.4.tar.gz | tar zxvf -
mv opengrok-* opengrok
cd /opengrok/bin
./OpenGrok deploy
