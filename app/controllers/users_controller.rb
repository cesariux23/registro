# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  before_filter :authenticate

  def index
    if current_user.is_admin?
      @users = User.all
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @users }
      end
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show 
             
    @coord = Cordination.find_by_idcoordinacion(current_user.id_coord)
    @socios = Patner.where("idCoordinacion = ?",current_user.id_coord)
    @nagr=0, @nsoc = 0
    if !@socios.nil? 
      if !@socios.where("esSocio = ?", true).nil?
        @nsoc=@socios.where("esSocio = ?", true).size
      end
      if !@socios.where("esSocio = ?", false).nil?
        @nagr=@socios.where("esSocio = ?", false).size
      end
    end
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    if current_user.is_admin?
      @user = User.new    
      @coordinaciones=Cordination.all

      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @user }
      end
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  # GET /users/1/edit
  def edit
    if current_user.is_admin?
      @user = User.find(params[:id])
    else
      raise ActionController::RoutingError.new('Not Found')
    end      
  end

  # POST /users
  # POST /users.json
  def create
    if current_user.is_admin?
      @user = User.new(params[:user].merge({:enabled => true, :is_admin=> false}))

      respond_to do |format|
        if @user.save
          format.html { redirect_to users_url, :notice => 'Usuario Guardado!' }
          format.json { render :json => @user, :status => :created, :location => @user }
        else
          format.html { render :action => "new" }
          format.json { render :json => @user.errors, :status => :unprocessable_entity }
        end
      end
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    if current_user.is_admin?
      @user = User.find(params[:id])

      respond_to do |format|
        if @user.update_attributes(params[:user])
          format.html { redirect_to @user, :notice => 'Usuario Actualizado!' }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @user.errors, :status => :unprocessable_entity }
        end
      end
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end 

  private

    def authenticate
      deny_access unless signed_in?
    end  
end
