describe Entry do
  context 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:core_values).through(:qualities) }
    it { should have_many(:qualities).through(:entry_qualities) }
    it { should have_many(:entry_qualities) }

    Given(:model) { Entry.first }

    When { model.qualities.push [Quality.first, Quality.second] }

    Then { model.qualities.include?(Quality.first) == true }
    And { model.qualities.include?(Quality.second) == true }
    And { model.core_values.include?(Quality.first.core_value) == true }
    And { model.core_values.include?(Quality.second.core_value) == true }
    And { model.user == User.first }
  end
end
