class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string    :username,      null: false, default: ''
      t.text      :text,          null: false, default: ''
      t.integer   :user_id,       null: true
      t.timestamps null: false
    end
  end
end
