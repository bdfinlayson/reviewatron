describe Acts::Card::Cell::Show do
  context 'properties' do
    %w(
      description
      user
      core_values
      qualities
      challenges
      solutions
      benefits
    ).each do |p|
      it { is_expected.to have_property p }
    end
  end
end
