class CreateAtms < ActiveRecord::Migration[7.0]
  def change
    create_table :atms, id: :uuid do |t|
      t.float :total, default: 0, null: false
      t.float :denomination, default: 0, null: false

      t.timestamps
    end
  end
end
