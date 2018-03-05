# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "openproject/map.jinja" import openproject with context %}

# include:
  # - openproject.service

openproject-defaults:
  file.managed:
    - name: /etc/default/openproject
    - source: salt://openproject/files/defaults.jinja
    - template: jinja

{%- for env, value in openproject.environment.items() %}
openproject-config-{{ env }}:
  cmd.run:
    - name: openproject config:set {{ env }}={{ value|yaml_squote }}
    # - watch_in:
      # - service: openproject
{%- endfor %}
