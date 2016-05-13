describe Problem do
  context 'associations' do
    it { should belong_to(:act) }
    it { should have_many(:solutions) }

    Given(:model) { Problem.first }

    When { Problem.first.update_attribute(:act, Act.first) }
    Then { Problem.first.act == Act.first }

    When { Problem.first.update_attribute(:solutions, [Solution.first]) }
    Then { Problem.first.solutions == [Solution.first] }
  end
end
