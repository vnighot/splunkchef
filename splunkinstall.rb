tarball = "splunk-#{node[:splunk][:version]}.tar.gz"
download_file = "#{node[:splunk][:download_url]}/#{tarball}"

remote_file "#{Chef::Config[:file_cache_path]}/#{tarball}" do
  source download_file
  action :create_if_missing
  mode 00644
end

execute "pbrum" do
  user "sysglm"
  action :run
  command "pbrum -u sysglm bash"
end

spl_install_dir=node[:splunk][:install_dir]

execute "tar" do
  user "sysglm"
  group "root"
  cwd spl_install_dir
  action :run
  command "tar xvzf #{Chef::Config[:file_Cache_path]}/#{tarball}"
  not_if{ ::File.directory?("#{zk_install_dir}/zookeeper")}
end

execute "move" do
    user "sysglm"
    group "root"
    cwd spl_install_dir
    action :run
    command "mv spl* splunk"
    not_if{ ::File.directory?("#{zk_install_dir}/zookeeper")
  end


