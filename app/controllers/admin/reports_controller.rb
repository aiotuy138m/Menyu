class Admin::ReportsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @reports = Report.page(params[:page]).per(10).order("created_at DESC")
  end

  def show
    @report = Report.find(params[:id])
    @post = Post.find(@report.reported.id)
    @customer = Customer.find(@post.customer_id)
    customer = Customer.find(@report.reporter_id)
    @reporter = customer.nickname
  end
end
