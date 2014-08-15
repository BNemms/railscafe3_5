class PairingsController < ApplicationController

	def index
		@pairings = Pairing.all
		@pairing = Pairing.new
	end

	# This builds a new pairing from the auto-complete textbox entries
	def create
		# Hopefully we got back valid bean and pastry names
		# If the user uses the auto-complete then it really should be fine
		bean = Bean.where(name: params[:bean_name]).first
		pastry = Pastry.where(name: params[:pastry_name]).first
		# Check if one or both of these are bogus
		if !bean || !pastry
			flash.alert = "You must choose a valid " + (!bean ? "bean" : "") + (!bean && !pastry ? " and " : "") +
				(!pastry ? "pastry" : "") + "!"
			render :index
		# Check to make sure this combination isn't already a pairing
		elsif Pairing.where(bean: bean, pastry: pastry).count > 0
			flash.alert = "That combination already exists!"
			render :index
		else
			# OK, coast is clear -- let's make a new pairing
			pairing = Pairing.create(bean: bean, pastry: pastry)
			redirect_to pairings_path
		end
	end

	# This updates the "constellation" (the grid) of bean / pastry associations
	def update
		Pairing.destroy_all
		params.each do |key,val|
			if key[0..6] == "checky_"
				pieces = key.split("_")
				Pairing.create(bean_id: pieces[1], pastry_id: pieces[2])
			end
		end
		redirect_to pairings_path
	end
end
