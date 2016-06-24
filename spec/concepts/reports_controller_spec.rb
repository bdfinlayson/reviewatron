describe ReportsController, type: :controller do
  context '#index' do
    before do
      sign_in User.first
      get :index
    end
    it 'success' do
      expect(response).to have_http_status :success
    end
  end
end
