class StudentsController < ApplicationController
  

  def index
  	#stuff will happen here
  	@students = Student.filter(params) 
    respond_to :html, :json
  end

  def js
  end

  private 

  # def filters
  # 	params.slice(:movie).collect { |key, value| Student.arel_table["favorite#{key}"].matches("%#{value}%") }
    
  # end
end
