{% if pillar.get('consul') == "server" %}
    
consul-master-node:
  file.managed:
    - source: salt://consul/master/master.conf

start-consul:
  service.running:
    - name: consul
    - watch:
      - file: consul-master-node
    - require: 
      - pkg: consul.consul-install
      - file: consul-master-node

{% endif %}}