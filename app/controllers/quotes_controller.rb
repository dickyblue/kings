class QuotesController < ApplicationController
  
  before_filter :authenticate_admin

  def manage
    @quote = Quote.new if @quote.nil?
    @quote = Quote.find(params[:id]) if params[:id]
  end
  
  def list
    @search = Quote.search(params[:search])
    @quotes = @search.paginate(:page => params[:page], :per_page => 10, :order => "created_at DESC")
  end
  
  def create
    @quote = Quote.new(params[:quote])
    if @quote.save
      redirect_to(:action => 'list')
    else
      render "manage"
    end
  end
  
  def update
    @quote = Quote.find(params[:quote])
    if @quote.update_attributes(params[:quote])
      redirect_to(:action => 'list')
    else
      render "manage"
    end    
  end
  
  def destroy
    Quote.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

end
