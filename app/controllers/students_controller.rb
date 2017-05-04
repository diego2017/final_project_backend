class StudentsController < ApplicationController
  before_action :authenticate_student!, only: [:index]

  def index
    render json: Student.all.to_json

    # # we only send student at the moment. Skills, interests and courses are only another column in student at the moment
    # render json: Student.all.to_json(include:[:skills, :interests, :courses])
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



  def update
    @student = Student.find(params[:id])
    newCohort = params[:cohort]
    newBio = params[:bio]
    newSkills = params[:skills]
    newInterests = params[:interests]
    newLinkedin_url = params[:linkedin_url]
    newGithub_url = params[:github_url]
    newFacebook_url = params[:facebook_url]
    newWebsite_url = params[:website_url]

    # change student
    @student.cohort = newCohort
    @student.bio = newBio
    @student.skills = newSkills
    @student.interests = newInterests
    @student.linkedin_url = newLinkedin_url
    @student.github_url = newGithub_url
    @student.facebook_url = newFacebook_url
    @student.website_url = newWebsite_url

    # save student with new data
    if !@student.save
      render json: {message: "could not save record"}, status: :bad_request
    else
      render json: {message: "success"}
    end
  end

end
