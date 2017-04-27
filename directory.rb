
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(student)
  months = []
  months = student.map {|x| x[:cohort]}
  months = months.uniq
  count = 1
  months.each do |month|
    student.each do |studentdata|
      if month == studentdata[:cohort] 
      string = "#{count} #{studentdata[:name]},(#{studentdata[:cohort]} cohort)"
          puts string.center(100)
          count = count + 1
      end
    end
  end 
end

def print_footer(names)
  
  if names.count == 1
      puts "Overall, we have a great student"
      name = gets.chomp
  else
      puts "Now we have #{names .count} students"
      name = gets.chomp
  end 
end

def input_students
  months = ['january','february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december']
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    puts "Which cohort?"
    cohort = gets.chomp.downcase

    while cohort.empty? do
      puts "Please enter a valid cohort"
      cohort = gets.chomp.downcase
    end
    
    while !months.include?(cohort) do
      puts "Please enter a valid cohort"
      cohort = gets.chomp.downcase
    end
    
    students << {name: name, cohort: cohort.capitalize.to_sym, }
    
      if students.count == 1
      puts "Now we have #{students.count} student"
      name = gets.chomp
      else
      puts "Now we have #{students.count} students"
      name = gets.chomp
      end 
  end
  
  students
end

students = input_students
print_header
print(students)
print_footer(students)
