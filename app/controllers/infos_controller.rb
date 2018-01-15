class InfosController < ApplicationController
  before_filter :current_user, :only => [:destroy]
  def index
      @infos = Info.all
  end

  def show
    @info = Info.find(params[:id])
  end

  def new
    @info = current_user.infos.build
  end

  def edit
    @info = Info.find(params[:id])
  end

  def create
    @info = current_user.infos.build(info_params)

    respond_to do |format|
      if @info.save
        format.html { redirect_to @info, notice: 'Info was successfully created.' }
        format.json { render :show, status: :created, location: @info }
      else
        format.html { render :new }
        format.json { render json: @info.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @info = Info.find_by(id: params[:id])
      respond_to do |format|
        if @info.update(info_params)
          format.html { redirect_to @info, notice: 'Info was successfully updated.' }
          format.json { render :show, status: :ok, location: @info }
        else
          format.html { render :edit }
          format.json { render json: @info.errors, status: :unprocessable_entity }
        end
      end
    end


  def destroy
    @info = Info.find_by(id: params[:id])
    @info.destroy
    respond_to do |format|
      format.html { redirect_to infos_url, notice: 'Info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_info
      @info = Info.find(params[:id])
    end

    def info_params
          params.require(:info).permit(:first_name, :last_name, :phone_number, :adress, :state, :zip_code)
    end
end
