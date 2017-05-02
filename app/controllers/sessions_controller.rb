class SessionsController <ApplicationController

  def create
# params will hold the linkedin student info
  linkedin_id = params[:id]

    # check your student table and see if a student exists yet for the linkedin students
    #  use the linkedin id as the unique identifier that you are checking for
    if Student.where(linkedin_id:linkedin_id).first
        # now set the session[:student_id] to the student records id
      student = Student.where(linkedin_id:linkedin_id).first
      session[:student_id] = student.id

      render json: {message: "successfully signed in"}
    else
      # if they don't yet exist, then create the student Record
      @student= Student.new(first_name: params[:firstName], last_name:params[:lastName],  linkedin_id:linkedin_id)

      if @student.save
        # now set the session[:student_id] to the student records id
        student = Student.where(linkedin_id:linkedin_id).first
        session[:student_id] = student.id
        render json: {message: "successfully signed in"}
      else
        render json: {message: "could not save record"}, status: :bad_request
      end
    end


  end

  def destroy
    session.delete(:student_id)    
    render json: {message: "successfully signed out"}
  end

end
