require("spec_helper")

describe(Employee) do
  it('tells which division the employee belongs to') do
    division = Division.create({:description => "Human Resources"})
    employee = Employee.create({:name => "Ben", :division_id => division.id})
    expect(employee.division).to(eq(division))
  end


  describe(".not_terminated") do
    it("returns the not terminated employees") do
      not_terminated_employee1 = Employee.create({:name => "Bob", :terminated => false})
      not_terminated_employee2 = Employee.create({:name => "Sue", :terminated => false})
      not_terminated_employees = [not_terminated_employee1, not_terminated_employee2]
      terminated_employee = Employee.create({:name => "Mac", :terminated => true})
      expect(Employee.not_terminated()).to(eq(not_terminated_employees))
    end
  end
end
