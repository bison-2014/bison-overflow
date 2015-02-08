class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string     :content
      t.integer    :commentable_id
      t.belongs_to :user
    end
  end
end
