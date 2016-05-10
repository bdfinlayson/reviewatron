class ActsController < ApplicationController
  def new
    render html: cell(Acts::Form::Cell::Show, Act.new), layout: 'application'
  end

  def create
    run Acts::Create do
      return redirect_to new_act_path, :flash => { :notice => "Act created!" }
    end
    redirect_to new_act_path, :flash => { :alert => "Failed to save. Try again." }
  end

  def process_params!(params)
    params.require(:act).merge!(user: current_user)
  end
end
