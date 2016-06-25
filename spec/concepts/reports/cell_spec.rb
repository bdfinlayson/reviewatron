module Reports::Cell
  describe Index do
    context '#core_values_order' do
      it 'has the correct order of core values' do
        expect(described_class.(User.first).core_values_order).to match_array %w(Judgement Communication Impact Curiosity Innovation Courage Passion Honesty Selflessness)
      end
    end
    context '#core_values_qualities_questions' do
      it 'returns an array of questions' do
        expect(described_class.(User.first).core_values_qualities_questions('Communication')).to match_array ["Do you listen well?", "Do you impulsively react?", "Are you concise and articulate in speech and writing?", "Do you treat people with respect?", "Do you maintain calm and poise in stressful situations?"]
      end
    end
    context '#core_value_acts' do
      before do
        User.first.acts.destroy_all
        User.first.acts.push Act.create(description: 'blah', qualities: [CoreValue.find_by(name: 'Communication').qualities.first])
        User.first.acts.push Act.create(description: 'wowza', qualities: [CoreValue.find_by(name: 'Communication').qualities.first])
      end
      it 'returns an array of acts' do
        expect(described_class.(User.first).core_value_acts('Communication').count).to eq 2
      end
    end
  end
end
