class JornaisController < ApplicationController
  include Paginable
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_jornal, only: %i[ show edit update destroy ]

  # GET /jornais or /jornais.json
  def index
    @jornais = Jornal.order(created_at: :desc).page(current_page).per(8)
  end

  # GET /jornais/1 or /jornais/1.json
  def show
  end

  # GET /jornais/new
  def new
    @jornal = current_user.jornais.new
  end

  # GET /jornais/1/edit
  def edit
  end

  # POST /jornais or /jornais.json
  def create
    @jornal = current_user.jornais.new(jornal_params)

    respond_to do |format|
      if @jornal.save
        format.html { redirect_to jornal_url(@jornal), notice: "Jornal was successfully created." }
        format.json { render :show, status: :created, location: @jornal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @jornal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jornais/1 or /jornais/1.json
  def update
    respond_to do |format|
      if @jornal.update(jornal_params)
        format.html { redirect_to jornal_url(@jornal), notice: "Jornal was successfully updated." }
        format.json { render :show, status: :ok, location: @jornal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @jornal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jornais/1 or /jornais/1.json
  def destroy
    @jornal.destroy

    respond_to do |format|
      format.html { redirect_to jornais_url, notice: "Jornal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jornal
      @jornal = Jornal.find(params[:id])
      authorize @jornal
    end

    # Only allow a list of trusted parameters through.
    def jornal_params
      params.require(:jornal).permit(:titulo, :materia)
    end
end
