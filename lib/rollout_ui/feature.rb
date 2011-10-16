module RolloutUi
  class Feature
    User = Struct.new(:id)

    attr_reader :name

    def initialize(name)
      @wrapper = Wrapper.new
      @name = name
    end

    def percentage
      redis.get("feature:#{name}:percentage")
    end

    def groups
      redis.smembers("feature:#{name}:groups")
    end

    def users
      redis.smembers("feature:#{name}:users")
    end

    def percentage=(percentage)
      rollout.activate_percentage(name, percentage)
    end

    def groups=(groups)
      redis.del("feature:#{name}:groups")
      groups.each { |group| rollout.activate_group(name, group) }
    end

    def users=(users)
      redis.del("feature:#{name}:users")
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
