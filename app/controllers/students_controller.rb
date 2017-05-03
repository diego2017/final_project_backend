class StudentsController < ApplicationController
  before_action :authenticate_student!, only: [:index]

  def index
    render json: Student.all.to_json(include:[:skills, :interests, :courses])
  end

  def create
    linkedin_data = JSON.parse(params["values"][0])

    # params will hold the linkedin student info
    linkedin_id = linkedin_data["id"]

    # check your student table and see if a student exists yet for the linkedin students
    #  use the linkedin id as the unique identifier that you are checking for
    if Student.where(linkedin_id:linkedin_id).first.nil?
      # if they don't yet exist, then create the student Record
      @student= Student.new(first_name: linkedin_data["firstName"], last_name: linkedin_data["lastName"], linkedin_id:linkedin_id, linkedin_url: linkedin_data["publicProfileUrl"], img_url: linkedin_data["pictureUrls"].values[1].first, email: linkedin_data["emailAddres"], bio: linkedin_data["summary"] )


      if !@student.save
        render json: {message: "could not save record"}, status: :bad_request
      end
    end
    render json: {message: "success"}
  end
end
