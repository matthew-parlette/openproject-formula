# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "openproject/docker/map.jinja" import openproject with context %}

openproject-image:
  dockerng.image_present:
    - name: {{ openproject.image }}:{{ openproject.branch }}
    - force: True
