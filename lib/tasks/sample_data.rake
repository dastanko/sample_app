require 'faker'

namespace :db do
  desc "Fill in database with fake users"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Dastan Kojomuratov",
                 :email => "dastanko089@gmail.com",
                 :password => "dastan",
                 :password_confirmation => "dastan")
    admin.toggle!(:admin)
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@namba.kg"
      password = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
  end
end