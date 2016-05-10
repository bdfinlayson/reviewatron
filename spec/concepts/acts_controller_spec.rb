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
      expect{post :create, act: { description: "blah" }}.to change(Act, :count).by(1)
      expect(Act.last.description).to eq 'blah'
      expect(Act.last.user).to eq User.first
    end

    it 'fail' do
      expect{ post :create, act: { description: '' }}.to change(Act, :count).by(0)
    end
  end
end
