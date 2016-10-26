require 'test_helper'

class ActionRepresenterTest < ActiveSupport::TestCase
  test "returns a JSON compatible hash representation of the instance" do
    user_class = Class.new(ActionRepresenter::Base) do

      property :id
      property :name
      property :message

      def message
        "hello"
      end

      def initialize(id:, name:, age:)
        @id = id
        @name = name
        @age = age
      end

      attr_reader(
        :id,
        :name,
        :age,
      )
    end

    user_as_json = user_class.new(
      id: 1,
      name: "user1",
      age: 50,
    ).as_json

    assert_equal(
      {
        "id" => 1,
        "name" => "user1",
        "message" => "hello",
      },
      user_as_json
    )
  end
end
