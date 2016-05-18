class MembersController < ApplicationController
  def search
  end

  def show
    @members = Member.search(params[:position])
    @position = params[:position]
  end
end
