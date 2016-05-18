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
      params[:act][:challenges] =
        Array(params[:act][:challenges]).map {|description| Challenge.find_or_create_by(problem: remove_ending_punctuation(description))}
      params[:act][:benefits] =
        Array(params[:act][:benefits]).map {|benefit| Benefit.find_or_create_by(description: remove_ending_punctuation(benefit))}
      params[:act]
    end

    def remove_ending_punctuation(str)
      str.gsub(/(\.|\,|\;|\:|\!)$/, "").squish
    end
  end
end
