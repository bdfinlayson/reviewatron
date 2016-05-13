describe User do
  context 'associtions' do
    it { should have_many(:acts) }
    it { should have_many(:qualities).through(:acts) }
    it { should have_many(:problems).through(:acts) }

    Given(:user) { User.first }

    When { Act.first.update_attribute(:qualities, [Quality.first]) }
    Then { user.acts.include?(Act.first) == true }
    Then { user.qualities.include?(Act.first.qualities.first) == true }

    When { user.acts.first.update_attribute(:problems, [Problem.first])}
    Then { user.problems.include?(Problem.first) == true }
  end
end
