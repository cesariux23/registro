# -*- encoding : utf-8 -*-
class Search 
	def socios
    @socios_s ||= find_socios
  end

  def initialize(options)
    @options = options || {}
  end
  def nombre
    @options[:nombre]
  end
  def ap    
    @options[:ap]
  end
  def am
    @options[:am]
    
  end
  def ocr
    @options[:ocr]
  end

private

def find_socios
  Patner.find(:all, :conditions => conditions)
end

def nombre_conditions
  ["patners.nombre LIKE ?", "%#{nombre}%"] unless nombre.blank?
end

def ap_conditions
  ["patners.apaterno LIKE ?", "%#{ap}%"] unless ap.blank?
end

def ocr_conditions
  ["patners.ocr LIKE ?", "%#{ocr}%"] unless ocr.blank?
end


def conditions
  [conditions_clauses.join(' AND '), *conditions_options]
end

def conditions_clauses
  conditions_parts.map { |condition| condition.first }
end

def conditions_options
  conditions_parts.map { |condition| condition[1..-1] }.flatten
end

def conditions_parts
  private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
end

end
