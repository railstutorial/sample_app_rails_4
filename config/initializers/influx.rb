InfluxDB::Rails.configure do |config|
  config.influxdb_database = "#{ENV['INFLUX_DATABASE']}"
  config.influxdb_username = "#{ENV['INFLUX_USERNAME']}"
  config.influxdb_password = "#{ENV['INFLUX_PASSWORD']}"
  config.influxdb_hosts    = ["#{ENV['INFLUX_HOST']}"]
  config.influxdb_port     = 8086
  config.use_ssl           = true

  # config.retry = false
  # config.async = false
  # config.open_timeout = 5
  # config.read_timeout = 30
  # config.max_delay = 300
  # config.time_precision = 'ms'

  # config.series_name_for_controller_runtimes = "rails.controller"
  # config.series_name_for_view_runtimes       = "rails.view"
  # config.series_name_for_db_runtimes         = "rails.db"
end
