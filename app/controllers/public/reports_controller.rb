class Public::ReportsController < ApplicationController
  before_action :authenticare_customer
  def new
    @report = Report.new
    @post = Post.find(params[:post_id])
  end

  def create
    @report = Report.new(report_params)
    @post = Post.find(params[:post_id])
    if @report.save
      redirect_to posts_path, danger: "通報しました　ご協力ありがとうございます"
    else
      render "new"
    end
  end


  private

  def report_params
    params.require(:report).permit(:reason, :reporter_id, :reported_id)
  end
end
