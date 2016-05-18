module Acts::Dashboard::Card::Cell
  class Show < Trailblazer::Cell
    property :description
    property :core_values
    property :qualities
    property :challenges
    property :benefits
  end
end
