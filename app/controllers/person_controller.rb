# frozen_string_literal: true

class PersonController < ApplicationController
  def index
    @result = Person.order(times: :desc).order(:name).limit(ENV['SUGGESTION_NUMBER'])
    render json: @result
  end

  def search
    q = params[:prefix].downcase
    @result = Person.where("name LIKE '%#{q}%'").order(times: :desc).order(:name).limit(ENV['SUGGESTION_NUMBER'])
    render json: @result
  end

  private

  def post_params
    params.require(:person).permit(:times)
  end
end
