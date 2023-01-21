base:
  '*':
  'consul:server':
    - match: pillar
    - consul.master.init