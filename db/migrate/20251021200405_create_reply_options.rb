class CreateReplyOptions < ActiveRecord::Migration[8.0]
  def change
    create_table :reply_options do |t|
      t.string :checked
      t.references :option, null: false, foreign_key: true
      t.references :reply, null: false, foreign_key: true

      t.timestamps
    end
  end
end
