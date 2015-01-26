require('spec_helper')

describe(Division) do
  it("tells which employees are in it") do
    division = Division.create({:description => "Human Resources"})
    employee1 = Employee.create({:name => "Henry", :division_id => division.id})
    employee2 = Employee.create({:name => "Jane", :division_id => division.id})
    expect(division.employees()).to(eq([employee1, employee2]))
  end
end
