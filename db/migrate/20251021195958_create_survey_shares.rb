class CreateSurveyShares < ActiveRecord::Migration[8.0]
  def change
    create_table :survey_shares do |t|
      t.references :survey, null: false, foreign_key: true
      t.string :token
      t.boolean :used

      t.timestamps
    end
  end
end
