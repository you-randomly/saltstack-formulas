{% if pillar.get('consul') == "client" %}
    
consul-client-node:
  file.managed:
    - name: /etc/consul.d/client.hcl
    - source: salt://consul/client/client.hcl
    - makedirs: True
    - template: jinja

start-consul:
  service.running:
    - name: consul
    - watch:
      - file: consul-client-node
    - require: 
      - file: consul-client-node

{% endif %}