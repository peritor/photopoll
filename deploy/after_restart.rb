puts %x(
  echo 'whoami:' >> after_restart
  whoami >> after_restart
  echo 'release_path: #{release_path}' >> after_restart
)