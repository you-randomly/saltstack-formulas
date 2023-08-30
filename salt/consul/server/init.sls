{% if pillar.get('consul') == "server" %}
    
consul-master-node:
  file.managed:
    - name: /etc/consul.d/server.hcl
    - source: salt://consul/server/server.hcl
    - makedirs: True
    - template: jinja

start-consul:
  service.running:
    - name: consul
    - watch:
      - file: consul-master-node
    - require: 
      - file: consul-master-node

{% endif %}