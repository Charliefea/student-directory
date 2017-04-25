
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(student)

count =0
  while count < (student.count)
      string = " #{count + 1}. #{student[count][:name]}, from #{student[count][:countryofbirth]} and likes to #{student[count][:hobby]}  (#{student[count][:cohort]} cohort)"
      puts string.center(100)
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
    puts "What is their hobby?"
    hobby = gets.chomp
    puts "What is their country of birth?"
    birth = gets.chomp

    students << {name: name, cohort: :november, hobby: hobby, countryofbirth: birth  }
    puts "Now we have #{students.count} students"

    name = gets.chomp
  end
  students
end
students = input_students
print_header
print(students)
print_footer(students)
