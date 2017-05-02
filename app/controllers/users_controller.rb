class UsersController <ApplicationController

  def create
    # params will hold the linkedin student info
    linkedin_id = params[:id]

    # check your student table and see if a student exists yet for the linkedin students
    #  use the linkedin id as the unique identifier that you are checking for
    if Student.where(linkedin_id:linkedin_id).first.nil?
      # if they don't yet exist, then create the student Record
      @student= Student.new(first_name: params[:firstName], last_name:params[:lastName],  linkedin_id:linkedin_id)

      if !@student.save
        render json: {message: "could not save record"}, status: :bad_request
      end
    end
    render json: {message: "success"}
  end

end
