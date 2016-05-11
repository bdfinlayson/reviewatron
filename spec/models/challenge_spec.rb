describe Challenge do
  context 'associations' do
    it { should belong_to(:act) }
    it { should have_many(:solutions) }

    Given(:model) { Challenge.first }

    When { Challenge.first.update_attribute(:act, Act.first) }
    Then { Challenge.first.act == Act.first }

    When { Challenge.first.update_attribute(:solutions, [Solution.first]) }
    Then { Challenge.first.solutions == [Solution.first] }
  end
end
