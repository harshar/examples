class ClocksController < ApplicationController
  def index
    @clocks = Clock.all

    respond_to do |format|
      format.html 
      format.json { render json: @clocks }
    end
  end

  def show
    @clock = Clock.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @clock }
    end
  end

  def new
    @clock = Clock.new

    respond_to do |format|
      format.html
      format.json { render json: @clock }
    end
  end
  
  def edit
    @clock = Clock.find(params[:id])
  end

  def create
    @clock = Clock.new(params[:clock])

    respond_to do |format|
      if @clock.save
        format.html { redirect_to @clock, notice: 'Clock was successfully created.' }
        format.json { render json: @clock, status: :created, location: @clock }
      else
        format.html { render action: "new" }
        format.json { render json: @clock.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @clock = Clock.find(params[:id])

    respond_to do |format|
      if @clock.update_attributes(params[:clock])
        format.html { redirect_to @clock, notice: 'Clock was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @clock.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @clock = Clock.find(params[:id])
    @clock.destroy

    respond_to do |format|
      format.html { redirect_to clocks_url }
      format.json { head :ok }
    end
  end
end
