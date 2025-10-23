class CreateQuestionTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :question_types do |t|
      t.string :description

      t.timestamps
    end
  end
end
