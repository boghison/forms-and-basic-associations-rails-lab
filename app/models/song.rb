class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    artist.name unless artist.nil?
  end

  def artist_name=(name)
    Artist.find_or_create_by(name: name).songs << self
  end

  def note_contents
    notes.map {|n| n.content}
  end

  def note_contents=(contents)
    contents.each {|content| self.notes.build(content: content) unless content == ""}
  end
end
