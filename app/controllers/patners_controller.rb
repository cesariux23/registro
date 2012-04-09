class PatnersController < ApplicationController
  # GET /patners
  # GET /patners.json
 before_filter :authenticate
  def index
    if current_user.is_admin?
      @patners = Patner.all
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @patners }
      end      
    else
      raise ActionController::RoutingError.new('Not Found')
    end    
  end

  # GET /patners/1
  # GET /patners/1.json
  def show
    @socio = Patner.find(params[:id])
    @patners=Patner.where("idCoordinacion =? and esSocio= false and idSocio=?", current_user.id_coord, @socio.ocr)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @patner }
    end
  end

  # GET /patners/new
  # GET /patners/new.json
  def new 
    @socio=Patner.find(params[:id_socio]) unless params[:id_socio].nil?
    @patner = Patner.new
    if @socio.nil?
      @title="Nuevo socio"
    else
      @title="Registrar agremiado"
    end
    
    @municipios= Municipality.where("idcoordinacion= ?", current_user.id_coord)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @patner}
    end
  end

  # GET /patners/1/edit
  def edit
    @municipios= Municipality.where("idcoordinacion= ?", current_user.id_coord) 
    @patner = Patner.find(params[:id])
    params[:modo]='edit'
  end

  # POST /patners
  # POST /patners.json
  def create
    @patner = Patner.new(params[:patner].merge({:no_localidad =>1, :idCoordinacion=> current_user.id_coord, :idusuario =>current_user.id, :esSocio=> params[:esSocio], :idSocio=> params[:idSocio]}))
    respond_to do |format|
      if @patner.save
        @socio=Patner.find(params[:idSocio]) unless params[:idSocio].nil?
        if @socio.nil?          
          format.html { redirect_to current_user, :notice => 'Registro Guardado.!' }        
        else                    
          if params[:commit]=="Guardar y registrar otro"
            @patner=Patner.new
            format.html { redirect_to new_patner_path(:id_socio =>@socio.ocr), :notice => 'Registro Guardado.!'}
          else              
            format.html { redirect_to @socio, :notice => 'Registro Guardado.!' }
          end
        end
      else
        format.html { render :action => "new" }
        format.json { render :json => @patner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patners/1
  # PUT /patners/1.json
  def update
    @patner = Patner.find(params[:id])
    @socio=Patner.find(@patner.idSocio) unless @patner.idSocio.nil?
    respond_to do |format|
      if @patner.update_attributes(params[:patner])
        if @socio.nil? 
          format.html { redirect_to @patner, :notice => 'Datos Actualizados!' }
        else
          format.html { redirect_to @socio, :notice => 'Datos Actualizados!' }
        end
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @patner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patners/1
  # DELETE /patners/1.json
  def destroy
    if current_user.is_admin?
      @patner = Patner.find(params[1])
      @patner.destroy

      respond_to do |format|
        format.html { redirect_to patners_url }
        format.json { head :no_content }
      end
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end
  def existe_ocr
    @existe
     if Patner.find_by_ocr(params[:ocr]).nil?
       @existe = false
      else
        @existe= true
      end      
      respond_to do |format|
        format.json  { render :json => @existe }      
      end
  end

  def existe_clve
    @existe_c
     if Patner.find_by_clve(params[:clve]).nil?
       @existe_c = false
      else
        @existe_c= true
      end      
      respond_to do |format|
        format.json  { render :json => @existe_c }      
      end
  end
  
  def authenticate
      deny_access unless signed_in?
    end
    
  def actualiza
  	@localidades = Location.where("no_municipio =?", params[:id])	    
    respond_to do |format|
    	format.json  { render :json => @localidades }      
    end  	  	
  end
end
 