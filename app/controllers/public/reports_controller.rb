class Public::ReportsController < ApplicationController
  def new
    @report = Report.new
    @post = Post.find(params[:post_id])
    @customer = Customer.find(current_customer.id)
  end

  def create
    @customer = Customer.find(current_customer.id)
    @report = Report.new(report_params)
    if @report.save!
      redirect_to posts_path, danger: "通報しました　ご協力ありがとうございます"
    else
      render :new
    end
  end


  private

  def report_params
    params.require(:report).permit(:reason, :reporter_id, :reported_id)
  end
end
