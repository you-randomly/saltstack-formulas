# Full configuration options can be found at https://www.nomadproject.io/docs/configuration

data_dir = "/mnt/Nomad/data"
bind_addr = "0.0.0.0"

client {
  enabled = true
  servers = [
{% for server, addrs in salt['mine.get']('nomad:server','network.ip_addrs', tgt_type='pillar')|dictsort() %}
    "{{ addrs[0] }}",
{% endfor %}
  ]

  host_volume "grocy" {
    path = "/mnt/Nomad/grocy"
    read_only = false
  }

  host_volume "mariadb" {
    path = "/mnt/Nomad/mariadb"
    read_only = false
  }

  host_volume "jellyfin" {
    path = "/mnt/Nomad/jellyfin"
    read_only = false
  }

  host_volume "media" {
    path = "/mnt/Media"
    read_only = false
  }

  host_volume "audiobookshelf" {
    path = "/mnt/Nomad/audiobookshelf"
    read_only = false
  }

  host_volume "audiobookshelf-meta" {
    path = "/mnt/Nomad/audiobookshelf-meta"
    read_only = false
  }

  host_volume "audiobooks" {
    path = "/mnt/Media/audiobooks"
    read_only = false
  }

  host_volume "5e-homebrew" {
    path = "/mnt/Nomad/5e-homebrew"
    read_only = true
  }

  host_volume "comics" {
    path = "/mnt/Media/Comics"
    read_only = false
  }

  host_volume "podcasts" {
    path = "/mnt/Media/podcasts"
    readonly = false
  }

  host_volume "grist" {
    path = "/mnt/Nomad/grist"
    read_only = false
  }

  host_volume "minecraft" {
    path = "/mnt/Nomad/minecraft"
    read_only = false
  }

  host_volume "uptime_kuma" {
    path = "/mnt/Nomad/uptime_kuma"
    read_only = false
  }

  host_volume "n8n" {
    path = "/mnt/Nomad/n8n/.n8n"
    read_only = false
  }

  host_volume "calibre_app" {
    path = "/mnt/Nomad/Calibre/app"
    read_only = false
  }

  host_volume "calibre_web" {
    path = "/mnt/Nomad/Calibre/web"
    read_only = false
  }

  host_volume "treafik" {
    path = "/mnt/Nomad/treafik"
    read_only = false
  }

  host_volume "portainer" {
    path = "/mnt/Nomad/portainer"
    read_only = false
  }

  host_volume "adguard-workdir" {
    path = "/mnt/Nomad/adguard/workdir"
    read_only = false
  }

  host_volume "adguard-conf" {
    path = "/mnt/Nomad/adguard/conf"
    read_only = false
  }

}

plugin "raw_exec" {
  config {
    enabled = true
  }
}