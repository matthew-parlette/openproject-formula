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

openproject-container:
  dockerng.running:
    - name: {{ openproject.name }}
    - image: {{ openproject.image }}:{{ openproject.branch }}
    - binds:
      - {{ openproject.path['db'] }}:/var/lib/postgresql/9.4/main:rw
      - {{ openproject.path['data'] }}:/var/db/openproject:rw
    - port_bindings:
      - {{ openproject.port }}:80
    {%- if openproject['environment'] is defined %}
    - environment:
      {%- for env, value in openproject.environment.items() %}
      - {{ env }}: {{ value|yaml_squote }}
      {%- endfor %}
    {%- endif %}
    - require:
      - dockerng: openproject-image
