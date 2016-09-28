class DecodingsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
  end

  def new
  end

  def show
    filtered = params.permit(:offset_letter, :message)
    # ^ protects against malicious extras returning to the form
    @message = Caesar.decode(params[:offset_letter].upcase!, params[:message].upcase!)
    # decode doesn't work unless the input is upcased >:(
    # @message = Caesar.decode('R', 'TRVJRI') used for debugging
  end
end
