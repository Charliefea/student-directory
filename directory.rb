@students = []
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  
  if @students.empty?
    puts "There are no students"
  else
  months = []
  months = @students.map {|x| x[:cohort]}
  months = months.uniq
  number = 1
  months.each do |month|
    @students.each do |studentdata|
      if month == studentdata[:cohort] 
      string = "#{number} #{studentdata[:name]},(#{studentdata[:cohort]} cohort)"
          puts string.center(100)
          number = number + 1
      end
    end
  end 
  end
end

def print_footer
  
  if @students.count == 1
      puts "Overall, we have a great student"
      
  else
      puts "Now we have #{@students.count} students"
      
  end 
end

def input_students
  months = ['january','february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december']
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
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
    
    @students << {name: name, cohort: cohort.capitalize.to_sym, }
    
      if @students.count == 1
      puts "Now we have #{@students.count} student"
      name = gets.chop
      else
      puts "Now we have #{@students.count} students"
      name = gets.chop
      end 
  end
  
   @students
end

def interative_menu
  students = []
  loop do
    print_menu()
    process(gets.chomp) 
  end
end

def process(selection)
  case selection
    when "1"
      @students = input_students
    when "2"
      show_students()
    when "3"
      save_students()
    when "4"
      load_students()
    when "9"
      exit
    else
      "I don't know what you meant, try again"
    end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end 
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end
   
def show_students
  print_header
  print_students_list
  print_footer
end

interative_menu()
