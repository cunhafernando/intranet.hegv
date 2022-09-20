class NoticiasController < ApplicationController
  include Paginable

  before_action :authenticate_user!, except: %i[index show]
  before_action :set_noticia, only: %i[ show edit update destroy ]

  # GET /noticias or /noticias.json
  def index
    @categorias = Categoria.sorted
    categoria = @categorias.select { |c| c.name == params[:categoria] }[0] if params[:categoria].present?
    @principais = Noticia.includes(:categoria, :user, :rich_text_content)
                         .filtro_por_categoria(categoria)
                         .filtro_por_archive(params[:month_year])
                         .desc_order
                         .first(3)
                         
                         
    
    principal_ids = @principais.pluck(:id).join(',')

    
    
    @noticias = Noticia.includes(:categoria, :user, :rich_text_content)
                       .without_principais(principal_ids)
                       .filtro_por_categoria(categoria)
                       .filtro_por_archive(params[:month_year])
                       .desc_order
                       .with_rich_text_content
                       .page(current_page)
                       
    @archives = Noticia.group_by_month(:created_at, format: '%B %Y').count           
                       
    
  end

  # GET /noticias/1 or /noticias/1.json
  def show
    authorize @noticia
  end

  # GET /noticias/new
  def new
    @noticia = current_user.noticias.new
  end

  # GET /noticias/1/edit
  def edit
  end

  # POST /noticias or /noticias.json
  def create
    @noticia = current_user.noticias.new(noticia_params)

    respond_to do |format|
      if @noticia.save
        format.html { redirect_to noticia_url(@noticia), notice: "Noticia criada con sucesso." }
        format.json { render :show, status: :created, location: @noticia }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @noticia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /noticias/1 or /noticias/1.json
  def update
    respond_to do |format|
      if @noticia.update(noticia_params)
        format.html { redirect_to noticia_url(@noticia), notice: "Noticia atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @noticia }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @noticia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /noticias/1 or /noticias/1.json
  def destroy
    @noticia.destroy

    respond_to do |format|
      format.html { redirect_to noticias_url, alert: "Noticia apagada com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_noticia
      @noticia = Noticia.find(params[:id])
      authorize @noticia
    end

    # Only allow a list of trusted parameters through.
    def noticia_params
      params.require(:noticia).permit(:titulo, :texto, :content, :arquivo, :categoria_id)
    end
end
