require 'spec_helper'

describe 'motd', type: :class do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end
      context 'with default parameters' do
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('motd') }
        it { is_expected.to contain_class('motd::params') }
        it { is_expected.to have_resource_count(1) }
        it do
          is_expected.to contain_file('/etc/motd').with(
            ensure: 'file',
            owner: 'root',
            group: 'root',
            mode: '0644'
        )
        end
        describe '/etc/motd should have content from default template' do
          it { is_expected.to contain_file('/etc/motd').with_content(%r{^FQDN: *foo\.example\.com \(10.0.2.15\)$}) }

          case facts[:operatingsystem]
          when 'RedHat'
            case facts[:operatingsystemmajrelease]
            when '6'
              it { is_expected.to contain_file('/etc/motd').with_content(%r{^RedHat 6.* x86_64$}) }
            when '7'
              it { is_expected.to contain_file('/etc/motd').with_content(%r{^RedHat 7.* x86_64$}) }
            end
          when 'CentOS'
            case facts[:operatingsystemmajrelease]
            when '6'
              it { is_expected.to contain_file('/etc/motd').with_content(%r{^CentOS 6.* x86_64$}) }
            when '7'
              it { is_expected.to contain_file('/etc/motd').with_content(%r{^CentOS 7.* x86_64$}) }
            end
          when 'Ubuntu'
            case facts[:operatingsystemmajrelease]
            when '12.04'
              it { is_expected.to contain_file('/etc/motd').with_content(%r{^Ubuntu 12\.04 amd64$}) }
            when '14.04'
              it { is_expected.to contain_file('/etc/motd').with_content(%r{^Ubuntu 14\.04 amd64$}) }
            end
          when 'Gentoo'
            it { is_expected.to contain_file('/etc/motd').with_content(%r{^Gentoo 3\..*-gentoo amd64$}) }
          end
        end
      end

      context 'with ensure => absent' do
        let(:params) do
          {
            ensure: 'absent'
          }
        end
        it { is_expected.to contain_file('/etc/motd').with_ensure('absent') }
      end

      context 'with config_file => /path/to/motd' do
        let(:params) do
          {
            config_file: '/path/to/motd'
          }
        end
        it { is_expected.to contain_file('/path/to/motd').with_ensure('file') }
      end

      context 'with inline template' do
        let(:params) do
          {
            inline_template: 'Test template <%= @testfact %>'
          }
        end
        let(:facts) do
          facts.merge(testfact: 'foo')
        end
        it { is_expected.to contain_file('/etc/motd').with_content(%r{^Test template foo$}) }
      end

      context 'with invalid config_file path' do
        let(:params) do
          {
            config_file: 'not_an_absolute_path'
          }
        end
        it 'raises an error' do
          expect { is_expected.to contain_class('motd') }.to raise_error(Puppet::Error, %r{"not_an_absolute_path" is not an absolute path})
        end
      end
    end
  end

  context 'on unsupported os family' do
    let :facts do
      {
        osfamily: 'Windows',
        operatingsystem: 'Windows'
      }
    end
    it 'raises an error' do
      expect { is_expected.to contain_class('motd::params') }.to raise_error(Puppet::Error, %r{The motd module is not supported on Windows})
    end
  end
end
