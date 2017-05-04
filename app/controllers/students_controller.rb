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



  def update
    @student = Student.find(params[:id])
    newBio = params[:bio]

    # change the bio
    @student.bio = newBio


    # save student with new data
    if !@student.save
      render json: {message: "could not save record"}, status: :bad_request
    else
      render json: {message: "success"}
    end

    # binding.pry
  #
  #   # This is the magic stuff that will let us upload an image to Cloudinary when creating a new animal.
  #   # First, check to see if the user has attached an image for uploading
  #   if params[:file].present?
  #     # Then call Cloudinary's upload method, passing in the file in params
  #     req = Cloudinary::Uploader.upload(params[:file])
  #     # Using the public_id allows us to use Cloudinary's image transformation methods.
  #     @place.image = req["public_id"]
  #     @place.save
  #   end
  #
  #   # update features
  #   # first delete all associations
  #   @place.features.delete_all
  #   # then recreate each feature association that was checked in the form
  #   params[:features].each do |feature_id|
  #     @place.features << Feature.find( feature_id )
  #   end
  #
  #   # @place.user = @current_user
  #
  #   if @place.update_attributes(clean_params)
  #     redirect_to controller: "places", action: "show", place_id: @place.id
  #   else
  #     render :edit
  #   end
  end

end
