class Feed < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :feed_point
  end
  
end
