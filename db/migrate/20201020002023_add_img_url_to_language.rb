class AddImgUrlToLanguage < ActiveRecord::Migration[6.0]
  def change
    add_column :languages, :img_url, :string
  end
end
