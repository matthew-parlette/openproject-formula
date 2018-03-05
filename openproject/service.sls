# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "openproject/map.jinja" import openproject with context %}

include:
  - openproject.install

openproject-db:
  file.directory:
    - name: {{ openproject.path['db'] }}

openproject-data:
  file.directory:
    - name: {{ openproject.path['data'] }}

openproject:
  service.running:
    - require:
      - pkg: openproject-install
