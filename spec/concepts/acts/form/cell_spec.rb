module Acts::Form::Cell
  describe Show do
    let(:cell) { described_class }
    context '#model' do
      Given(:model) { cell.(Act.first).model }
      Then { model == Act.first }
    end

    context '#unselected_qualities' do
      let(:model) { cell.(Act.first) }

      before do
        model.qualities.destroy_all
      end

      it 'is empty' do
        expect(model.unselected_qualities).to match_array Quality.all.map {|c| c }
      end

      it 'has unselected qualities' do
        model.qualities.push [Quality.first, Quality.last]
        expect(model.unselected_qualities.exclude?([Quality.first, Quality.last])).to be true
        expect(model.unselected_qualities.count).to eq Quality.count - 2
      end
    end
  end
end
