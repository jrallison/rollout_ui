$redis = Redis.new
$rollout = Rollout.new($redis)
RolloutUi.wrap($rollout)
