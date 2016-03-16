class Tasks
  attr_accessor :item

  def initialize(input)
    @item = input.gsub('').strip
  end
end

class List
  attr_accessor :todos

  def initialize(items)
    @todos = items
  end

  def add(lists)
    @todos << Todos.new(list)
    @todos.last
  end

  def done(index)
    todo = @todos.delete_at(index.to_i-1)
    todo.context = '@done'
  end
end


puts "----------Welcome to ToDos----------"
sleep (0.7)
puts "---Press (s) to start the program---"
puts "---Press (q) to leave the program---"
initial_response = gets.chomp.to_s

  if initial_response == "q"
    puts "Come back any time"
  elsif initial_response == "s"
    puts "Alright, What would you like to do?"
  end

  puts "To add a todo type: 'add name_of_todo'"
  puts "To complete a todo type: 'done number_of_todo"
  puts "Typing 'List' will list your current todos"

  loop do
    case ARGV[0]
    when 'list','ls'
      List.new( item => ARGV[1]).list
    when 'add','a'
      puts "Added: #{List.new.add(ARGV[1..-1].join(' '))}"
    when 'done'
      puts "Done: #{List.new.done(ARGV[1])}"
    end
  end
