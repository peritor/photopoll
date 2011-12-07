run "cd #{release_path} && rake stats > /tmp/stats"

::File.open('/tmp/dhdbg', 'a') do |file|
  file.puts [Time.now, 'defined?(deploy)', defined?(deploy)].join("\t")
end

