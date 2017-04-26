
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(student)

count =0
  while count < (student.count)
      string = " #{count + 1}. #{student[count][:name]},(#{student[count][:cohort]} cohort)"
      puts string.center(100)
      count = count + 1
    end

end


def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def input_students
  months = ['january','february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december']
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    puts "Which cohort?"
    cohort = gets.chomp

    while cohort.empty? do
      puts "Please enter a valid cohort"
      cohort = gets.chomp
    end
    while !months.include?(cohort.downcase) do
      puts "Please enter a valid cohort"
      cohort = gets.chomp
    end
    students << {name: name, cohort: cohort.capitalize.to_sym, }
    puts "Now we have #{students.count} students"

    name = gets.chomp
  end
  students
end
students = input_students
print_header
print(students)
print_footer(students)
