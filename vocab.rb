require_relative "wordlist"

class Vocab
  def initialize
    @new_words = []
    @new_words_hash = {}
  end

  def option_list
    loop do
      puts "\n"
      puts "Here is a handy place to jot down new words and test your vocabulary!"
      puts "1. Add a new word"
      puts "2. See all words"
      puts "3. Quiz mode"
      puts "4. Exit"
      print "Choose an option: "
      option = gets.chomp.to_i
      puts "\n"
      case option
      when 1
        add_word
      when 2
        show_words
      when 3
        quiz
      when 4
        puts "Keep learning! Read a new book today!"
        break
      else
        puts "Please choose another option!"
      end
    end
  end

  private

  def add_word
    print "What is the word? "
    new_word = gets.chomp
    print "What is the definition? "
    definition_of_word = gets.chomp
    @new_words << Wordlist.new(new_word, definition_of_word)
    puts "The new word has been added to the list!"

    @new_words_hash = @new_words.each_with_object({}) do |nw, df|
      new_word = nw.instance_variable_get(:@new_word)
      definition_of_word = nw.instance_variable_get(:@definition_of_word)
      df.store(new_word, definition_of_word)
    end
  end

  def show_words
    if @new_words_hash.empty? != true
      puts "Here are the words you have added: "
      @new_words_hash.each do |nw, df|
        puts "#{nw}: #{df}"
      end
    else
      puts "You need to add a word first! Choose option 1 to add a word"
    end
  end

  def quiz
    if @new_words_hash.empty? != true
      loop do
        puts "Let's test your knowledge! Type '1' to continue, otherwise choose '2' to return to the previous menu "
        option = gets.chomp.to_i
        case option
        when 1
          @sample_key = @new_words_hash.keys.sample
          @sample_value = @new_words_hash[@sample_key]

          puts "#{@sample_key}"

          quiz_cont
          break
        when 2
          break
        else
          puts "Please choose another option!"
        end
      end
    else
      puts "You need to add a word first! Choose option 1 to add a word"
    end
  end

  def quiz_cont
    loop do
      puts "Type '1' to see the definition or select 2 to return to the previous menu "
      option = gets.chomp.to_i
      case option
      when 1
        puts "#{@sample_value}"
        quiz
        break
      when 2
        break
      else
        puts "Please choose another option!"
      end
    end
  end
end
