class Post < ActiveRecord::Base
	belongs_to :user

	def publish
		if self.published == false
			self.published = true
			self.save
		end
	end

	def unpublish
		if self.published == true
			self.published = false
			self.save
		end
	end
end
