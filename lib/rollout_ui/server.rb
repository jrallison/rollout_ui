require 'sinatra/base'
require 'erb'
require 'time'

if defined? Encoding
  Encoding.default_external = Encoding::UTF_8
end

class RolloutUI::Server < Sinatra::Base
  dir = File.dirname(File.expand_path(__FILE__))

  set :views,  "#{dir}/server/views"
  set :public, "#{dir}/server/public"
  set :static, true

  helpers do
    include Rack::Utils
    alias_method :h, :escape_html

    def partial?
      @partial
    end

    def partial(template, local_vars = {})
      @partial = true
      erb(template.to_sym, {:layout => false}, local_vars)
    ensure
      @partial = false
    end
  end

  # to make things easier on ourselves
  get "/?" do
    response["Cache-Control"] = "max-age=0, private, must-revalidate"
    erb :index, {:layout => true}
  end
end
