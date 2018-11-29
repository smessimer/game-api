class Text < ActiveRecord::Base
  belongs_to :postable, polymorphic: true
end
