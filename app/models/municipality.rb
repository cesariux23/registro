# -*- encoding : utf-8 -*-
class Municipality < ActiveRecord::Base
	has_many :locations
end
