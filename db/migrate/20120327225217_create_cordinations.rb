# -*- encoding : utf-8 -*-
class CreateCordinations < ActiveRecord::Migration
  def change
    create_table :cordinations do |t|

      t.timestamps
    end
  end
end
