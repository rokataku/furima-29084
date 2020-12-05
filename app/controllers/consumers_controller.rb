class ConsumersController < ApplicationController
  def index
    @consumer = Consumer.new
  end

  def new
  end

  def create
    @consumer = Consumer.new
    if @consumer.valid?
      @consumer.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  
end
