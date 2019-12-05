class HomeController < ApplicationController
  def index
    @testaments = Testament.all
    @ministries = Ministry.all
    @all_books = Book.all
    @churches = Church.all
    @text = Verse.all
  end
end
