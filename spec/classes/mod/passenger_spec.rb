describe 'apache::mod::passenger', :type => :class do
  let :pre_condition do
    'include apache'
  end
  context "on a Debian OS" do
    let :facts do
      {
        :osfamily               => 'Debian',
        :operatingsystemrelease => '6',
        :concat_basedir         => '/dne',
      }
    end
    it { should include_class("apache::params") }
    it { should contain_apache__mod('passenger') }
    it { should contain_package("libapache2-mod-passenger") }
    it { should contain_file('passenger.conf').with({
      'path' => '/etc/apache2/mods-available/passenger.conf',
    }) }
  end
  context "on a RedHat OS" do
    let :facts do
      {
        :osfamily               => 'RedHat',
        :operatingsystemrelease => '6',
        :concat_basedir         => '/dne',
      }
    end
    it { should include_class("apache::params") }
    it { should contain_apache__mod('passenger') }
    it { should contain_package("mod_passenger") }
    it { should contain_file('passenger.conf').with({
      'path' => '/etc/httpd/conf.d/passenger.conf',
    }) }
  end
end
