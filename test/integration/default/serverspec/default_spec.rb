require_relative './spec_helper'

describe 'ansible-systemd-mounts::default' do

  describe file('/etc/systemd/system/opt-app-folder1.mount') do
    it { should exist }
  end

  describe file('/etc/systemd/system/opt-app-folder1.automount') do
    it { should exist }
  end

  describe file('/etc/systemd/system/opt-app-folder2.mount') do
    it { should exist }
  end

  describe file('/etc/systemd/system/opt-app-folder2.automount') do
    it { should exist }
  end

  describe file('/etc/systemd/system/opt-app-media.mount') do
    it { should exist }
    its(:content) { should match(/mergerfs/) }
    its(:content) { should match(/Requires/) }
  end

  describe file('/etc/systemd/system/opt-app-media.automount') do
    it { should exist }
    its(:content) { should match(/Requires/) }
  end

end
