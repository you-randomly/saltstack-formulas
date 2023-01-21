datacenter = "dc1"

data_dir = "/opt/consul"

retry_join = [
{% for server, addrs in salt['mine.get']('consul:server','network.ip_addrs', tgt_type='pillar')|dictsort() %}
    "{{ addrs[0] }}",
{% endfor %}
]
