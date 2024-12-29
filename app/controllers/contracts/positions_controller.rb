class Contracts::PositionsController < ApplicationController
  before_action :set_position, only: %i[ show edit update destroy ]

  def index
    @positions = Position.all
  end

  def show
  end


  def new
    @position = Position.new
  end

  def edit
  end

  def create
    @position = Position.new(position_params)

    respond_to do |format|
      if @position.save
        format.html { redirect_to contract_position_url(@position), notice: "Position was successfully created." }
        format.json { render :show, status: :created, location: @position }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @position.update(position_params)
        format.html { redirect_to contract_position_url(@position), notice: "Position was successfully updated." }
        format.json { render :show, status: :ok, location: @position }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @position.destroy!

    respond_to do |format|
      format.html { redirect_to contract_positions_url, notice: "Position was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_position
      @position = Position.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def position_params
      params.expect(position: [ :title, :ar_title ])
    end
end
