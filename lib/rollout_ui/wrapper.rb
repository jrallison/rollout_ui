module RolloutUi
  class Wrapper
    class RequestFeatureBeforeInitializingWrapper < StandardError; end

    attr_reader :rollout

    def initialize(rollout = nil)
      raise RequestFeatureBeforeInitializingWrapper unless rollout || @@rollout
      rollout ? @@rollout = @rollout = rollout : @rollout = @@rollout
    end

    def groups
      rollout.instance_variable_get("@groups").keys
    end

    def add_feature(feature)
      redis.sadd(:features, feature)
    end

    def features
      redis.smembers(:features)
    end

    def redis
      rollout.instance_variable_get("@redis")
    end
  end
end
