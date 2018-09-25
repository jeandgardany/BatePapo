class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :texto
      t.boolean :lida, default: false
      t.references :user, foreign_key: true
      t.references :sala, foreign_key: true

      t.timestamps
    end
  end
end
