class EmojisController < ApplicationController
  def new
    @emoji = Emoji.new
  end

  def create
    @emoji = Emoji.new(permit_params)
    category_list = params[:category_list].split(",")
    if @emoji.save
      @emoji.save_categories(category_list)
      redirect_to action: 'index'
    else
      render 'emojis/new'
    end
  end

  def show
    @emoji = Emoji.find(params[:id])
    if params[:category_id]
      @selected_category = Category.find(params[:category_id])
      @emojis= Emoji.from_category(params[:category_id]).page(params[:page])
    # else
    #   @emojis= Emoji.all.page(params[:page])
    end
  end

  def index
    @emojis = Emoji.all.shuffle
  end



  def edit
    @emoji = Emoji.find(params[:id])
    @category_list = @emoji.categories.pluck(:name).join(",")
  end

  def update
    @emoji = Emoji.find_by(id: params[:id])
    category_list = params[:category_list].split(",") #ここのオブジェクト、再確認
    if @emoji.update(name: permit_params[:name])
      @emoji.save_categories(category_list)
      render 'emojis/show'
    else
      render 'emojis/edit'
    end
  end


  def destroy
    @emoji = Emoji.find_by(id:params[:id])
    @emoji.destroy
    redirect_to('/')
  end

  def search
    @emojis = Emoji.where('name LIKE(?)', "%#{params[:keyword]}%")
    unless params[:keyword].blank?
      respond_to do |format|
        format.json { render 'index', json: @emojis } #json形式のデータを受け取ったら、@emojisをデータとして返すそしてindex をrenderで表示する
      end
    end
  end

  private
    def permit_params
      params.require(:emoji).permit(:name, :image, :categories_id)
    end
end
