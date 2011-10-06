require 'sinatra/base'
require 'erb'
require 'time'

if defined? Encoding
  Encoding.default_external = Encoding::UTF_8
end

module RolloutUI
  User = Struct.new(:id)

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

      def url_path(*path_parts)
        [ path_prefix, path_parts ].join("/").squeeze('/')
      end
      alias_method :u, :url_path

      def path_prefix
        request.env['SCRIPT_NAME']
      end
    end

    get "/?" do
      response["Cache-Control"] = "max-age=0, private, must-revalidate"
      erb :index, { :layout => true }
    end

    post '/update' do
      feature = params["feature"]

      rollout = Rollout.new(RolloutUI.redis)
      rollout.deactivate_all(feature)

      rollout.activate_percentage(feature, params["percentage"]) if params["percentage"]

      (params["groups"] || []).each do |group|
        rollout.activate_group(feature, group)
      end

      (params["users"] || []).each do |user|
        rollout.activate_user(feature, User.new(user)) unless user.empty?
      end

      redirect url_path
    end
  end
end
