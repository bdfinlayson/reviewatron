describe ActsController, type: :controller do
  context '#new' do
    it do
      sign_in User.first
      get :new
      expect(response).to have_http_status :success
    end
  end

  context '#create' do
    before do
      sign_in User.first
    end
    it 'success' do
      expect{post :create,
        act: {
          description: "blah",
          qualities: [Quality.first.id, Quality.second.id, Quality.third.id],
          challenges: [["car trouble", "got car fixed"], ["challenging code", "studied longer hours"]],
          benefits: ["can get to work on time", "more confident programmer"]
           }}.to change(Act, :count).by(1)
      expect(Act.last.description).to eq 'blah'
      expect(Act.last.user).to eq User.first
      expect(Act.last.qualities).to match_array [Quality.first, Quality.second, Quality.third]
      expect(Act.last.challenges).to match_array Challenge.last(2)
      expect(Act.last.benefits).to match_array Benefit.last(2)
      expect(flash[:notice]).to be_present
    end

    it 'fail' do
      expect{ post :create, act: { description: '' }}.to change(Act, :count).by(0)
      expect(flash[:alert]).to be_present
    end
  end

  context '#index' do
    context 'success' do
      before do
        sign_in User.first
        get :index
      end
      it { is_expected.to respond_with :success }
      it { is_expected.to respond_with_content_type :html }
      it { is_expected.to render_with_layout :application }
    end
  end

  context '#edit' do
    context 'success' do
      before do
        sign_in User.first
        get :edit, id: Act.first.id
      end
      it { is_expected.to respond_with :success }
      it { is_expected.to respond_with_content_type :html }
      it { is_expected.to render_with_layout :application }
    end
  end
end
