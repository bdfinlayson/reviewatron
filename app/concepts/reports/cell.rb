module Reports::Cell
  class Index < Trailblazer::Cell
    def core_values_order
      %w(Judgement Communication Impact Curiosity Innovation Courage Passion Honesty Selflessness)
    end
    def core_values_qualities_questions(cv_name)
      questions = []
      CoreValue.find_by(name: cv_name).qualities.each do |q|
        questions.push q.question
      end
      questions
    end
    def core_value_acts(cv_name)
      Act.includes(:core_values).where(user: model).where(core_values: {name: cv_name})
    end
  end
end
