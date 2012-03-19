puts %x(
  echo 'whoami:' >> before_migrate
  whoami >> before_migrate
  echo 'release_path: #{release_path}' >> before_migrate
)