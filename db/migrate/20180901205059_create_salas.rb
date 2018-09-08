class CreateSalas < ActiveRecord::Migration[5.2]
  def change
    create_table :salas do |t|
      t.string :nome
      t.text :descricao
      t.boolean :ativa, default: true
      t.references :adm, foreign_key: true

      t.timestamps
    end
  end
end
