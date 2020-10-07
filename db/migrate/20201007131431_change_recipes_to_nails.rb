class ChangeRecipesToNails < ActiveRecord::Migration[6.0]
  def change
    rename_table :recipes, :nails
  end
end
