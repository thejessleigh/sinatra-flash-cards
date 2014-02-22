class AddColumnToDecks < ActiveRecord::Migration
  def up
    add_column :decks, :user_id, :integer, default: 1
  end

  def down
    remove_column :decks, :user_id
  end
end
