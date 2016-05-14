describe Previews::Cell::Index do
  context 'properties' do
    %w(
      description
      challenges
      benefits
      qualities
    ).each do |p|
      it { is_expected.to have_property p }
    end
  end
end
