# -*- encoding : utf-8 -*-
class Cordination < ActiveRecord::Base
	has_many :users
	has_many :municipalities
	has_many :patners
end
