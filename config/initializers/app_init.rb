unless defined? AppInit::RAILS_APP_DB
	module AppInit

		RAILS_APP_DB_URL = ENV['RAILS_APP_DB']

		puts "environment variable not set" if RAILS_APP_DB_URL.nil?
		puts RAILS_APP_DB_URL
		begin
			file = File.open("/tmp/some_file", "w")
			file.write($RAILS_APP_DB_URL) 
		rescue IOError => e
			#some error occur, dir not writable etc.
		ensure
			file.close unless file == nil
		end

		$db_connection_uri = URI.parse(RAILS_APP_DB_URL)

		$db_connection_settings = { Rails.env => {
			"adapter" => $db_connection_uri.scheme == "postgres" ? "postgresql" : $db_connection_uri.scheme,
			"database" => $db_connection_uri.path.gsub('/',''),
			"host" => $db_connection_uri.host,
			"username" => $db_connection_uri.user,
			"password" => $db_connection_uri.password,
			"port" => $db_connection_uri.port,
			"encoding" => "unicode",
			"pool" => 25
		}
		}

		if Rails.env.development?
			test_db = URI.parse(ENV['RAILS_APP_DB'])
			$db_connection_settings['test'] = {
				"adapter" => test_db.scheme == "postgres" ? "postgresql" : test_db.scheme,
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
