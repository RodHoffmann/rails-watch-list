class ListsController < ApplicationController
  def home
  end

  def index
    @lists = List.all
    @movies_url_array = random_movie_img(@lists)
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to list_path(@list)
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def random_movie_img(lists)
    movies_url_array = []
    unless lists.empty?
      lists.each do |list|
        if list.movies.empty?
          movies_url_array << 'https://nbcpalmsprings.com/wp-content/uploads/sites/8/2021/12/BEST-MOVIES-OF-2021.jpeg'
        else
          movies_url_array << list.movies[rand(list.movies.length - 1)].poster_url
        end
      end
    end
    movies_url_array
  end
end
