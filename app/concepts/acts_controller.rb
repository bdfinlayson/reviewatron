 class ActsController < ApplicationController
  def new
    render html: cell(Acts::Form::Cell::Show, Act.new), layout: 'application'
  end

  def create
    @act = Act.new(act_params)
    if @act.save
      redirect_to new_act_path, :flash => { :notice => "Act created!" }
    else
      redirect_to new_act_path, :flash => { :alert => "Failed to save. Try again." }
    end
  end

  def act_params
    params.require(:act).permit(:description).merge(user: current_user)
  end
end
