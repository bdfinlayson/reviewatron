module Params
  class Service

    attr_reader :processed_params

    def initialize(params)
      @processed_params = process(params)
    end

    def process(params)
      params[:act][:qualities] = Quality.where(id: params[:act][:qualities])
      params[:act][:challenges] =
        Array(params[:act][:challenges]).each do |challenge|
          Challenge.create(
            problem: challenge.first,
            solution: challenge.second
          )
        end
      params[:act][:benefits] =
        Array(params[:act][:benefits]).map {|benefit| Benefit.create(description: benefit)}
      params[:act]
    end
  end
end
