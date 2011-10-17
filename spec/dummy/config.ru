# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

FileUtils.mkdir_p 'log' unless File.exists?('log')
log = File.new("log/stdout.log", "a")
$stdout.reopen(log)
$stderr.reopen(log)

class ApplicationMap
  def initialize
    @rollout = RolloutUi::Server.new
    @dummy   = Dummy::Application
  end

  def call(env)
    path = env["PATH_INFO"].to_s

    if path =~ /^\/sinatra_rollout/
      @rollout.call(env.merge(
        'SCRIPT_NAME' => (env['SCRIPT_NAME'] + "/sinatra_rollout"),
        'PATH_INFO'   => path.gsub(/^\/sinatra_rollout/, "")))
    else
      @dummy.call(env)
    end
  end
end

run ApplicationMap.new
