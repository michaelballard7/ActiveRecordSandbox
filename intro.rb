require "rubygems"
require "bundler/setup"
require 'active_record'
require "sqlite3"
require "logger"


# establish a connection with a particular adapter
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "test"
)

# Instantiate the logger to see SQL output
ActiveRecord::Base.logger = Logger.new(STDOUT)

# Use active record to build datatable,if not exist
ActiveRecord::Schema.define do
  create_table :Accounts, force: true do |t|
    t.string :username
    t.string :password
  end
end

class Account < ActiveRecord::Base

end

account = Account.new
account.username = "Michael"
p account.username
p account.password
account.password = "Qwerty"
account.save
p account.password
