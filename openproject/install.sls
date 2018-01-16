# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "template/map.jinja" import template with context %}

template-image:
  dockerng.image_present:
    - name: {{ template.image }}:{{ template.branch }}
    - force: True
