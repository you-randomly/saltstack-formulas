base:
  '*':
    - basic
    - salt-minion
    - consul
    - nomad

  'I@consul: server':
    - consul.master
  'I@consul: client':
    - consul.client
  
  'I@nomad: server':
    - nomad.server
  'I@nomad: client'
    - nomad.client