run "cd #{release_path} && rake stats > /tmp/stats"

execute "cd /tmp && echo $HOME > /tmp/bla" do
  user 'deploy'
  environment 'HOME' => '/tmp'
end
