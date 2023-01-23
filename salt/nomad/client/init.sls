{% if pillar.get('nomad') == "client" %}
nomad-client-node:
  file.managed:
    - name: /etc/nomad.d/client.hcl
    - source: salt://nomad/client/client.hcl
    - makedirs: True
    - template: jinja

start-nomad:
  service.running:
    - name: nomad
    - watch:
      - file: nomad-client-node
    - require:
      - file: nomad-client-node

nfs-install:
  pkg.installed:
    - name: nfs-common

add-nfs-store:
  file.append:
    - name: /etc/fstab
    - text:
      - "192.168.2.184:/volume1/media /mnt/Media/ nfs defaults 0 0"
      - "192.168.2.184:/volume1/Nomad /mnt/Nomad/ nfs defaults 0 0"

{% endif %}