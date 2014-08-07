class SearchesController < ApplicationController
  def show
    @query = params[:query]
    @response = Response.new
    @results = Story.search(@query, field_weights: {
      tag: 8,
      title: 8,
      body: 3
    })
  end
end
