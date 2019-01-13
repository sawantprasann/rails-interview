class StudentsController < ApplicationController
   skip_before_filter :verify_authenticity_token, only: :foo

  def index
  	#stuff will happen here
  	@students = Student.filter(params)
    respond_to :html, :json
  end

  def js
  end

  def foo
  	raise "error" if params['valid'].blank? || params['valid'] != 'true'  	
  	render  text: 'BAR', status: 202
    
  end
 
end
