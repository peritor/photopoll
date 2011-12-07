run "cd #{release_path} && rake stats > /tmp/stats"

::File.open('/tmp/dhdbg', 'a') do |file|
  file.puts [Time.now, 'defined?(deploy)', defined?(deploy)].join("\t")
end

app_deploy = node[:deploy][release_path.split('/')[-2]]
::File.open('/tmp/dhdbg', 'a') do |file|
  file.puts [Time.now, 'app_deploy.class', app_deploy.class].join("\t")
end


