# require 'sidekiq'




# Sidekiq.configure_server do |config|
# 	schedule_file = "config/schedule.yml"
# 	puts "sn this file is schedule"
# 	puts schedule_file
# 	if File.exist?(schedule_file) && Sidekiq.server?
# 		puts "i>>>>>>>in<<<<<<<"
# 	  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
# 	end
# 	config.redis = { db: 1}
# end

# Sidekiq.configure_client do |config|
# 	puts "snkdnsd. jkskjndnskd s kdsnkdbskd!!!!!<><<<<<>>>>>"
# 	config.redis = { db: 1}
# end


schedule_file = "config/schedule.yml"
if File.exist?(schedule_file) && Sidekiq.server?
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end




