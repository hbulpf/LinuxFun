#!/bin/bash
uname -r
rpm -qa yum
rpm -qa | grep yum | xargs rpm -e --nodeps
rpm -qa yum
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/yum-3.4.3-158.el7.centos.noarch.rpm
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/yum-metadata-parser-1.1.4-10.el7.x86_64.rpm
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/yum-plugin-fastestmirror-1.1.31-45.el7.noarch.rpm

rpm -ivh yum-*
rpm -qa yum

rpm --import http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-7
rpm -qa|grep yum|xargs rpm -e --nodeps