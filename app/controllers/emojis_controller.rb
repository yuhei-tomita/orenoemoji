class EmojisController < ApplicationController
  def show
    @emojis = Emoji.all
  end

  def index
    @emojis = Emoji.all
  end

  def create
    @emoji = Emoji.new(permit_params)
    @emoji.save!
    redirect_to action: 'show'
  end

  def search
    @emojis = Emoji.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.json { render 'emoji', json: @emojis } #json形式のデータを受け取ったら、@usersをデータとして返すそしてindex をrenderで表示する
    end
  end

  private
    def permit_params
      params.require(:emoji).permit(:name, :image)
    end

end
