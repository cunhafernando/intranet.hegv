class RamaisController < ApplicationController
  before_action :set_ramal, only: %i[ show edit update destroy ]

  # GET /ramais or /ramais.json
  def index
    @ramais = Ramal.all
  end

  # GET /ramais/1 or /ramais/1.json
  def show
  end

  def remove_all
    Ramal.delete_all
    flash[:warn] = "Lista removida com sucesso"
    redirect_to new_ramal_path
  end

  def import_ramais
    file = params[:file]
    begin
      file_ext = File.extname(file.original_filename)
      raise "Unknown file type: #{file.original_filename}" unless [".xls", ".xlsx"].include?(file_ext)
      spreadsheet = (file_ext == ".xls") ? Roo::Excel.new(file.path) : Roo::Excelx.new(file.path)
      header = spreadsheet.row(1)
      ## We are iterating from row 2 because we have left row one for header
      (2..spreadsheet.last_row).each do |i|
        Ramal.create(setor: spreadsheet.row(i)[0], telefone: spreadsheet.row(i)[1], email: spreadsheet.row(i)[2], departamento: spreadsheet.row(i)[3])
      end
      flash[:notice] = "Lista importada"
      redirect_to ramais_path 
    rescue Exception => e
      flash[:notice] = "Problemas com o arquivo"
      redirect_to ramais_path 
    end
 end

  # GET /ramais/new
  def new
    @ramal = Ramal.new
  end

  # GET /ramais/1/edit
  def edit
  end

  # POST /ramais or /ramais.json
  def create
    @ramal = Ramal.new(ramal_params)

    respond_to do |format|
      if @ramal.save
        format.html { redirect_to ramal_url(@ramal), notice: "Ramal was successfully created." }
        format.json { render :show, status: :created, location: @ramal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ramal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ramais/1 or /ramais/1.json
  def update
    respond_to do |format|
      if @ramal.update(ramal_params)
        format.html { redirect_to ramal_url(@ramal), notice: "Ramal was successfully updated." }
        format.json { render :show, status: :ok, location: @ramal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ramal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ramais/1 or /ramais/1.json
  def destroy
    @ramal.destroy

    respond_to do |format|
      format.html { redirect_to ramais_url, notice: "Ramal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ramal
      @ramal = Ramal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ramal_params
      params.require(:ramal).permit(:setor, :telefone, :email, :departamento)
    end
end
