class ApplicationController < ActionController::API
  after_filter :cors_set_access_control_headers
  before_action :fetch_user

  def cors_set_access_control_headers
   headers['Access-Control-Allow-Origin'] = '*'
   headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
   headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
  end

  def fetch_user
    @current_student = Student.find_by_linkedin_id(params[:student_id])
  end

  def authenticate_student!
    if !@current_student
      return render json: {}, status: :unauthorized
    end
  end
end
