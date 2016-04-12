class WelcomeController < ApplicationController
  def index
    @clubs = Club.all
  end
end