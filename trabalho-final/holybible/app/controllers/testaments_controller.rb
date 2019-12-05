class TestamentsController < ApplicationController
  before_action :set_testament, only: [:show, :edit, :update, :destroy]

  # GET /testaments
  # GET /testaments.json
  def index
    @testaments = Testament.all
  end

  # GET /testaments/1
  # GET /testaments/1.json
  def show
  end

  # GET /testaments/new
  def new
    @testament = Testament.new
  end

  # GET /testaments/1/edit
  def edit
  end

  # POST /testaments
  # POST /testaments.json
  def create
    @testament = Testament.new(testament_params)

    respond_to do |format|
      if @testament.save
        format.html { redirect_to @testament, notice: 'Testament was successfully created.' }
        format.json { render :show, status: :created, location: @testament }
      else
        format.html { render :new }
        format.json { render json: @testament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /testaments/1
  # PATCH/PUT /testaments/1.json
  def update
    respond_to do |format|
      if @testament.update(testament_params)
        format.html { redirect_to @testament, notice: 'Testament was successfully updated.' }
        format.json { render :show, status: :ok, location: @testament }
      else
        format.html { render :edit }
        format.json { render json: @testament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testaments/1
  # DELETE /testaments/1.json
  def destroy
    @testament.destroy
    respond_to do |format|
      format.html { redirect_to testaments_url, notice: 'Testament was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testament
      @testament = Testament.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def testament_params
      params.require(:testament).permit(:name)
    end
end
