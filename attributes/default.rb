default['statsd']['bind'] = '127.0.0.1'
default['statsd']['port'] = 8125
default['statsd']['user'] = 'statsd'
default['statsd']['dir'] = '/etc/sysconfig'

default['statsd']['flush_protocols'] = ['graphite']

default['statsd']['flush_interval'] =  10
default['statsd']['graphite_host'] = 'localhost'
default['statsd']['graphite_port'] = 2003
default['statsd']['mongo_host'] = ''
default['statsd']['mongo_database'] = ''
default['statsd']['mongo_retentions'] = ''
