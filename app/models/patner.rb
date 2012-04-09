# -*- encoding : utf-8 -*-
class Patner < ActiveRecord::Base
	belongs_to :locations
	attr_accessible :ocr, :apaterno, :no_seccion,:idSocio, :radio, :amaterno, :ciudad, :no_emision, :domicilio, :colonia, :cp, :tel_casa, :curp, :clve, :celular, :fb, :"e-mail", :nombre, :tw, :idCoordinacion, :no_localidad, :idusuario, :sexo, :esSocio, :no_municipio
	validates_presence_of :ocr
	validates :ocr, :uniqueness => {:message=>"Ya existe Número Consecutivo Nacional   "}
  validates :clve, :uniqueness => {:message=>" Ya existe Clave de Elector"}
def nombrec
  apaterno+' '+amaterno+' '+nombre
end
end

