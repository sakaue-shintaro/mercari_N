class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.integer     :good
      t.integer     :normal
      t.integer     :bad
      t.references  :user, foreign_key: true
      t.timestamps
    end
  end
end
