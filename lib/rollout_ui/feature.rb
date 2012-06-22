module RolloutUi
  class Feature
    User = Struct.new(:id)

    attr_reader :name

    def initialize(name)
      @wrapper = Wrapper.new
      @name = name
    end

    def percentage
      redis.get(percentage_key(name))
    end

    def groups
      redis.smembers(group_key(name)) || []
    end

    def user_ids
      redis.smembers(user_key(name)) || []
    end

    def percentage=(percentage)
      rollout.activate_percentage(name, percentage)
    end

    def groups=(groups)
      redis.del(group_key(name))
      groups.each { |group| rollout.activate_group(name, group) unless group.to_s.empty? }
    end

    def user_ids=(ids)
      redis.del(user_key(name))
      ids.each { |id| rollout.activate_user(name, User.new(id)) unless id.to_s.empty? }
    end

  private

    def redis
      @wrapper.redis
    end

    def rollout
      @wrapper.rollout
    end

    [:percentage_key, :group_key, :user_key].each do |method_name|
      define_method(method_name) {|name| rollout.send(method_name, name)}
    end


  end
end
