module RolloutUi
  class Feature
    User = Struct.new(:id)

    attr_reader :name

    def initialize(name)
      @wrapper = Wrapper.new
      @name = name.to_sym
    end

    def to_param
      name
    end

    def percentage
      rollout.get(feature_for(name)).percentage.to_s
    end

    def groups
      rollout.get(feature_for(name)).groups
    end

    def user_ids
      rollout.get(feature_for(name)).users
    end

    def percentage=(percentage_val)
      rollout.activate_percentage(name, percentage_val.to_i)
    end

    def groups=(groups)
      self.groups.each { |group| rollout.deactivate_group(name, group) }
      groups.each { |group| rollout.activate_group(name, group) unless group.to_s.empty? }
    end

    def user_ids=(ids)
      self.user_ids.each { |id| rollout.deactivate_user(name, User.new(id)) unless id.to_s.empty? }
      ids.each { |id| rollout.activate_user(name, User.new(id)) unless id.to_s.empty? }
    end

    def user_names
      RolloutUi.find_user_names(user_ids)
    end

    def user_names=(user_names)
      self.user_ids = RolloutUi.find_user_ids(user_names)
    end

  private

    def redis
      @wrapper.redis
    end

    def rollout
      @wrapper.rollout
    end

    def feature_for(name)
      rollout.features.select{|elem| elem == name}.first
    end
  end
end
