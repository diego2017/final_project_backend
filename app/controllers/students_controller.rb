class StudentsController < ApplicationController
  before_action :authenticate_student!

  def index
    render json: Student.all.to_json
  end

end
