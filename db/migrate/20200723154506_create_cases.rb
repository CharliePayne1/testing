class CreateCases < ActiveRecord::Migration[6.0]
  def change
    create_table :cases do |t|
      t.string :symptoms
      t.string :image_url
      t.string :email
      t.string :decision, :default => "awaiting decision"
      t.references :doctor, null: true, foreign_key: true

      t.timestamps
    end
  end
end
