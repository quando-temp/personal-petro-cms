workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3011
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

# app_dir = File.expand_path("../..", __FILE__)
# shared_dir = "#{app_dir}/shared"
# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers: a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum; this matches the default thread size of Active Record.
#

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
#

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart

# Change to match your CPU core count

# # Logging
# stdout_redirect "#{shared_dir}/tmp/log/puma.stdout.log", "#{shared_dir}/tmp/log/puma.stderr.log", true

# # Set master PID and state locations
# pidfile "#{shared_dir}/tmp/pids/puma.pid"
# state_path "#{shared_dir}/tmp/pids/puma.state"
# activate_control_app

# on_worker_boot do
#   require "active_record"
#   ActiveRecord::Base.connection.disconnect! rescue ActiveRecord::ConnectionNotEstablished
#   ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
# end
