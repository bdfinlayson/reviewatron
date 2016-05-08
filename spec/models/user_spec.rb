describe User do
  context 'associtions' do
    it { should have_many(:acts) }
    it { should have_many(:qualities).through(:acts) }
    it { should have_many(:challenges).through(:acts) }

    Given(:user) { User.first }

    When { Act.first.update_attribute(:qualities, [Quality.first]) }
    Then { user.acts.include?(Act.first) == true }
    Then { user.qualities.include?(Act.first.qualities.first) == true }

    When { user.acts.first.update_attribute(:challenges, [Challenge.first])}
    Then { user.challenges.include?(Challenge.first) == true }
  end
end
