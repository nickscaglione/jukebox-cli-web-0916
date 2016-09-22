songs = [
  "Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "Phoenix - Consolation Prizes",
  "Harry Chapin - Cats in the Cradle",
  "Amos Lee - Keep It Loose, Keep It Tight"
]

def help
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of the songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end

def list(songs)
  songs.each_with_index do |song, index|
    puts "#{index + 1}. #{song}"
  end
end

def play(songs)
  puts "Please enter a song name or number:"
  song_choice = gets.chomp
  song_played = false
  songs.each_with_index do |song, index|
    if song_choice == song || song_choice == "#{index + 1}"
      puts "Playing #{songs[index]}"
      song_played = true
    end
  end
  puts "Invalid input, please try again" if !song_played
end

def exit_jukebox
  puts "Goodbye"
end

def run(songs)
  help
  puts "Please enter a command:"
  command = gets.chomp
  until command == "exit" do
    if command == "play"
      play(songs)
    elsif command == "help"
      help
    elsif command == "list"
      list(songs)
    end
    puts "Please enter a command:"
    command = gets.chomp
  end
  exit_jukebox
end
