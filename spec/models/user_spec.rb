describe User do
  context 'associtions' do
    it { should have_many(:entries) }
    it { should have_many(:qualities).through(:entries) }

    Given(:user) { User.first }

    When { Entry.first.update_attribute(:qualities, [Quality.first]) }
    Then { user.entries.include?(Entry.first) == true }
    Then { user.qualities.include?(Entry.first.qualities.first) == true }
  end
end
