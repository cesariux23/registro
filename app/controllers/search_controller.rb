# -*- encoding : utf-8 -*-
class SearchController < ApplicationController
before_filter :authenticate
   def new
  	@title = "Busqueda"
		@result = 0
  end

  def create
    search = Search.new(params[:search])
    @socios=search.socios
    if @socios.size==0
    	puts 'vacio'
			@result = 0
    	flash.now[:error] = "No se encontraron registros." 
    	render 'new'     
    else
			@result = 1
    	params[:socios]=@socios
    	render 'new' 
    end

  end
def authenticate
      deny_access unless signed_in?
    end
end
