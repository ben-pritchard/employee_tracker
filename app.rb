require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/employee")
require("./lib/division")
require("./lib/project")
require("pg")
require("pry")


get('/') do
  @employees = Employee.all()
  @divisions = Division.all()
  erb(:index)
end

post('/divisions') do
  description = params.fetch('description')
  @divisions = Division.create({:description => description})
  redirect("/")
end

get('/divisions/:id/edit') do
  @division = Division.find(params.fetch("id").to_i())
  erb(:division_edit)
end

patch("/divisions/:id") do
  description = params.fetch("description")
  @division = Division.find(params.fetch("id").to_i())
  @division.update({:description => description})
  redirect("/")
end

get('/division/:id') do
  @division = Division.find(params.fetch("id").to_i())
  erb(:division)
end

post('/employees') do
  name = params.fetch('name')
  division_id = params.fetch('division_id')
  @employees = Employee.create({:name => name, :division_id => division_id, :terminated => false})
  redirect("/")
end

get('/employees/:id/edit') do
  @employee = Employee.find(params.fetch("id").to_i())
  erb(:employee_edit)
end

patch("/employees/:id") do
  name = params.fetch("name")
  @employee = Employee.find(params.fetch("id").to_i())
  @employee.update({:name => name})
  redirect("/")
end

get("/employee/:id") do
  @employee = Employee.find(params.fetch("id").to_i())
  @projects = @employee.projects
  erb(:employee)
end

post("/projects") do
  employee_id = params.fetch("employee_id")
  project_title = params.fetch("title")
  @project = Project.create({:title => project_title, :employee_id => employee_id})
  @projects = Project.all()
  @employee = Employee.find(employee_id)
  @employee.projects << @project
  erb(:employee)
end

get("/projects/:id") do
  erb(:project)
end
