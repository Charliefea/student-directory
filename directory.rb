
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(student)
  
  if student.count == 0 
    puts "There are no students"
  else
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
end

def print_footer(names)
  
  if names.count == 1
      puts "Overall, we have a great student"
      
  else
      puts "Now we have #{names.count} students"
      
  end 
end

def input_students
  months = ['january','february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december']
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chop
  while !name.empty? do
    puts "Which cohort?"
    cohort = gets.chop.downcase

    while cohort.empty? do
      puts "Please enter a valid cohort"
      cohort = gets.chop.downcase
    end
    
    while !months.include?(cohort) do
      puts "Please enter a valid cohort"
      cohort = gets.chop.downcase
    end
    
    students << {name: name, cohort: cohort.capitalize.to_sym, }
    
      if students.count == 1
      puts "Now we have #{students.count} student"
      name = gets.chop
      else
      puts "Now we have #{students.count} students"
      name = gets.chop
      end 
  end
  
  students
end

students = input_students
print_header
print(students)
print_footer(students)
