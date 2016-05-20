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
          challenges: ["car trouble", "got car fixed", "challenging code", "studied longer hours"],
          benefits: ["can get to work on time", "more confident programmer"]
           }}.to change(Act, :count).by(1)
      expect(Act.last.description).to eq 'blah'
      expect(Act.last.user).to eq User.first
      expect(Act.last.qualities).to match_array [Quality.first, Quality.second, Quality.third]
      expect(Act.last.challenges).to match_array Challenge.last(4)
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

  context '#destroy' do
    before do
      sign_in User.first
    end
    context 'success' do
      it 'deletes' do
        expect{delete :destroy, id: User.first.acts.first.id}.to change(Act, :count).by(-1)
      end
      it 'flashes notice' do
        delete :destroy, id: User.first.acts.first.id
        expect(flash[:notice]).to be_present
      end
    end
    context 'failure' do
      it 'does not delete' do
        expect{delete :destroy, id: 9999999}.to change(Act, :count).by(0)
      end
      it 'flashes alert' do
        delete :destroy, id: 99999999
        expect(flash[:alert]).to be_present
      end
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

  context '#update' do
    context 'success' do
      before do
        sign_in User.first
      end
      it 'updates description' do
        put :update, id: Act.first.id, act: {description: "Pobrecita como tu", qualities: Act.first.qualities.map(&:id)}
        expect(Act.first.description).to eq "Pobrecita como tu"
      end

      it 'updates qualities' do
        put :update, id: Act.first.id, act: {description: "Pobrecita como tu", qualities: [Quality.last.id]}
        expect(Act.first.qualities).to match_array [Quality.last]
      end

      it 'updates challenges' do
        expect(Act.first.challenges).to be_present
        Act.first.challenges.first.update_attribute(:problem, "blah")
        expect{put :update,
          id: Act.first.id,
          act: {
            description: "Pobrecita como tu",
            qualities: [Quality.last.id],
            challenges: ["Can't sleep at night", "Coding all the time", "All fun and no play", Act.first.challenges.map(&:problem)].flatten
            }
          }.to change(Challenge, :count).by(3)
        expect(Act.first.challenges.map(&:problem)).to match_array ["blah", "Can't sleep at night", "Coding all the time", "All fun and no play"]
      end

      it 'updates benefits' do
        expect(Act.first.benefits).to be_present
        Act.first.benefits.destroy_all
        expect{put :update,
          id: Act.first.id,
          act: {
            description: "Pobrecita como tu",
            qualities: [Quality.last.id],
            benefits: ["Can't sleep at night", "Coding all the time", "All fun and no play"]
            }
          }.to change(Benefit, :count).by(3)
        expect(Act.first.benefits.map(&:description)).to match_array ["Can't sleep at night", "Coding all the time", "All fun and no play"]
      end
    end

    context 'failure' do
      before do
        sign_in User.first
      end
      it 'with no params' do
        put :update, id: Act.first.id, act: { description: '', qualities: []}
        expect(response).to redirect_to(edit_act_path(Act.first.id))
      end
    end
  end
end
