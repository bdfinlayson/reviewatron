module Acts::Form::Cell
  class Show < Trailblazer::Cell
    include ActionView::RecordIdentifier
    include ActionView::Helpers::FormHelper

  end
end
