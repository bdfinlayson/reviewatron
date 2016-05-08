describe Benefit do
  context 'associations' do
    it { should belong_to(:act) }

    Given(:model) { Benefit.first }

    When { model.update_attribute(:act, Act.last) }
    Then { model.act == Act.last }
  end
end
