run "cd #{release_path} && rake stats > /tmp/stats"
::File.open('/tmp/dhdbg', 'w') do |file|
  file.puts deploy.to_hash.inspect
end

