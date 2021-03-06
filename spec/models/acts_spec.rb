describe Act do
  context 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:core_values).through(:qualities) }
    it { should have_many(:qualities).through(:act_qualities) }
    it { should have_many(:act_qualities) }
    it { should have_many(:challenges) }
    it { should have_many(:benefits) }

    Given(:model) { Act.first }

    When { model.qualities.push [Quality.first, Quality.second] }

    Then { model.qualities.include?(Quality.first) == true }
    And { model.qualities.include?(Quality.second) == true }
    And { model.core_values.include?(Quality.first.core_value) == true }
    And { model.core_values.include?(Quality.second.core_value) == true }
    And { model.user == User.first }

    When { model.update_attribute(:benefits, [Benefit.third, Benefit.fourth]) }
    Then { model.benefits.include?(Benefit.third) == true }
    And { model.benefits.include?(Benefit.fourth) == true }
  end
end
