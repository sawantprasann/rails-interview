class Student < ActiveRecord::Base

	SUPPORTED_FILTERS = [:movie]
	scope :movie, ->(value) { where('lower(favoritemovie) = ?', value.downcase) }

	def name
		is_firstname_duplicate? ? "#{firstname} #{lastname.first}." : "#{firstname}"
	end

	def movie
		favoritemovie
	end
	

  	def is_firstname_duplicate?
  		table = Student.arel_table
    	Student.where(table[:firstname].matches(firstname)).count > 1
  	end

  	def self.filter(attributes)
   	attributes.slice(*SUPPORTED_FILTERS).reduce(all) do |scope, (key, value)|    	
    		value.present? ? scope.send(key, value) : scope     
		end
	end 
end
