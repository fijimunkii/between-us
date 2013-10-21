class SearchesController < ApplicationController

  def new
    @search = Search.new
  end

  def create
    @search = Search.new params[:location]
  end

end
