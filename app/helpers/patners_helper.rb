module PatnersHelper
	def render_local
		@id_mun= params[:id_mun]
		render :partial => "local"
	end
end
