module Acts::Form::Cell
  class Show < Acts::Card::Cell::Show
    include ActionView::RecordIdentifier
    include ActionView::Helpers::FormHelper

    def unselected_qualities
      return Quality.all if qualities.empty?
      Quality.where.not(id: qualities.try(:map) {|x| x.try(:id)})
    end
  end
end
