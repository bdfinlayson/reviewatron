module Reports::Cell
  class Show < Trailblazer::Cell
    def judgement
      CoreValue.find_by(name: 'Judgement').acts.where(user: model)
    end

  end
end
