class CreateQuestion < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string     :content
      t.string     :title

      t.timestamps
    end
  end
end
