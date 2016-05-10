module Acts::Form::Cell
  class Show < Acts::Card::Cell::Show
    include ActionView::RecordIdentifier
    include ActionView::Helpers::FormHelper

    def unselected_core_values
      return CoreValue.all if core_values.empty?
      CoreValue.where.not(core_values.try(:map) {|x| x.try(:id)})
    end
  end
end
