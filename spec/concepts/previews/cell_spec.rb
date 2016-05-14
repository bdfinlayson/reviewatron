describe Previews::Cell::Index do
  context 'properties' do
    %w(
      description
      challenges
      solutions
      benefits
      qualities
    ).each do |p|
      it { is_expected.to have_property p }
    end
  end
end
