class AddTopicToInstance < ActiveRecord::Migration[5.0]
  def change
    add_reference :instances, :topic, foreign_key: true
  end
end
