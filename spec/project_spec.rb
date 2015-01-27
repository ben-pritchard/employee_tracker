require("spec_helper")

describe(Project) do
  it("tells which employees are on a project") do
    employee = Employee.create({:name => "Tina"})
    project1 = Project.create({:title => "Drink tea", :employee_id => employee.id})
    project2 = Project.create({:title => "Drink coffee", :employee_id => employee.id})
    expect(project.employees).to(eq([employee1, employee2]))
  end

  it("allows multiple employees to work on the same project") do
    employee1 = Employee.create({:name => "Tina"})
    employee2 = Employee.create({:name => "Ben"})
    project1 = Project.create({:title => "Drink coffee"})
    project2 = Project.create({:title => "Drink tea"})
    employee1.update({:project_ids => [project1_id, project2_id]})
end
