class PreviewsController < ApplicationController
  def index
    @params = ActiveSupport::HashWithIndifferentAccess.new(Params::Service.new(params).processed_params)
    @model = Act.new(@params)
    render html: cell(Previews::Cell::Index, @model), layout: 'application'
  end
end
