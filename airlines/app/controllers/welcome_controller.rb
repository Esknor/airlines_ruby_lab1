class WelcomeController < ApplicationController
  def index
  	if(params.has_key?(:id) && 
  		params.has_key?(:random))
		@id = params['id']
		@random = params['random']
	end
  end

  def sample
  	@controller_message = "Hello forom controoler"
  	@array = [1, 2, 3, 4, 7]
  end
end
