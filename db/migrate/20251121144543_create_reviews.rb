class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.string :comment
      t.integer :stars
      t.references   :list, foreign_key: true, null: false

      t.timestamps
    end
  end
end
