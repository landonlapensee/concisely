class My::LessonsController < ApplicationController
  def index
    @lessons = [
      OpenStruct.new(name: "Coach's Name", description: "This is a description", industry: "web development")
    ]
  end

end
