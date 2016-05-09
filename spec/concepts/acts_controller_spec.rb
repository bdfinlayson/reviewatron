describe ActsController, type: :controller do
  context '#new' do
    Given { sign_in User.first }
    When { get :new }
    Then { response.status == 200 }
  end

  context '#create' do
    # Given { sign_in User.first }
    # When { post :create, act: { description: "blah", user: User.first } }
    # Then { Act.last.description == 'blah' }
    # And { Act.last.user == User.first }
  end
end
