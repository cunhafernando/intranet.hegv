class NoticiasController < ApplicationController
  before_action :set_noticia, only: %i[ show edit update destroy ]

  # GET /noticias or /noticias.json
  def index
    @principais = Noticia.desc_order.first(3)
    current_page = (params[:page] || 1).to_i
    principal_ids = @principais.pluck(:id).join(',')
    
    @noticias = Noticia.without_principais(principal_ids)
                        .desc_order
                        .page(current_page)
                        .with_rich_text_content
  end

  # GET /noticias/1 or /noticias/1.json
  def show
  end

  # GET /noticias/new
  def new
    @noticia = Noticia.new
  end

  # GET /noticias/1/edit
  def edit
  end

  # POST /noticias or /noticias.json
  def create
    @noticia = Noticia.new(noticia_params)

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
    end

    # Only allow a list of trusted parameters through.
    def noticia_params
      params.require(:noticia).permit(:titulo, :texto, :content, :arquivo)
    end
end
