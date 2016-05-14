module Acts::Form::Cell
  class Show < Acts::Dashboard::Card::Cell::Show
    include ActionView::RecordIdentifier
    include ActionView::Helpers::FormHelper

    def unselected_qualities
      return Quality.all if qualities.empty?
      Quality.where.not(id: qualities.try(:map) {|x| x.try(:id)})
    end

    def quality_assertion(q)
      "#{q.assertion} #{value_name(q)}"
    end

    def value_name(q)
      "(#{q.core_value.name.upcase})"
    end
  end
end
