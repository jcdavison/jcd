namespace :ping do
  desc "ping domains to keep dyno active"
  task :go  => :environment do
    HTTParty.get('http://www.johncdavison.com')
  end

end

