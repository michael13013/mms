class LooksController < ApplicationController

  def index
    search_params = session['search_params']

    @looks_selected = []

    unless search_params.nil?
      @looks_selected = search_params['looks'].reject{|k,v| v == "0"}.keys if search_params['looks']
    end

    @looks = Look.all
  end

end
