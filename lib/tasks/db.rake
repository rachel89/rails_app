if Rails.env == 'production'
	tasks = Rake.application.instance_variable_get '@tasks'
	tasks.delete 'db:reset'
	tasks.delete 'db:drop'
	tasks.delete 'db:create'
	namespace :db do
		desc 'db:reset not available in this environment'
		task :reset do
			puts 'db:reset has been disabled'
		end
		desc 'db:drop not available in this environment'
		task :drop do
			puts 'db:drop has been disabled'
		end
		desc 'db:create not available in this environment'
		task :create do
			puts 'db:create has been disabled'
		end
	end
end
