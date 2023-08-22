class PrototypesController < ApplicationController
  def index
    @prototypes = prototype,includes(:user)
  end
  def new
    #プロトタイプオブジェクトを生成
    @prototype = prototype.new
  end
  
  def create
    @prtotype = current_user.prototypes.new(prototype_params)
    if @prototype.save
      redirect_to prototypes_path
    else
      render :new, status: :unprocessable_entity
    end
    end
    private
    def prototype_params
      params.require(:prototype).permit(:title, :catch_copy, :concept, :image)
    end

end
