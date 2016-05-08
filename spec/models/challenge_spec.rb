describe Challenge do
  context 'associations' do
    it { should belong_to(:act) }
    it { should have_one(:solution) }

    Given(:model) { Challenge.first }

    When { Challenge.first.update_attribute(:act, Act.first) }
    Then { Challenge.first.act == Act.first }

    When { Challenge.first.update_attribute(:solution, Solution.first) }
    Then { Challenge.first.solution == Solution.first }
  end
end
