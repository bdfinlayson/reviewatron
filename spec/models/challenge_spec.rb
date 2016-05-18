describe Challenge do
  context 'associations' do
    it { should belong_to(:act) }

    Given(:model) { Challenge.first }

    When { Challenge.first.update_attribute(:act, Act.first) }
    Then { Challenge.first.act == Act.first }
  end
end
