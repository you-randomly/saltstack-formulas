server = true
datacenter = "dc1"
data_dir = "/opt/consul"

enable_syslog = true
log_level = "error"
log_json = true

ui_config {
    enabled = true
}
client_addr = "0.0.0.0"
bind_addr = "{{ salt['network.ip_addrs']()[0] }}"

bootstrap_expect = 3

retry_join = [
{% for server, addrs in salt['mine.get']('consul:server','network.ip_addrs', tgt_type='pillar')|dictsort() %}
    "{{ addrs[0] }}",
{% endfor %}
]

