#!/bin/bash
bundle exec rake db:create
bundle exec rake db:migrate
rails s -b 0.0.0.0 -p 80