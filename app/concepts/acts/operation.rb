module Acts
  class Create < Trailblazer::Operation
    include Model
    model Act, :create

    contract do
      property :description
      property :user
      property :benefits
      property :problems
      # property :solutions
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
      params[:act][:qualities] = Quality.where(id: params[:qualities])
      params[:act][:problems] =
        Array(params[:problems]).each_with_index.map do |problem, i|
          Problem.create(
            description: problem,
            solutions: [Solution.create(description: params[:solutions][i])]
          )
        end
      params[:act][:solutions] =
        Array(params[:act][:problems]).map do |problem_obj|
          problem_obj.solutions.first
        end
      params[:act][:benefits] =
        Array(params[:benefits]).map {|benefit| Benefit.create(description: benefit)}
      params[:act]
    end
  end
end
