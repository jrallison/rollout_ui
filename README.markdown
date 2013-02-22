RolloutUI: A slick way to rollout features in your web app.
==========================================================

What does it do?
----------------

RolloutUI provides a zero-configuration user interface for James Golick's [rollout](https://github.com/jamesgolick/rollout). RolloutUI auto-detects features defined in rollout in your application.
It allows you to release features to groups, users or a percentage of your userbase through a nice interface rather than digging around in the console or modifying redis directly.

It looks something like this:
-----------------------------

![RolloutUI](https://img.skitch.com/20111018-kyqx954fxeny9tbjf6q3n7pymi.jpg)

Installing RolloutUI
--------------------

First, get [rollout](https://github.com/jamesgolick/rollout) set up and running on your app and define at least one feature.

Then you're ready to use RolloutUI.

Add it to your gemfile:

    gem "rollout_ui"

Wrap your rollout instance:

    $rollout = Rollout.new($redis)
    RolloutUi.wrap($rollout)

### Rails 3.1

In your `application.rb` file, require the rollout engine:

    require "rollout_ui/engine"

Mount the Rails engine in your routes.rb file:

    mount RolloutUi::Engine => "/rollout"

### Other

Run the sinatra app.  You can either run it as it's own app, or run it in
tandom with other rack apps.  Example: using Rack's `URLMap` in your `config.ru`:

    run Rack::URLMap.new \
      "/" => Your::App.new,
      "/rollout" => RolloutUi::Server.new

Protecting the sinatra app with HTTP basic auth is probably a good idea.
Put this somewhere before the `URLMap` in your `config.ru`:

    RolloutUi::Server.use Rack::Auth::Basic do |username, password|
      username == '<some username>' && password == '<some password>'
    end

Resources
---------

* Rollout: <https://github.com/jamesgolick/rollout>
* Redis: <http://redis.io>

Patches/Pull Requests
---------------------

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Send me a pull request.

Thanks
------
* Thanks to James Golick for the great [rollout gem](https://github.com/jamesgolick/rollout).
* Thanks to [ChallengePost](http://challengepost.com) for sponsoring additional development and
supporting open sourcing it from the start.
* Thanks to [Holly Tiwari](http://holly-smith.com/) for the design!
