RSpec::Matchers.define :have_property do |action|
  match do |subject|
    # RSpec automatically creates a new class with empty values
    # for cells rendering the subject of a Cells test useles
    # therefor call class on the subject to create a new instance
    # with a fake model implementing the property
    model = Struct.new(action.try(:to_sym) || {}).new("Okay!")
    cell_instance = described_class.(model)
    expect(cell_instance.try("#{action}".to_sym)).to eq "Okay!"
  end

  failure_message do |subject|
    "#{subject.class} does not have property #{action} defined"
  end

  failure_message_when_negated do |subject|
    "#{subject.class} should not have property #{action} defined"
  end
end
