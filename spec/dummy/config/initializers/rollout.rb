$redis = Redis.new
$rollout = Rollout.new($redis)
RolloutUi.wrap($rollout)

$rollout.define_group(:admins) { |user| user.admin? }
$rollout.define_group(:beta_testers) { |user| user.beta_testers? }
