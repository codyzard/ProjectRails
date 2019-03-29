class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
    	
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.string :content

      t.timestamps
    end
    #add_index :comments, [:user_id, :book_id], unique: true
  end
end
