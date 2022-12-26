# frozen_string_literal: true

class PersonController < ApplicationController
  def search
    q = params[:string_to_search].downcase
    @result = Person.where("name LIKE '%#{q}%'").order(:times).limit(ENV['SUGGESTION_NUMBER'])
    render json: @result
  end

  private

  def post_params
    params.require(:person).permit(:times)
  end
end
