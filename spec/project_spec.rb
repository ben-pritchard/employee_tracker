require("spec_helper")

describe(Project) do
  it("tells which employees are on a project") do
    project = Project.create({:title => "Drink tea"})
    employee1 = Employee.create({:name => "Tina", :project_id => project.id})
    employee2 = Employee.create({:name => "Gabe", :project_id => project.id})
    expect(project.employees).to(eq([employee1, employee2]))
  end

end
