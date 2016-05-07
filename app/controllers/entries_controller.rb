class EntriesController < ApplicationController
  def new
    render 'entries/new'
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to new_entry_path, :flash => { :notice => "Entry created!" }
    else
      redirect_to new_entry_path, :flash => { :alert => "Failed to save. Try again." }
    end
  end

  def entry_params
    params.require(:entry).permit(:content).merge(user: current_user)
  end


end
