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

nfs-install:
  pkg.installed:
    - name: nfs-common

add-nfs-store:
  file.append:
    - name: /etc/fstab
    - text:
      - "192.168.2.184:/volume1/homes/jake-alun/nomad /mnt/Nomad-jobs/ nfs defaults 0 0"

{% endif %}