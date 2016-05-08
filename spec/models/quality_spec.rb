describe Quality do
  context 'associations' do
    it { should belong_to(:core_value) }
    it { should have_many(:entries).through(:entry_qualities) }
    it { should have_many(:entry_qualities) }

    Given(:model) { Quality.first }

    When { model.update_attribute(:core_value, CoreValue.first) }
    Then { model.core_value == CoreValue.first }

    When { model.entries.push [Entry.first, Entry.second] }
    Then { model.entries.include?(Entry.first) == true }
    Then { model.entries.include?(Entry.second) == true }
  end
end
