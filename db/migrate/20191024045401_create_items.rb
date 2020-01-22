class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string      :name, null: false
      t.integer     :status, null: false
      t.text        :body
      t.references  :category, foreign_key: true
      t.string      :size
      t.string      :brandname
      t.integer     :condition, null: false
      t.integer      :burden, null: false
      t.string      :region, null: false
      t.string      :sending_days, null: false
      t.integer     :price, null: false
      t.references  :saler, foreign_key: { to_table: :users }
      t.references  :buyer, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
