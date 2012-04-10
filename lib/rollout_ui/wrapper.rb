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

    def features
      redis.smembers(:features).sort
    end

    def redis
      rollout.instance_variable_get("@redis")
    end
  end
end
