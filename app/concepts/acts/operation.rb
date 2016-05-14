module Acts
  class Create < Trailblazer::Operation
    include Model
    model Act, :create

    contract do
      property :description
      property :user
      property :benefits
      property :challenges
      property :qualities

      validates :description, presence: true
      validates :qualities, presence: true
    end

    def process(params)
      validate(params) do |f|
        f.save
      end
    end

    def params!(params)
      Params::Service.new(params).processed_params
    end
  end
end
