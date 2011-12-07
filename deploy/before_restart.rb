run "cd #{release_path} && rake stats > /tmp/stats"

::File.open('/tmp/dhdbg', 'a') do |file|
  file.puts [Time.now, 'test'].join("\t")
end

