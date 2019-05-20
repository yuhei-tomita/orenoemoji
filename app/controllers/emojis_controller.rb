class EmojisController < ApplicationController
  def new
    @emoji = Emoji.new
  end

  def show
    @emoji = Emoji.find(params[:id])
  end

  def index
    @emojis = Emoji.all
  end

  def create
    @emoji = Emoji.new(permit_params)
    if @emoji.save
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def edit
    @emoji = Emoji.find(params[:id])
  end

  def update
    binding.pry
    @emoji = Emoji.find_by(id: params[:id])
    @emoji.update(name: permit_params[:name],categories_id: permit_params[:categories_id])
    redirect_to("/emojis")
  end

  def destroy
    @emoji = Emoji.find_by(id:params[:id])
    @emoji.destroy
    redirect_to('/')
  end

  def search
    @emojis = Emoji.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.json { render 'index', json: @emojis } #json形式のデータを受け取ったら、@usersをデータとして返すそしてindex をrenderで表示する
    end
  end

  private
    def permit_params
      params.require(:emoji).permit(:name, :image, :categories_id)
    end
end
