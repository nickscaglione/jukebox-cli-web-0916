#Here is the song hash you will be working with. Each key is a song name and each value is the location of it's mp3 file.
#make sure to edit the value of each key to replace < path to this directory >
#with the correct path to this directory on your computer

# my_songs = {
# "Go Go GO" => '/Users/nick-scaglione/Development/flatiron-0916/prework/labs/jukebox-cli-web-0916/audio/Emerald-Park/01.mp3',
# "LiberTeens" => '/Users/nick-scaglione/Development/flatiron-0916/prework/labs/jukebox-cli-web-0916/audio/Emerald-Park/02.mp3',
# "Hamburg" =>  '/Users/nick-scaglione/Development/flatiron-0916/prework/labs/jukebox-cli-web-0916/audio/Emerald-Park/03.mp3',
# "Guiding Light" => '/Users/nick-scaglione/Development/flatiron-0916/prework/labs/jukebox-cli-web-0916/jukebox-cli/audio/Emerald-Park/04.mp3',
# "Wolf" => '/Users/nick-scaglione/Development/flatiron-0916/prework/labs/jukebox-cli-web-0916/audio/Emerald-Park/05.mp3',
# "Blue" => '/Users/nick-scaglione/Development/flatiron-0916/prework/labs/jukebox-cli-web-0916/audio/Emerald-Park/06.mp3',
# "Graduation Failed" => '/Users/nick-scaglione/Development/flatiron-0916/prework/labs/jukebox-cli-web-0916/audio/Emerald-Park/07.mp3'
# }

def help
  #this method should be the same as in jukebox.rb
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of the songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end



def list(my_songs)
  #this method is different! Collect the keys of the my_songs hash and
  #list the songs by name
  my_songs.each do |title, path|
    puts title
  end
end


def play(my_songs)
  #this method is slightly different!
  #you should still ask the user for input and collect their song choice
  #this time, only allow user's to input a song name
  #check to see if the name they give is in fact a key of the my_songs hash
  #if it isn't, tell them their choice is invalid
  #if it is, play the song using the system 'open <file path>' syntax
  #get the file path of the song by looking it up in the my_songs hash
  puts "Please enter a song name:"
  song_choice = gets.chomp
  song_played = false
  my_songs.each do |song, path|
    if song_choice == song
      puts "Playing #{song}"
      system "open #{path}"
      song_played = true
    end
  end
  puts "Invalid input, please try again" if !song_played
end

def exit_jukebox
  #this method is the same as in jukebox.rb
  puts "Goodbye"
end

def run(my_songs)
  #this method is the same as in jukebox.rb
  help
  puts "Please enter a command:"
  command = gets.chomp
  until command == "exit" do
    if command == "play"
      play(my_songs)
    elsif command == "help"
      help
    elsif command == "list"
      list(my_songs)
    end
    puts "Please enter a command:"
    command = gets.chomp
  end
  exit_jukebox
end
