# RAILSCAFE3

class BeansController < ApplicationController

	def index
		my_bean_filter = params[:beanfilter]
		case my_bean_filter
		when "showall"
		  @beans = Bean.all
		when "dark"
			@beans = Bean.where(:roast => "dark")
		when "light"
			@beans = Bean.where(:roast => "light")
		when "instock"
			@beans = Bean.where(:quantity.gt => 0)
		else
		  @beans = Bean.all
		end
	end

	def show
		@bean = Bean.find(params[:id])
	end

	def new
		@bean = Bean.new
		@button_face = "Add a new bean in your life"
	end

	def create 
		@bean = Bean.new(bean_params())
		if @bean.save
			redirect_to beans_path
		else
			render 'new'
		end
	end

	def edit
		@bean = Bean.find(params[:id])
		@button_face = "Modify an existing bean in your life"
	end

	def update
		@bean = Bean.find(params[:id])
		if @bean.update_attributes(bean_params)
			redirect_to beans_path
		else
			render 'edit'
		end
	end

	def destroy
		@bean = Bean.find(params[:id])
		@bean.destroy
		redirect_to beans_path
	end

private
	def bean_params
		params.require(:bean).permit(:name, :roast, :origin, :quantity, pastry_ids: [])
	end
end
