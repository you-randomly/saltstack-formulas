base:
  '*':
    - basic
    - salt-minion
    - consul
    - nomad

  'consul: server':
    - match: pillar
    - consul.master
  'consul: client':
    - match: pillar
    - consul.client
  
  'nomad: server':
    - match: pillar
    - nomad.server
  'nomad: client'
    - match: pillar
    - nomad.client