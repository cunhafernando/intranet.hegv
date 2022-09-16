class CategoriasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_categoria, only: %i[ edit update destroy ]
  

  # GET /categorias or /categorias.json
  def index
    @categorias = policy_scope(Categoria.sorted)
  end

  

  # GET /categorias/new
  def new
    @categoria = Categoria.new
    authorize @categoria
  end

  # GET /categorias/1/edit
  def edit
  end

  # POST /categorias or /categorias.json
  def create
    @categoria = Categoria.new(categoria_params)
    authorize @categoria

    respond_to do |format|
      if @categoria.save
        format.html { redirect_to categorias_url, notice: "Categoria criada com sucesso." }
        format.json { render :show, status: :created, location: @categoria }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @categoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categorias/1 or /categorias/1.json
  def update
    respond_to do |format|
      if @categoria.update(categoria_params)
        format.html { redirect_to categorias_url, notice: "Categoria atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @categoria }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @categoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categorias/1 or /categorias/1.json
  def destroy
    if @categoria.destroy

    respond_to do |format|
      format.html { redirect_to categorias_url, notice: "Categoria removida com sucesso." }
      format.json { head :no_content }
    end
    else
      redirect_to categorias_url, alert: @categoria.errors.messages[:base][0]
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categoria
      @categoria = Categoria.find(params[:id])
      authorize @categoria
    end

    # Only allow a list of trusted parameters through.
    def categoria_params
      params.require(:categoria).permit(:name)
    end
end
