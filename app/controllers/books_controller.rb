class BooksController < ApplicationController
  protect_from_forgery except: [:destroy]
  before_action :set_book, only: [:show, :destroy]
  around_action :action_longger, only: [:destroy]

  # before_action do
  #   redirect_to access_denied_path if params[:token].blank?
  # end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @book }
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to "/" }
      format.json { head :no_content }
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def action_longger
    logger.info "around-before"
    yield
    logger.info "around-after"
  end
end
