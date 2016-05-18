module Params
  class Service

    attr_reader :processed_params

    def initialize(params)
      @processed_params = process(params)
    end

    def process(params)
      params[:act][:id] = params[:id] if params[:id].present?
      params[:act][:description] = remove_ending_punctuation(params[:act][:description])
      params[:act][:qualities] = Quality.where(id: params[:act][:qualities])
      params[:act][:challenges] = params[:act][:challenges].values if params[:act][:challenges].respond_to? :values
      params[:act][:challenges] =
        Array(params[:act][:challenges]).each.map do |challenge|
          Challenge.create(
            problem: remove_ending_punctuation(challenge.first)
          )
        end
      params[:act][:benefits] =
        Array(params[:act][:benefits]).map {|benefit| Benefit.create(description: remove_ending_punctuation(benefit))}
      params[:act]
    end

    def remove_ending_punctuation(str)
      str.gsub(/(\.|\,|\;|\:)$/, "").squish
    end
  end
end
