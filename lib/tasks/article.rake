namespace  :article do
  desc "update all article names to reflect name validations"
  task :clean  => :environment do
    Article.all.each { |a| a.save }
  end

  task :work  => :environment do
    HTTParty.get("http://www.johncdavison.com")
    HTTParty.get("http://rubyonrailstutor.herokuapp.com")
    HTTParty.get("http://footysubs.herokuapp.com/")
    HTTParty.get("http://www.hipcamp.com/")
  end

end
