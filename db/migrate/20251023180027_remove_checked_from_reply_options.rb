class RemoveCheckedFromReplyOptions < ActiveRecord::Migration[8.0]
  def change
    remove_column :reply_options, :checked, :string
  end
end
