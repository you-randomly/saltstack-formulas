{% if opts['id'] in [
    "nomad-cp-0",
    "rp3",
    "nomad-cp-1"
] %}
nomad: server
{% elif opts['id'] in [
    "nomad-wn-0",
    "rp4"
] %}
nomad: client
{% endif %}