class TextsController < ApplicationController
  before_action :set_text,only:[:edit,:update,:destroy]
  
  def index
    @texts = Text.all
  end
  
  def new
    if params[:back]
     @text = Text.new(texts_params)
    else
     @text = Text.new
    end
  end
  
  def create
    @text = Text.new(texts_params)
    if @text.save
     redirect_to texts_path,notice:"Successful tweet！"
    else
     render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if  @text.update(texts_params)
      redirect_to texts_path,notice:"Successfully edited tweet！"
    else
      render'edit'
    end
  end
  
  def destroy
   @text.destroy
   redirect_to texts_path,notice:"Deleted tweet！"
  end
  
  def confirm
    @text = Text.new(texts_params)
    render 'new' if @text.invalid?
  end
  
  private
  def texts_params
    params.require(:text).permit(:content)
  end
  
  def set_text
   @text = Text.find(params[:id])
  end
end
