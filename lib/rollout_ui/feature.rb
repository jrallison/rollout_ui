module RolloutUi
  class Feature
    User = Struct.new(:id)

    attr_reader :name

    delegate :percentage_key, :group_key, :user_key, :to => :rollout

    def initialize(name)
      @wrapper = Wrapper.new
      @name = name
    end

    def percentage
      redis.get(percentage_key(name))
    end

    def groups
      redis.smembers(group_key(name))
    end

    def users
      redis.smembers(user_key(name))
    end

    def percentage=(percentage)
      rollout.activate_percentage(name, percentage)
    end

    def groups=(groups)
      redis.del(group_key(name))
      groups.each { |group| rollout.activate_group(name, group) }
    end

    def users=(users)
      redis.del(user_key(name))
      users.each { |user| rollout.activate_user(name, User.new(user)) unless user.empty? }
    end

  private

    def redis
      @wrapper.redis
    end

    def rollout
      @wrapper.rollout
    end
  end
end
