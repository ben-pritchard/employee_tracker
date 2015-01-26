class AddColumnToEmployees < ActiveRecord::Migration
  def change
    add_column(:employees, :terminated, :boolean)
  end
end
