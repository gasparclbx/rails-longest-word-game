class GameController < ApplicationController
  def new
    @new = params[:word]
    @letters = [*('A'..'Z')].sample(10).join
  end

  def score
    @new = params[:word]
    @letters = [*('A'..'Z')].sample(10).join
    if @new.include?(@letters)
      response = HTTParty.get("https://wagon-dictionary.herokuapp.com/#{@new}")
      english = response.parsed_response['found']
      @answer = 'Congratulations' if english.true?
    end
  end
end
