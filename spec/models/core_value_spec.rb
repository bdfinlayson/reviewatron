describe CoreValue do
  context 'associations' do
    it { should have_many(:qualities) }
    it { should have_many(:entries).through(:qualities) }
  end

  context 'validations' do
    context 'with nothing' do
      Given(:model) { CoreValue.create() }
      Then { model.persisted? == false }
    end
    context 'with values' do
      Given(:model) { CoreValue.create(name: "Honesty") }
      Then { model.persisted? == true }
    end
  end
end
