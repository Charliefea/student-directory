require 'csv'
@students = []
@months = ['january','february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december']

#Loading the students before the menu is printed 
def try_load_students 
  filename = ARGV.first
   if filename.nil?
    filename = 'students.csv'
    end 
  if File.exists?(filename)
    load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
    else 
      puts "Sorry, #{filename} doesn't exist"
      exit 
    end
  end
  
#Looping the printing of the menu   
def interative_menu
  students = []
  loop do
    print_menu()
    process(STDIN.gets.chomp) 
  end
end

#Printing the menu so the user can choose options
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file of your choosing"
  puts "4. Load the list from a file of your choosing"
  puts "9. Exit"
end

#Gives the methods required dependent on the choice of the user
def process(selection)
  case selection
    when "1"
      feedback(1)
      @students = input_students
    when "2"
      feedback(2)
      show_students()
    when "3"
      userfilename = ask_filename
      save_students(userfilename)
      feedback (3)
    when "4"
      userfilename = ask_filename
      load_students(userfilename)
      feedback (4)
    when "9"
      feedback(9)
      exit
    else
      "I don't know what you meant, try again"
    end
end

#Feedback for user that their menu choice is successful
def feedback (selection)
 puts  "Option #{selection} has been successful"
end 

#Ask user for a file name 
def ask_filename
  puts "Which file would you like to use?"
  filename = STDIN.gets.chomp
end

#Main method for the first task of the menu, inputting students 
def input_students 
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chop
  while !name.empty? do
    puts "Which cohort?"
    cohort = STDIN.gets.chop.downcase
    valid_cohort(cohort)
    add_students(name, cohort)
      if @students.count == 1
      puts "Now we have #{@students.count} student"
      name = STDIN.gets.chop
      else
      puts "Now we have #{@students.count} students"
      name = STDIN.gets.chop
      end 
  end
   @students
end

#Checking if the cohort is valid e.g. is it a blank value or is it one of the months of the year
def valid_cohort (cohort)
  while cohort.empty? || !@months.include?(cohort) do
      puts "Please enter a valid cohort"
      cohort = STDIN.gets.chop.downcase
  end
end

#prints a text header for the list of students. Part of option 2 of the menu
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

#Prints list of students in month order. This is part of option 2 of the menu 
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

#Prints the footer. Part of option 2 of the menu
def print_footer
  if @students.count == 1
      puts "Overall, we have a great student"
  else
      puts "Now we have #{@students.count} students"
  end 
end

#Option 3 of the menu,saves the names of the students to a file
def save_students(filename = "students.csv")
  CSV.open(filename, "wb") do |csv| 
  @students.each do |student|
    csv << [student[:name], student[:cohort]]
  end 
  end
end

#Loads students from file. Option 4 from the menu
def load_students(filename = "students.csv")
  CSV.foreach(filename) do |row|
  name, cohort = row
    add_students(name, cohort)
end
end

#Adds students to the @students array
def add_students (name, cohort)
 @students << {name: name, cohort: cohort.capitalize.to_sym}
end

#Method called for option 2 of the menu   
def show_students
  print_header
  print_students_list
  print_footer
end

try_load_students
interative_menu()
