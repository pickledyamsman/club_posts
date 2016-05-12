class MembersController < ApplicationController
  def search
    
  end

  def show
    @results = []
    Member.all.each do |member|
      if member.position.downcase == params[:position].downcase
        @results << member
      end
    end
  end
end
