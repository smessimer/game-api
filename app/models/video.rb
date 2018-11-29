class Video < ActiveRecord::Base
  belongs_to :postable, polymorphic: true
end
