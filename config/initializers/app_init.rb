Bundler.require(:default, Rails.env)


unless defined? AppInit::RAILS_APP_DB
	module AppInit

		$db_connection_settings = {}
		RAILS_APP_DB_URL = ENV['RAILS_APP_DB']

		puts "environment variable not set" if RAILS_APP_DB_URL.nil?

		$db_connection_uri = URI.parse(ENV['RAILS_APP_DB'])

		$db_connection_settings['development'] = {
			"adapter" => "postgresql",
			"database" => $db_connection_uri.path.gsub('/',''),
			"host" => $db_connection_uri.host,
			"username" => $db_connection_uri.user,
			"password" => $db_connection_uri.password,
			"port" => $db_connection_uri.port,
			"encoding" => "unicode",
			"pool" => 25
		}

		if Rails.env.development?
			test_db = URI.parse(ENV['RAILS_APP_DB'])
			$db_connection_settings['test'] = {
				"adapter" => "postgresql",
				"database" => test_db.path.gsub('/',''),
				"host" => test_db.host,
				"username" => test_db.user,
				"password" => test_db.password,
				"port" => test_db.port,
				"encoding" => "unicode",
				"pool" => 25
			}
		end
	end
end
