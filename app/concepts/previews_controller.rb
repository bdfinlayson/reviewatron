class PreviewsController < ApplicationController
  respond_to :html, :json, :js
  def create
    @params = ActiveSupport::HashWithIndifferentAccess.new(Params::Service.new(params).processed_params)
    @model = Act.new(@params)
    respond_to do |format|
      format.html {render html: cell(Previews::Cell::Index, @model), layout: 'application'}
      format.json {render html: cell(Previews::Cell::Index, @model), layout: 'application'}
    end
  end
end
