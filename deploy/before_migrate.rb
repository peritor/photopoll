Chef::Log.info("database.yml exists in shared: #{File.exists?("/srv/www/photopoll/shared/config/database.yml")}")
Chef::Log.info("database.yml exists in current: #{File.exists?("/srv/www/photopoll/current/config/database.yml")}")
