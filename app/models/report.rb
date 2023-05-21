class Report < ApplicationRecord
  belongs_to :reporter, class_name: "Post", optional: true
  belongs_to :reported, class_name: "Post", optional: true
  
  validates :reason, presence: true
end
