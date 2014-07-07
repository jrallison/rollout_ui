module RolloutUi
  class Wrapper
    class NoRolloutInstance < StandardError; end

    attr_reader :rollout

    def initialize(rollout = nil)
      @rollout = rollout || RolloutUi.rollout
      raise NoRolloutInstance unless @rollout
    end

    def groups
      rollout.instance_variable_get("@groups").keys
    end

    def add_feature(feature)
      redis.sadd(:features, feature)
    end

    def remove_feature(feature)
      redis.srem(:features, feature)
    end

    def features
      features = redis.smembers(:features)
      features ? features.sort : []
    end

    def redis
      rollout.instance_variable_get("@storage")
    end
  end
end
