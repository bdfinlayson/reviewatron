describe Quality do
  context 'associations' do
    it { should belong_to(:core_value) }
    it { should have_many(:acts).through(:act_qualities) }
    it { should have_many(:act_qualities) }

    Given(:model) { Quality.first }

    When { model.update_attribute(:core_value, CoreValue.first) }
    Then { model.core_value == CoreValue.first }

    When { model.acts.push [Act.first, Act.second] }
    Then { model.acts.include?(Act.first) == true }
    Then { model.acts.include?(Act.second) == true }
  end
end
