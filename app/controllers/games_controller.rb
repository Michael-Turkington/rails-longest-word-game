require "open-uri"

class GamesController < ApplicationController

  def new
    @letters =("A".."Z").to_a.sample(10)
  end

  def score

    @attempt = params[:word]
    word = JSON.parse(open("https://wagon-dictionary.herokuapp.com/#{@attempt}").read)

    @message = word["found"] ? "Your word is an English word" : "Your word is not an English word"
  end
end
