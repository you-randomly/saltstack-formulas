{% if pillar.get('consul') == "server" %}
    
consul-master-node:
  file.managed:
    - name: /etc/consul.d/master.hcl
    - source: salt://consul/master/master.hcl
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