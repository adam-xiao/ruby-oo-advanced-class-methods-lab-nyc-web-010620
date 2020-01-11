require "pry"

#Use self so that if you change the class variable name
#you dont have to change every damn class variable you used in your methods

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.find { |song|
      song.name == song_name
    }
  end

  def self.find_or_create_by_name(song_name)

    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name}
  end

  def self.new_from_filename(artist_song)
    info_parts = artist_song.chomp(".mp3").split(" - ")
    song = self.new
    song.name = info_parts[1]
    song.artist_name = info_parts[0]
    song
  end

  def self.create_from_filename(artist_song)
    info_parts = artist_song.chomp(".mp3").split(" - ")
    song = self.new
    song.name = info_parts[1]
    song.artist_name = info_parts[0]
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
