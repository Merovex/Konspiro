class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.references :attacker, index: true
      t.references :defender, index: true
      t.string :type
      t.datetime :resolved_at

      t.timestamps
    end
  end
end
