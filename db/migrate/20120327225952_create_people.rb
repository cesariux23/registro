# -*- encoding : utf-8 -*-
class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|

      t.timestamps
    end
  end
end
