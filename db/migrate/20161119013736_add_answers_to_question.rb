class AddAnswersToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :answers, :string, array: true, default: []
  end
end
