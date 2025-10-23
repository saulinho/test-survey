class AddCheckedToReplyOptions < ActiveRecord::Migration[8.0]
  def change
    add_column :reply_options, :checked, :boolean
  end
end
