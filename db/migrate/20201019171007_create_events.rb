class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.integer :host_id
      t.integer :lang_topic_id
      t.string :location
      t.date :date
      t.integer :time

      t.timestamps
    end
  end
end
