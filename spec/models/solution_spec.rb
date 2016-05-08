describe Solution do
  context 'associations' do
    it { should belong_to(:challenge) }

    Given(:model) { Solution.first }

    When { model.update_attribute(:challenge, Challenge.first) }
    Then { model.challenge == Challenge.first }
  end
end
