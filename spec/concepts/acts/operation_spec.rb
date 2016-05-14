module Acts
  describe Create do
    Given { Acts::Create.(act: { description: 'blah', qualities: [Quality.first.id, Quality.last.id], user: User.first })}
    Then { Act.last.description == 'blah' }
    And { Act.last.user == User.first }
    And { Act.last.qualities == [Quality.first, Quality.last] }
  end
end
