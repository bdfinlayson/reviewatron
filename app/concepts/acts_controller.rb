class ActsController < ApplicationController
  def new
    render html: cell(Acts::Form::Cell::Show, Act.new), layout: 'application'
  end

  def index
    render html: cell(Acts::Dashboard::Cell::Index, current_user), layout: 'application'
  end

  def create
    run Acts::Create do
      return redirect_to new_act_path, :flash => { :notice => "Accomplishment created!" }
    end
    redirect_to new_act_path, :flash => { :alert => @form.errors.full_messages.join(', ') }
  end

  def edit
    render html: cell(Acts::Form::Cell::Show, Act.find(params[:id])), layout: 'application'
  end

  def update
    run Acts::Update do
      return redirect_to acts_path, :flash => { :notice => "Accomplishment updated!" }
    end
    redirect_to edit_act_path(@model), :flash => { :alert => @form.errors.full_messages.join(', ') }
  end

  def process_params!(params)
    params.require(:act).merge!(user: current_user)
  end
end
