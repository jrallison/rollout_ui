# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

FileUtils.mkdir_p 'log' unless File.exists?('log')
log = File.new("log/stdout.log", "a")
$stdout.reopen(log)
$stderr.reopen(log)

run Rack::URLMap.new \
  "/" => Dummy::Application,
  "/sinatra_rollout" => RolloutUi::Server.new
