class ComentariosController < ApplicationController
    before_action :authenticate_user!
    before_action :set_noticia

    def create
        @noticia.comentarios.create(comentario_params.to_h.merge!({user_id: current_user.id}))
        redirect_to noticia_path(@noticia)
    end

    def destroy
        comentario = @noticia.comentarios.find(params[:id])
        authorize comentario
    
        comentario.destroy
        redirect_to noticia_path(@noticia), notice: 'Comentário apagado com sucesso'
    end

    private

    def comentario_params
        params.require(:comentario).permit(:body)
    end

    def set_noticia
        @noticia = Noticia.find(params[:noticia_id])
    end
    
end
