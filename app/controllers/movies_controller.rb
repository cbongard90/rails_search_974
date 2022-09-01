class MoviesController < ApplicationController
  def index
    if params[:query].present?
      # @movies = Movie.where("title ILIKE ?", "%#{params[:query]}%")

      sql_query = "title ILIKE :query OR synopsis ILIKE :query"
      @movies = Movie.where(sql_query, query: "%#{params[:query]}%")
    else
      @movies = Movie.all
    end
  end
end
