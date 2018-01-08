class Post < ApplicationRecord
	# for the Post model
	self.per_page = 5
	
	# set per_page globally
	WillPaginate.per_page = 5
end
