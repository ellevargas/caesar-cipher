class EncodingsController < ApplicationController
  # another authenticity workaround besides adding to the view:
  skip_before_filter :verify_authenticity_token

  def index
  end

  def new
  end

  def show
    @message = Caesar.encode(params[:offset_letter], params[:message])
  end
end
