class BooksController < ApplicationController
  def index
    books = Book.all

    render json: {
      count: books.length,
      books: books.sort_by {|book| [book.rating, book.publication_date]}
    }
  end

  def create
    book = Book.create!(valid_params)

    render json: { book: book }
  end

  def update
    parameters = params.permit(:rating, :status)

    book = Book.find(params[:id])
    book.update!(status: params[:status]) if(params[:status].present?)
    book.update!(rating: params[:rating]) if(params[:rating].present?)

    render json: {
      book: book
    }
  end

  private

  def valid_params
    params[:book].permit(:title, :author, :publication_date, :rating, :status)
  end
end
