class Employee < ActiveRecord::Base
  scope(:not_terminated, -> do
    where({:terminated => false})
  end)

  belongs_to(:division)
  has_and_belongs_to_many(:projects)
end
