# SessionManager
Engine to track user sessions with minimal configurations.

## Installation
1. Copy the engine folder to the engines path.
2. Add this line to your application's Gemfile:

```ruby
gem 'session_manager', path: "engines/session_manager"
```

And then execute:
```bash
$ bundle
```
Also run migration:
```bash
$ rails db:migrate
```

## Mount the engine
Add the following line to the config/routes.rb file
```ruby
mount SessionManager::Engine, at: "/session_manager"
```

## Usage
Update you main config/application.rb file similar to following. Require the helper file and include the helper method.
```ruby
require "#{SessionManager::Engine.root}/app/controllers/session_manager/concerns/request_helpers.rb"

class ApplicationController < ActionController::Base
  include SessionManager::RequestHelpers

  before_action :track_session
end
```
The 'track_session' method is responsible for tracking the cookies and user login status.


## Access the UI page
You can access the UI for tracking the users at
```ruby
http://localhost:3000/session_manager/sessions
```



## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
