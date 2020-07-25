require 'pry'

class Game
  attr_accessor :tl, :tm, :tr, :ml, :mm, :mr, :bl, :bm, :br

  @@turns = 0
  @@rounds = 1

  def initialize
    @tl = ' '
    @tm = ' '
    @tr = ' '
    @ml = ' '
    @mm = ' '
    @mr = ' '
    @bl = ' '
    @bm = ' '
    @br = ' '
    @x_o = 'X'
  end

  def start
    puts "..::TIC_TAC_TOE::.."
    puts "Type your square to play!!"
    puts "----------------\n"
    puts "| tl | tm | tr |\n"
    puts "----------------\n"
    puts "| ml | mm | mr |\n"
    puts "----------------\n"
    puts "| bl | bm | br |\n"
    puts "----------------\n"
    puts "\n"
    round_count
    board
  end

  def round_count
    puts "..::ROUND #{@@rounds}::.."
  end

  def board
    #winner
    puts "\s-------------\n"
    puts "\s| #{@tl} | #{@tm} | #{@tr} |\n"
    puts "\s-------------\n"
    puts "\s| #{@ml} | #{@mm} | #{@mr} |\n"
    puts "\s-------------\n"
    puts "\s| #{@bl} | #{@bm} | #{@br} |\n"
    puts "\s-------------\n"
    play_game
  end

  def x_o
    if @@turns.odd?
      'X'
    else
      'O'
    end
  end

  def fill_square(square)
    if square == ' '
      square[0] = x_o
    else
      puts "Space already filled. Try again."
      @@turns -= 1
    end
  end

  def play_game
    print "#{whose_turn} make your move>> "
    move = gets.chomp
    case move
    when 'tl'
      fill_square(@tl)
    when 'tm'
      fill_square(@tm)
    when 'tr'
      fill_square(@tr)
    when 'ml'
      fill_square(@ml)
    when 'mm'
      fill_square(@mm)
    when 'mr'
      fill_square(@mr)
    when 'bl'
      fill_square(@bl)
    when 'bm'
      fill_square(@bm)
    when 'br'
      fill_square(@br)
    when 'new'
      new_game
    when ''
      game_over
    else
      puts "Please enter a valid input."
      @@turns -= 1
    end
    board
  end

  def whose_turn
    @@turns += 1
    if @@turns.odd?
      "Player 1"
    else
      "Player 2"
    end
  end

  def new_game
    puts "New game? (y/n)"
    print ">> "
    result = gets.chomp
    if result == 'y'
      puts "\n"
      @tl = ' '
      @tm = ' '
      @tr = ' '
      @ml = ' '
      @mm = ' '
      @mr = ' '
      @bl = ' '
      @bm = ' '
      @br = ' '
      @@turns = 0
      @@rounds += 1
      round_count
      board
    elsif result == 'n'
      puts "Game resuming..."
      @@turns -= 1
    else
      puts "Input not recognised."
      new_game
    end
  end

  def game_over
    puts "You are about to end the game."
    puts "Are you sure? (y/n)"
    print ">> "
    result = gets.chomp
    if result == 'y'
      puts "Thanks for playing!"
      exit
    elsif result == 'n'
      puts "Game resuming..."
      @@turns -= 1
    else
      puts "Input not recognised."
      game_over
    end
  end

  def winner
    if (tl = 'X' && tm = 'X' && tr = 'X') ||
       (ml = 'X' && mm = 'X' && mr = 'X') ||
       (bl = 'X' && bm = 'X' && br = 'X') ||
       (tl = 'X' && ml = 'X' && bl = 'X') ||
       (tm = 'X' && mm = 'X' && mr = 'X') ||
       (tr = 'X' && mr = 'X' && br = 'X') ||
       (tl = 'X' && mm = 'X' && br = 'X') ||
       (bl = 'X' && mm = 'X' && tr = 'X')
      puts 'Player 1 wins!'
    elsif (tl = 'O' && tm = 'O' && tr = 'O') ||
      (ml = 'O' && mm = 'O' && mr = 'O') ||
      (bl = 'O' && bm = 'O' && br = 'O') ||
      (tl = 'O' && ml = 'O' && bl = 'O') ||
      (tm = 'O' && mm = 'O' && mr = 'O') ||
      (tr = 'O' && mr = 'O' && br = 'O') ||
      (tl = 'O' && mm = 'O' && br = 'O') ||
      (bl = 'O' && mm = 'O' && tr = 'O')
      puts 'Player 2 wins!'
    else
      puts "\n"
    end
  end
end

new_game = Game.new
new_game.start