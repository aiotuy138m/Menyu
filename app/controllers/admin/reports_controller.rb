class Admin::ReportsController < ApplicationController
  def index
    @reports = Report.page(params[:page]).per(10).order("created_at DESC")
  end

  def show
    @report = Report.find(params[:id])
    @post = Post.find(@report.reported.id)
  end
end
