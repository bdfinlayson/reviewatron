class ReportsController < ApplicationController

  def index
    render html: cell(Reports::Cell::Index, current_user), layout: 'application'
  end

end
