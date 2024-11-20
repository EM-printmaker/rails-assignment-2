class SearchesController < ApplicationController
  def search
    search_word = params[:word]
    search_area_word = params[:area]
    @range = params[:range]

    if @range == "area"
      @rooms = Room.where('address LIKE ?', "%#{search_area_word}%")
    else
      if search_area_word == "" && search_word.present?
        @rooms = Room.where('name LIKE ? or description LIKE ?', "%#{search_word}%", "%#{search_word}%")
      elsif  search_area_word.present? && search_word == ""
        @rooms = Room.where('address LIKE ?', "%#{search_area_word}%")
      else
        @rooms = Room.where('address LIKE ? or name LIKE ? or description LIKE ?', "%#{search_area_word}%", "%#{search_word}%", "%#{search_word}%")
      end
    end
  end
end
