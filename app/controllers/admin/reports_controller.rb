class Admin::ReportsController < ApplicationController
  def index
    @reports = Report.all.order("created_at DESC")
  end

  def show
    @report = Report.find(params[:id])
    @post = Post.find(@report.reported.id)
  end
end
