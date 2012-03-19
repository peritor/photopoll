puts %x(
  echo 'whoami:' >> before_symlink
  whoami >> before_symlink
  echo 'release_path: #{release_path}' >> before_symlink
)