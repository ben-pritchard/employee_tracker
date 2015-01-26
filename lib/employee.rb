class Employee < ActiveRecord::Base
  scope(:not_terminated, -> do
    where({:terminated => false})
  end)

  belongs_to(:division)
  belongs_to(:project)
end
