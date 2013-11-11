desc "Fetch Lauren posts"
task :fetch_posts => :environment do 
require 'nokogiri'
require 'open-uri'

	array = %w(steeling-clothes big-heart pretty-women the-stool-test men-and-their-jeans) 
	array.each do |post|
		url = "http://writerlauren.com/#{post}/"
		doc = Nokogiri::HTML(open(url))
		title = doc.css(".art-postheader a").text.strip
		result = doc.css(".category-uncategorized p").to_html
		Post.create(title: title, content: result, user_id: 1, published: true)
	end
end


