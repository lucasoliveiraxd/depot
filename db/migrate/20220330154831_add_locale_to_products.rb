class AddLocaleToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :locale, :string, null: false, default: 'en'
  end
end
