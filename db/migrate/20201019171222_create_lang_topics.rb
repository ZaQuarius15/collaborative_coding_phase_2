class CreateLangTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :lang_topics do |t|
      t.integer :language_id
      t.integer :topic_id

      t.timestamps
    end
  end
end
