class QuotesController < ApplicationController
  
  before_filter :authenticate_admin

  def manage
    @quote = Quote.new if @quote.nil?
    @quote = Quote.find(params[:id]) if params[:id]
  end
  
  def list
    @search = Quote.ransack(params[:search])
    @quotes = @search.result.paginate(page: params[:page], per_page: params[10])
  end
  
  def create
    @quote = Quote.new(quote_params)
    if @quote.save
      redirect_to(:action => 'list')
    else
      render "manage"
    end
  end
  
  def update
    @quote = Quote.find(params[:id])
    if @quote.update_attributes(quote_params)
      redirect_to(:action => 'list')
    else
      render "manage"
    end    
  end
  
  def destroy
    Quote.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
  
  private 
  
  def quote_params
    params.require(:quote).permit(
    :quote, 
    :author, 
    :travel,
    :food 
    )
  end

end
