describe Acts do
  context 'properties' do
    %w(
      description
    ).each do |prop|
      it { is_expected.to have_property prop }
    end
  end
end
