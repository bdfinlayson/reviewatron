module Acts::Form::Cell
  describe Show do
    Given(:model) { described_class.(Act.first).model }
    Then { model == Act.first }
  end
end
