class Photo < ActiveRecord::Base
  belongs_to :postable, polymorphic: true
end
