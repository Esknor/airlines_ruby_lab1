# -*- coding: utf-8 -*-
class Staff < ActiveRecord::Base
	has_and_belongs_to_many :flights
	OPTIONS = ['pilot', 'navigator', 'operator', 'stewardess' ]
end
