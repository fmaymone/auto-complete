# frozen_string_literal: true

class PersonController < ApplicationController
  def index
    @result = search_by_prefix('')
    render json: @result
  end

  def search
    q = params[:prefix].downcase
    @result = search_by_prefix(q)
    render json: @result
  end

  def increase_popularity
    q = params[:prefix].downcase
    @result = search_by_prefix(q)
    if @result.empty?
      head :bad_request
    else
      @person_to_update = @result.first
      @person_to_update.increment(:times).save
      render json: @person_to_update.to_json, status: :created
    end
  end

  private

  def post_params
    params.require(:person).permit(:times)
  end

  def search_by_prefix(prefix)
    @result = Person.where("name LIKE '%#{prefix}%'").order(times: :desc).order(:name).limit(ENV['SUGGESTION_NUMBER'].to_i)
  end
end
