class ToDoList
  def welcome
    puts "Welcome to the ToDoList program"
    puts "What is your name?"
    print ">> "
    @user_name = gets.chomp
    puts "Thanks, #{@user_name}."
    puts "-" * 30
    welcome_loop
  end

  def welcome_loop
    system ("clear")
    loop do
      puts "Press (a) to add your to-do list."
      puts "Press (c) to complete an item"
      puts "To view your ToDos press (l)"
      puts "Press (q) to quit."
      welcome_decision = gets.chomp.downcase
      if welcome_decision == "a"
        incomplete_list
      elsif welcome_decision == "c"
        completed_list
      elsif welcome_decision == "l"
        display_list
      elsif welcome_decision == "q"
        exit
      else
        puts "Try again"
        puts "-" * 30
      end
    end
  end

  def incomplete_list
    system "clear"
    @not_finished_list = []
    loop do
      puts "What do you need ToDo?"
      task = gets.chomp.downcase
      @not_finished_list.push(task)
      puts "Anything else to do today?"
      puts "Type (y)es or (n)o."
      user_add_choice = gets.chomp.downcase
      if user_add_choice == "y"
        puts "Ok."
      elsif user_add_choice == "n"
        display_list
      else
        puts "That's not a valid choice."
        sleep 2
      end
    end
  end

  def display_list
    system ("clear")
    loop do
      puts "Your lists are ready, #{@user_name}!"
      puts "Press (v) to view your ToDo List"
      puts "Press (c) to view your completed ToDos"
      puts "Press (m) to go back to the main menu"
      puts "Press (q) to quit"
      user_view_choice = gets.chomp.downcase
        if user_view_choice == "v"
          puts "You still need to do the following things:"
          puts @not_finished_list
          sleep 2
          puts "-" * 30
          display_list
        elsif user_view_choice == "c"
          puts "You've done the following things:"
          puts @finished_list
          sleep 2
          puts "-" * 30
          display_list
        elsif user_view_choice == "m"
          welcome_loop
        elsif user_view_choice == "q"
          exit 
        else
          puts "Try again"
        end
      end
  end

  def completed_list
    @finished_list = []
    puts "Your to-do list:"
    puts @not_finished_list
    puts "Your completed list:"
    puts @finished_list
    puts "What have you completed?"
    item_for_removal = gets.chomp.downcase
    list_check = @not_finished_list.any? {|word| word == item_for_removal}
      if list_check == true
        @finished_list.push(item_for_removal)
        @not_finished_list.delete_if {|word| word == item_for_removal}
        puts "Your task has been placed on your completed list."
        sleep 2
        puts "-" * 30
        welcome_loop
      else
        puts "We can't find a task on your list that matches what you wrote. Try again."
        sleep 2
        puts "-" * 30
        completed_list
      end
  end
end

ToDoList.new.welcome
