run "cd #{release_path} && rake stats > /tmp/stats"

::File.open('/tmp/dhdbg', 'a') do |file|
  file.puts [Time.now, 'defined?(deploy)', defined?(deploy)].join("\t")
end

app_deploy = node[:deploy][release_path.split('/')[-3]]
::File.open('/tmp/dhdbg', 'a') do |file|
  file.puts [Time.now, 'app_deploy.class', app_deploy.class].join("\t")
end

::File.open('/tmp/dhdbg', 'a') do |file|
  file.puts [Time.now, 'app_deploy[:rails_env]', app_deploy[:rails_env]].join("\t")
end

puts %x(
  echo 'whoami:' >> before_restart
  whoami >> before_restart
  echo 'release_path: #{release_path}' >> before_restart
  echo 'release_path: #{current_path}' >> before_restart
)
