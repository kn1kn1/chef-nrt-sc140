#
# Cookbook Name:: nrt-sc140
# Recipe:: default
#
# Copyright 2013, Kenichi Kanai
#

# nodejs
apt_repository "nodejs-ppa" do
  uri "http://ppa.launchpad.net/chris-lea/node.js/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "C7917B12"
end

package "nodejs" do
  action :install
end

# nrt-sc140
username = "supercollider"
home = "/home/#{username}"

execute "npm" do
  cwd home
  command "npm install nrt-sc140"
end

# ffmpeg, libavformat-extra-53
%w{ffmpeg libavformat-extra-53}.each do |pkg|
  package pkg do
    action :install
  end
end

# config.json
config = "#{home}/node_modules/nrt-sc140/config.json"
ruby_block "config.json" do
  block do
    file = Chef::Util::FileEdit.new(config)
    file.search_file_replace_line("\"sclang_path\": \"/usr/local/bin/\"", "\"sclang_path\": \"/usr/bin/\"")
    file.write_file
  end
  only_if "grep -q '\"sclang_path\": \"/usr/local/bin/\"' #{config}"
end

# WORKAROUND - change nrt-sc140 directory's owner from "vagrant" to "supercollider".
nrtsc140 = "#{home}/node_modules/nrt-sc140"
[nrtsc140, "#{nrtsc140}/public/"].each do |dir|
  directory dir do
    owner username
    group username
    mode 0755
  end
end

# WORKAROUND - execute "npm install" at "#{home}/node_modules/nrt-sc140" to repair dependencies.
execute "npm" do
  cwd nrtsc140
  command "npm install"
end
