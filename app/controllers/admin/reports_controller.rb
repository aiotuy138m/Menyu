class Admin::ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
    @post = Post.find(@report.reported.id)
  end
end
