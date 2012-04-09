# -*- encoding : utf-8 -*-
class CreateMunicipalities < ActiveRecord::Migration
  def change
    create_table :municipalities do |t|

      t.timestamps
    end
  end
end
