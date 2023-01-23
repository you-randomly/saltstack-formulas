{% if pillar.get('nomad') == "server" %}
    
nomad-server-node:
  file.managed:
    - name: /etc/nomad.d/server.hcl
    - source: salt://nomad/server/server.hcl
    - makedirs: True
    - template: jinja

start-nomad:
  service.running:
    - name: nomad
    - watch:
      - file: nomad-server-node
    - require: 
      - file: nomad-server-node

{% endif %}