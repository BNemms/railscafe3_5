class PairingsController < ApplicationController

	def index
		@pairings = Pairing.all
		@pairing = Pairing.new
	end

	def create
		Pairing.destroy_all
		params.each do |key,val|
			if key[0..6] == "checky_"
				pieces = key.split("_")
				Pairing.create(bean_id: pieces[1], pastry_id: pieces[2])
			end
		end

#		pairing = Pairing.create(params.require(:pairing).permit(:bean_id, :pastry_id))
		redirect_to pairings_path
	end

end
