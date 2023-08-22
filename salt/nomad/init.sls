{# doesn't wwork for rp3 not sure why #}
{% if not opts['id']  in ["rp3","rp4"] %}
hashicorp-nomad-repo:
  pkgrepo.managed:
    - humanname: hashicorp
    - name: deb https://apt.releases.hashicorp.com {{ grains["lsb_distrib_codename"] }} main
    - file: /etc/apt/sources.list.d/hashicorp.list
    - key_url: salt://nomad/hashicorp-archive-keyring.gpg
{% endif %}


nomad-install:
  pkg.installed:
    - name: nomad
    {% if not opts['id']  == "rp3" %}
    - require:
      - pkgrepo: hashicorp-nomad-repo
    {% endif %}