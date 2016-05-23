require 'reform/form/coercion'
module Acts
  class Form < Reform::Form
    feature Coercion
    property :description, nilify: true
    property :user, type: User
    property :benefits, type: Integer
    property :challenges
    property :qualities

    validates :description, presence: true
    validates :qualities, presence: true

    def description=(value)
      super blah(value)
    end

    def blah(value)
      nil if value.empty?
    end
  end
end
