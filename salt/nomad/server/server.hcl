data_dir  = "/var/lib/nomad"

datacenter = "dc1"

bind_addr = "{{ salt['network.ip_addrs']()[0] }}"

advertise {
  # Defaults to the first private IP address.
  http = "{{ salt['network.ip_addrs']()[0] }}"
  rpc  = "{{ salt['network.ip_addrs']()[0] }}"
  serf = "{{ salt['network.ip_addrs']()[0] }}"
}

server {
  enabled          = true
  bootstrap_expect = 3
}


plugin "raw_exec" {
  config {
    enabled = true
  }
}