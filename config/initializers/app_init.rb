Bundler.require(:default, Rails.env)

module DatabaseConfiguration

	RAILS_APP_DB_URL = ENV['RAILS_APP_DB']

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

end
