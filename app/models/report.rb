class Report < ApplicationRecord
  belongs_to :reporter, class_name: "Post", optional: true
  belongs_to :reported, class_name: "Post", optional: true
  
  
  def reported_customer
    @posts = Post.where(id: reported_id)
    @customer = Customer.where(id: @posts.customer_id)
  end
end
