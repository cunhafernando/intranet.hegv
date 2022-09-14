class AddAdminToUseres < ActiveRecord::Migration[7.0]
  def change
    add_column :useres, :admin, :boolean, :default =>  false
    #Ex:- :default =>''}
  end
end
