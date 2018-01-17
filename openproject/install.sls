# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "openproject/map.jinja" import openproject with context %}

openproject-image:
  dockerng.image_present:
    - name: {{ openproject.image }}:{{ openproject.branch }}
    - force: True
