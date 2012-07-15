require 'redis'
require 'rollout'
require 'rollout_ui/monkey_patch'

# Hack so we only load the engine when Rails will support it.
# TODO: find a better way
if defined?(Rails) && Rails::VERSION::STRING.to_f >= 3.1
  $:.unshift File.expand_path("rollout_ui/engine/lib", File.dirname(__FILE__))
  require 'rollout_ui/engine'
end

module RolloutUi
  autoload :Version, 'rollout_ui/version'
  autoload :Wrapper, 'rollout_ui/wrapper'
  autoload :Feature, 'rollout_ui/feature'
  autoload :Server,  'rollout_ui/server'

  def self.wrap(rollout)
    @@rollout = rollout
  end

  def self.rollout
    @@rollout
  end

  def self.find_users_by(field)
    @@user_name_field = field
  end

  def self.user_name_field
    @@user_name_field ||= :id
  end

  def self.user_class=(user_class)
    @@user_class = user_class
  end

  def self.user_class
    @@user_class ||= User
  end

  def self.find_user_names(user_ids)
    if @@user_name_field && user_ids.present?
      user_class.where(id: user_ids).pluck(@@user_name_field)
    else
      user_ids
    end
  end

  def self.find_user_ids(user_identifiers)
    if @@user_name_field && user_identifiers.present?
      user_class.where(@@user_name_field => user_identifiers).pluck(:id)
    else
      user_identifiers
    end
  end
end
