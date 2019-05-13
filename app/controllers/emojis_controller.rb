class EmojisController < ApplicationController
  def show
    @emojis = Emoji.all
  end

  def create
    @emoji = Emoji.new(permit_params)
    @emoji.save!
    redirect_to action: 'show'
  end

  private
    def permit_params
      params.require(:emoji).permit(:name, :image)
    end

end
