module Reports::Cell
  describe Index do
    context 'Judgement' do
      before do
        quality = CoreValue.find_by(name: 'Judgement').qualities.first
        User.first.acts.push Act.create(description: 'blah', qualities: [quality] )
      end
      it 'gets all the judgement acts' do
        expect(described_class.(User.first).judgement.count).to eq 1
      end
    end
  end
end
