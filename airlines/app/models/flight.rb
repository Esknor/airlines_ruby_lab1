# -*- coding: utf-8 -*-
class Flight < ActiveRecord::Base
	has_and_belongs_to_many :staffs
	validates :num, presence: true,
			  length: { minimum: 6, maximum: 7 }
end
