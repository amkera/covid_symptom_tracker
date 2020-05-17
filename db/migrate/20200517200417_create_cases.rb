class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|

      t.integer :cough
      t.integer :difficulty_breathing
      t.integer :fever
      t.integer :chills
      t.integer :muscle_pain
      t.integer :sore_throat
      t.integer :smell_or_taste_loss

      t.integer :user_id
      t.timestamps null: false
    end
  end
end
