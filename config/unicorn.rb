shared_path = "/var/www/rails/toriposter/shared/"
current_path = "/var/www/rails/toriposter/current"

# ソケット経由で通信する
# ここがcapistranoの設定と合致していないと失敗する
listen File.expand_path('tmp/sockets/unicorn.sock', shared_path)
pid File.expand_path('tmp/pids/unicorn.pid', shared_path)


# capistrano 用に RAILS_ROOT を指定
working_directory current_path

# ダウンタイムなくす
preload_app true

before_fork do |server, worker|
  ENV['BUNDLE_GEMFILE'] = File.expand_path('Gemfile', current_path)
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end