module Acts
  class Create < Trailblazer::Operation
    include Model
    model Act, :create

    contract do
      property :description
      property :user

      validates :description, presence: true
    end

    def process(params)
      validate(params) do |f|
        f.save
      end
    end

    def params!(params) #overwrites params ( as used by the TRB actions )
      params[:act]
    end
  end
end
