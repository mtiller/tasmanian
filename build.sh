#!/bin/bash

wget https://github.com/ORNL/TASMANIAN/archive/v5.1.tar.gz && tar zxf TASMANIAN-5.1.tar.gz
(cd TASMANIAN-5.1; echo -e "y\nn" | ./install /usr/local/tasmanian-5.1/)
rm -rf TASMANIAN-*