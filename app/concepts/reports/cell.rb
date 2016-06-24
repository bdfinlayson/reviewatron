module Reports::Cell
  class Index < Trailblazer::Cell
    def judgement
      CoreValue.find_by(name: 'Judgement').acts.where(user: model)
    end

  end
end
