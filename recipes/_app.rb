#
# Cookbook Name:: statsd-cookbook
# Recipe:: _app.rb
#
# Copyright (C) 2014 E Camden Fisher
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'statsd::_service'

rvm_shell 'install_statsd' do
  ruby_string 'ruby-2.1.5'
  code 'gem install statsd'
  user node['statsd']['user']
  action :nothing
end

template "#{node['statsd']['dir']}/config.yml" do
  source 'config.yml.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables({
              :bind => node['statsd']['bind'],
              :port => node['statsd']['port'],
              :flush_protocols  => node['statsd']['flush_protocols'],
              :flush_interval   => node['statsd']['flush_interval'],
              :graphite_host  => node['statsd']['graphite_host'],
              :graphite_port  => node['statsd']['graphite_port'],
              :mongo_host => node['statsd']['mongo_host'],
              :mongo_database => node['statsd']['mongo_database'],
              :mongo_retentions => node['statsd']['mongo_retentions']
            })
  notifies :run, 'rvm_shell[install_statsd]', :immediately
  notifies :restart, 'service[statsd]', :delayed
end
