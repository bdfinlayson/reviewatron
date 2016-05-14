describe PreviewsController, type: :controller do
  context '#index' do
    before do
      sign_in User.first
      get :index,
        act: {
          description: "blah",
          qualities: [Quality.first.id, Quality.second.id, Quality.third.id],
          challenges: [["car trouble", "got car fixed"], ["challenging code", "studied longer hours"]],
          benefits: ["can get to work on time", "more confident programmer"]
         }
    end
    it { is_expected.to respond_with :success }
    it { is_expected.to respond_with_content_type :html }
  end
end
