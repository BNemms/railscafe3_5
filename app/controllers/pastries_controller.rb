class PastriesController < ApplicationController
  before_action :set_pastry, only: [:show, :edit, :update, :destroy]

  # GET /pastries
  # GET /pastries.json
  def index
    @pastries = Pastry.all
  end

  # GET /pastries/1
  # GET /pastries/1.json
  def show
  end

  # GET /pastries/new
  def new
    @pastry = Pastry.new
  end

  # GET /pastries/1/edit
  def edit
  end

  # POST /pastries
  # POST /pastries.json
  def create
    @pastry = Pastry.new(pastry_params)

    respond_to do |format|
      if @pastry.save
        format.html { redirect_to @pastry, notice: 'Pastry was successfully created.' }
        format.json { render :show, status: :created, location: @pastry }
      else
        format.html { render :new }
        format.json { render json: @pastry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pastries/1
  # PATCH/PUT /pastries/1.json
  def update
    respond_to do |format|
      if @pastry.update(pastry_params)
        format.html { redirect_to @pastry, notice: 'Pastry was successfully updated.' }
        format.json { render :show, status: :ok, location: @pastry }
      else
        format.html { render :edit }
        format.json { render json: @pastry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pastries/1
  # DELETE /pastries/1.json
  def destroy
    @pastry.destroy
    respond_to do |format|
      format.html { redirect_to pastries_url, notice: 'Pastry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pastry
      @pastry = Pastry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pastry_params
      params.require(:pastry).permit(:name, :type, :price)
    end
end
