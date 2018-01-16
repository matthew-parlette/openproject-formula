# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "template/map.jinja" import template with context %}

include:
  - template.install

template-file:
  file.touch:
    - name: {{ template.filename }}

template-dir:
  file.directory:
    - name: {{ template.directory }}

template-container:
  dockerng.running:
    - name: {{ template.name }}
    - image: {{ template.image }}:{{ template.branch }}
    - binds:
      - {{ template.directory }}:/path/on/container:rw
    - port_bindings:
      - {{ template.port }}:3000
    {%- if template['environment'] is defined %}
    - environment:
      {%- for env, value in template.environment.items() %}
      - {{ env }}: {{ value|yaml_squote }}
      {%- endfor %}
    {%- endif %}
    - require:
      - dockerng: template-image
