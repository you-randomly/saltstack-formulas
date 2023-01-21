{# doesn't wwork for rp3 not sure why #}
{% if not opts['id']  == "rp3" %}
hashicorp-repo:
  pkgrepo.managed:
    - humanname: hashicorp
    - name: deb https://apt.releases.hashicorp.com {{ grains["lsb_distrib_codename"] }} main
    - file: /etc/apt/sources.list.d/hashicorp.list
    - key_url: salt://consul/hashicorp-archive-keyring.gpg
{% endif %}
#hashicorp-gpg:
#  file.managed:
#    - name: /etc/apt/trusted.gpg.d/hashicorp-archive-keyring.gpg
#    - source: salt://consul/hashicorp.list
#    - makedirs: True
#
#hashicorp-list:
#  file.managed:
#    - name: /etc/apt/sources.list.d/hashicorp.list
#    - source: salt://consul/hashicorp.list
#    - template: jinja
#    - makedirs: True
#    - require:
#      - file: hashicorp-gpg

consul-install:
  pkg.installed:
    - name: consul
    {% if not opts['id']  == "rp3" %}
    - require:
      - pkgrepo: hashicorp-repo
    {% endif %}