namespace  :ping do
  desc "ping domains to keep dyno active"
  task :go  => :environment do
    p "this is working"
  end

  desc "ping domains to keep dyno active"
  task :leave  => :environment do
    p "this is working"
  end

end

