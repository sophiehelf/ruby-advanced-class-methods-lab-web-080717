require 'pry'

class Song
  attr_accessor :name, :artist_name, :song
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def name=(name)
    @name = name
  end

  def artist_name=(artist_name)
    @artist_name = artist_name
  end

  def self.create
    song = self.new # song = new instance of song
    self.all << song
    song
  end

  def self.new_by_name(song)
    new_song = self.new
    new_song.name = song 
    new_song
  end

  def self.create_by_name(song)
    new_song = self.new 
    new_song.name = song 
    self.all << new_song
    new_song
  end

  def self.find_by_name(song)
    self.all.find do |chanson|
      chanson.name == song
    end
  end

  def self.find_or_create_by_name(song)
    if self.find_by_name(song)
      self.find_by_name(song)
    else 
      self.create_by_name(song)
    end
  end

  def self.alphabetical
   self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    chopped = filename.split(".")[0]
    song_artist = chopped.split(" - ")[0]
    song_name = chopped.split(" - ")[1]
    new_song = self.new 
    new_song.name = song_name 
    new_song.artist_name = song_artist
    new_song
  end

  def self.create_from_filename(filename)
    chopped = filename.split(".")[0]
    song_artist = chopped.split(" - ")[0]
    song_name = chopped.split(" - ")[1]
    new_song = self.new 
    new_song.name = song_name 
    new_song.artist_name = song_artist
    self.all << new_song
  end
  
  def self.destroy_all
    self.all.clear
  end

end
