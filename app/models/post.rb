class Post < ApplicationRecord
	# for the Post model
	self.per_page = 5
	belongs_to :creator, 
		class_name: User.name, foreign_key: :user_id
	
	mount_uploader :image_url, PictureUploader
	
	# set per_page globally
	WillPaginate.per_page = 5
end
