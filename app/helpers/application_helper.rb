# -*- encoding : utf-8 -*-
module ApplicationHelper
	def title
    base_title = "Registro"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  def javascript (*files)
    content_for(:head){javascript_include_tag(*files)}
  end
  def stylesheet(*files)
    content_for(:head){stylesheet_link_tag(*files)}
  end
end
