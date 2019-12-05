    class BookController < ApplicationController
    def index
        @verses = Verse.where(book_id: params[:id])
    end

    # GET /verses/1
    # GET /verses/1.json
    def show
        @verses = Verse.where(book_id: params[:id]) 
        @book = Book.where(id: params[:id])
        bolota = 1
        @book.each do |oe|
            bolota = oe.testament_id
        end
        @Testament = Testament.where(id: bolota)
    end







    private
    # Use callbacks to share common setup or constraints between actions.
    def set_verse
        @verse = Verse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def verse_params
        params.require(:verse).permit(:text, :chapter, :verse,  :book_id)
    end
    end
