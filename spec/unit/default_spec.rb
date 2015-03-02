require 'spec_helper'


describe 'statsd::default' do

  platforms = {
      'centos' => ['6.6']
  }

  before(:each) do
    cmd = "bash -c \"source /home/statsd/.rvm/scripts/rvm && type rvm | cat | head -1 | grep -q '^rvm is a function$'\""
    stub_command(cmd).and_return(true)
  end

  platforms.each do |platform, versions|
    versions.each do |version|

      context "on #{platform.capitalize} #{version}" do
        let (:chef_run) do
          ChefSpec::Runner.new(log_level: :warn, platform: platform, version: version) do |node|
            # set additional node attributes here
          end.converge(described_recipe)
        end

        it 'should include the statsd::_prep recipe by default' do
          chef_run.should include_recipe 'statsd::_prep'
        end

        it 'should include the statsd::_app recipe by default' do
          chef_run.should include_recipe 'statsd::_app'
        end

        it 'should include the statsd::_service recipe by default' do
          chef_run.should include_recipe 'statsd::_service'
        end
      end
    end
  end
end
