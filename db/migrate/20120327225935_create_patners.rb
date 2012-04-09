# -*- encoding : utf-8 -*-
class CreatePatners < ActiveRecord::Migration
  def change
    create_table :patners do |t|

      t.timestamps
    end
  end
end
