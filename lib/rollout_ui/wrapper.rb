module RolloutUI
  class Wrapper
    def initialize(rollout)
      @rollout = rollout
    end

    def groups
      @rollout.instance_variable_get("@groups")
    end

    def add_feature(feature)
      redis.sadd(:features, feature)
    end

    def features
      redis.smembers(:features)
    end

  private

    def redis
      @rollout.instance_variable_get("@redis")
    end
  end
end
