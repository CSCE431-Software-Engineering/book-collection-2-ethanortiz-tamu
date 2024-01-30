class BooksController < ApplicationController

  def index
    @books = Book.order(:position)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @count = Book.count
    @book = Book.new(position: @count + 1)
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = 'Book was successfully created.'
      redirect_to books_path
    else
      # The 'new' action is NOT being called here
      # Assign any instance variables needed
      # @count = Book.count
      flash[:notice] = 'Title can\'t be blank'
      render('new')
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'Book was successfully updated.'
      redirect_to book_path(@book)
    else
      render('edit')
    end
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = 'Book was successfully destroyed.'
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :price, :published_date)
  end

end
