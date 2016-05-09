module Acts
  describe Create do
    # Given { Acts::Create.(act: { description: 'blah', user: User.first })}
    # Then { Act.last.description == 'blah' }
    # And { Act.last.user == User.first }
  end
end
