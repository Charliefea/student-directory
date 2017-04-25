
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(student)

count =0
  while count < (student.count)
      puts " #{count + 1}. #{student[count][:name]} (#{student[count][:cohort]} cohort)"
      count = count + 1
    end

end


def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end
students = input_students
print_header
print(students)
print_footer(students)
