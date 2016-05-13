describe Solution do
  context 'associations' do
    it { should belong_to(:problem) }

    Given(:model) { Solution.first }

    When { model.update_attribute(:problem, Problem.first) }
    Then { model.problem == Problem.first }
  end
end
