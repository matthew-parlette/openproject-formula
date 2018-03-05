# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "openproject/map.jinja" import openproject with context %}

apt-transport-https:
  pkg.installed

openproject-install:
  pkgrepo.managed:
    - humanname: openproject-ce
    - name: deb https://dl.packager.io/srv/deb/opf/openproject-ce/stable/7/ubuntu 16.04 main
    - file: /etc/apt/sources.list.d/openproject-ce.list
    - key_url: https://dl.packager.io/srv/opf/openproject-ce/key
  pkg.installed:
    - name: openproject
    - refresh: True
    - require:
      - pkg: apt-transport-https
      - pkgrepo: openproject-install
