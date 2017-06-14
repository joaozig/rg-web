class AddPlanToFranchises < ActiveRecord::Migration
  def change
    add_column :franchises, :plan, :integer
  end
end
