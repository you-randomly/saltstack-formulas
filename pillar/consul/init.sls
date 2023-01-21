{% if opts['id'] in [
    "consul-cp-1",
    "rp3",
    "rp0-1"
] %}
consul: server
{% else %}
consul: client
{% endif %}