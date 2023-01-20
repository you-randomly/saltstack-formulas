
/etc/salt/minion.d/salt-minion.conf:
  file.managed:
    - source:
      - salt://salt-minion/alun-salt.conf
    - makedirs: True

salt-minion-install:
  pkg.installed:
    - name: salt-minion
    - require:
      - file: /etc/salt/minion.d/salt-minion.conf


salt-minion-service:
  service.running:
    - name: salt-minion
    - watch:
      - file: /etc/salt/minion.d/salt-minion.conf