class AddTagToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :tag, :string
  end
end
