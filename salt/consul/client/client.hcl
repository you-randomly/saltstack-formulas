datacenter = "dc1"

data_dir = "/opt/consul"

retry_join = [
{% for server, addrs in salt['mine.get']('consul:server','network.ip_addrs', tgt_type='pillar')|dictsort() %}
    "{{ addrs[0] }}",
{% endfor %}
]

host_volume "treafik" {
  path      = "/mnt/Nomad/treafik"
  read_only = false
}

host_volume "audiobookshelf" {
  path      = "/mnt/Nomad/audiobookshelf"
  read_only = false
}

host_volume "audiobooks" {
  path      = "/mnt/Media/audiobooks"
  read_only = false
}

host_volume "comics" {
  path      = "/mnt/Media/Comics"
  read_only = false
}

host_volume "podcasts" {
  path      = "/mnt/Media/podcasts"
  read_only = false
}