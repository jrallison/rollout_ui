module RolloutUi
  class Engine < Rails::Engine
    isolate_namespace RolloutUi
    
    initializer 'rollout_ui.assets.precompile' do |app|
      app.config.assets.precompile += %w(rollout_ui/rollout.png)
    end
  end
end
