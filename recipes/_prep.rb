#
# Cookbook Name:: statsd-cookbook
# Recipe:: _prep.rb
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

%w{ sqlite-devel }.each do |p|
  package p do
    action :install
  end
end

user node['statsd']['user']  do
  action :create
  comment "App User"
end

node.set['rvm']['user_installs'] = [{ 'user' => node['statsd']['user'],
                                      'default_ruby' => 'ruby-2.1.5',
                                      'rubies' => ['2.1.5'],
                                      'rvmrc' => {
                                        'rvm_project_rvmrc' => 1,
                                        'rvm_gemset_create_on_use_flag' => 1,
                                        'rvm_pretty_print_flag' => 1
                                      }
                                    }]

#                                      'gems' => { 'ruby-2.1.5' => [{'name' => 'statsd'}]}

include_recipe 'rvm::default'
include_recipe 'rvm::user'
