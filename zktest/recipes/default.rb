# Note that this is for the GB timezone. Look in
# /usr/share/zoneinfo for your relevant file.
# service "vixie-cron"
# service "sysklogd"
# service "nginx"

link "/etc/localtime" do
  to "/usr/share/zoneinfo/GB"
  notifies :restart, resources(:service => ["vixie-cron", "sysklogd", "nginx"]), :delayed
  not_if "readlink /etc/localtime | grep -q 'GB$'"
end