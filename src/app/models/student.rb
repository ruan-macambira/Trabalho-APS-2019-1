class Student < User
  before_create {self.role = :student }
end
