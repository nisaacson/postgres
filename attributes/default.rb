
default['postgres']['user']                    = "postgres"
default['postgres']['group']                   = "postgres"
default['postgres']['service']                 = "postgres"
default['postgres']['data_dir']                = "/var/pgsql/data"
default['postgres']['log_file']                = "/var/log/postgres/stderr.log"
default['postgres']['prefix_dir']              = "/opt/local/postgres-%VERSION%"
default['postgres']['version']                 = "9.2.1"
default['postgres']['remote_tar']              = "http://ftp.postgresql.org/pub/source/v%VERSION%/postgresql-%VERSION%.tar.gz"

default['postgres']['encoding']                = "en_US.UTF-8"

default['postgres']['config']['stats_temp_directory']       = "/tmp/pg_stats_temp_directory"

# shared_buffers_mb will be automatically set to 25% of available RAM, up to 8Gb
# unless specified explicitly. cache size is auto-set to 70% of available RAM.
default['postgres']['config']['shared_buffers_mb']          = nil
default['postgres']['config']['effective_cache_size_mb']    = nil

default['postgres']['config']['max_connections']            = 400

default['postgres']['config']['checkpoint_segments']          = 64
default['postgres']['config']['checkpoint_completion_target'] = 0.9

# Change this to a larger value to keep more WAL logs. The number of segments defines
# how far behind a replica can fall and then still catch up to the master. Each segment is 16Mb.
default['postgres']['config']['wal_keep_segments']       = 128

# These below have been tuned for PostgreSQL on Joyent SmartOS
default['postgres']['config']['temp_buffers_mb']         = 8
default['postgres']['config']['work_mem_mb']             = 8
default['postgres']['config']['maintenance_work_mem_mb'] = 16
default['postgres']['config']['random_page_cost']        = 2.0 # tuned for SmartOS

# -1 disables, otherwise number of milliseconds for slow query log
default['postgres']['config']['log_min_duration_statement_ms'] = 50
default['postgres']['config']['log_destination']         = 'stderr'
# suggested prefix for pgfouine compatibility (not yet verified)
default['postgres']['config']['log_line_prefix']         = '%t [%p]: [%l-1] user=%u,db=%d '

# Replication
# Setting this to 'on' allows standby replicas to run read only queries
default['postgres']['config']['max_standby_streaming_delay']   = '30s'


default['postgres']['config']['listen_port']             = 5432

# User either list_addresses (array of IPs) or listen_interfaces, but not both.
default['postgres']['listen_addresses']                  = []
# On multi-homed default SmartOS installs, net0 will be a public IP and net1 will be a private IP
# lo0 will be localhost
default['postgres']['listen_interfaces']                 = ["net1", "lo0"]
default['postgres']['connections']  = {
    "127.0.0.1/0" => "trust"
}
