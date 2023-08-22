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
    def show
      '@prototype = Prototype.find(params[:id])
      '@comment = Comment.new
      '@comments = @prototype.comments.includes(:user)
    end
    def edit
      '@prototype = Prototype.find(params[:id])
    end
    def update
      '@prototype = Prototype.find(params[:id])
      '@prototype.update(prototype_params)
      if @prototype.save
        redirect_to root_path
      else
        render :edit, status: :unprocessable_entity
      end
    end
    def destroy
      '@prototype = Prototype.find(params[:id])
      '@prototype.destroy
      redirect_to root_path
    end
end
