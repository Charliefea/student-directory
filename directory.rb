
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
  #  count =0
  #  while count < (student.count)
  #      string = " #{count + 1}. #{student[count][:name]},(#{student[count][:cohort]} cohort)"
  #      puts string.center(100)
  #      count = count + 1
  #  end
 
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
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  
  students
end

students = input_students
print_header
print(students)
print_footer(students)
