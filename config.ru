require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#In order to send PATCH and DELETE requests.
use Rack::MethodOverride
use UsersController
use CasesController
run ApplicationController
