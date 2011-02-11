class CrosswordsController < ApplicationController
  before_filter :find_crossword, :except => [:new, :create]
  
  def new
    @crossword = Crossword.new
  end

  def create
   @crossword = Crossword.new params[:crossword]
   if @crossword.save
     redirect_to(edit_crossword_path @crossword)
   else
     render :action => :new
   end
  end
  
  protected
  def find_crossword
    @crossword = Crossword.find_by_id params[:id]
  end
  
end