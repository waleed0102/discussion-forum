class Tag < ApplicationRecord
  has_many :sub_tags, class_name: 'Tag', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Tag', optional: true
end
