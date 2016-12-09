# -*- coding: utf-8 -*-
class ManagingController < ApplicationController
	def index
		@flights = Flight.all
	end

	def new
    	@flight = Flight.new
  	end

  	def edit
  	end

	# GET /managing/1
	def flight_managing
	end
end
