class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :number_correct, :default => 0
      t.integer :number_incorrect, :default => 0

      t.timestamps null: false
    end
  end
end
