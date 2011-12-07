::File.open('/tmp/dhdbg', 'w') do |file|
  file.puts deploy.to_hash.inspect
end
exit(0)

