describe Acts::Dashboard::Card::Cell::Show do
  context 'properties' do
    %w(
      description
      qualities
      challenges
      benefits
    ).each do |p|
      it { is_expected.to have_property p }
    end
  end
end
