class CreateGoodjobs < ActiveRecord::Migration[5.2]
  def change
    create_table :goodjobs do |t|
      t.references :user, foreign_key: true
      t.references :praised, foreign_key: true

      t.timestamps
    end
  end
end
