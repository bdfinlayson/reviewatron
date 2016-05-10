module Acts::Card::Cell
  class Show < Trailblazer::Cell
    property :description
    property :user
    property :core_values
    property :qualities
    property :challenges
    property :solutions
    property :benefits
  end
end
