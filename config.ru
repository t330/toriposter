# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

# Unicorn self-process killer
require 'unicorn/worker_killer'

# Max requests per worker
use Unicorn::WorkerKiller::MaxRequests, 100, 120, true

# Max memory size (RSS) per worker
use Unicorn::WorkerKiller::Oom, (192*(1024**2)), (256*(1024**2)), 16

run Rails.application
