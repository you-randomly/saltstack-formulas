base:
    '*':
        - basic
        - consul
        - nomad
        - salt-minion

    'nomad:client':
        - match: pillar
        - nomad.client
    'nomad:server':
        - match: pillar
        - nomad.server

    'consul:client':
        - match: pillar
        - consul.client
    'consul:server':
        - match: pillar
        - consul.server