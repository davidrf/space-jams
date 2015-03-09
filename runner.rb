require 'csv'
require_relative 'album.rb'

albums = []

CSV.foreach('space_jams.csv', headers: true, header_converters: :symbol) do |row|
  track_info = row.to_hash
  album = albums.find { |a| a.id == track_info[:album_id] }

  # if the album hasn't been added to the albums array yet, add it
  if album.nil?
    album = Album.new(track_info[:album_id], track_info[:album_name], track_info[:artists])
    albums << album
  end

  # add the track to the album's @tracks instance variable
  track = Track.new(track_info[:album_id], track_info[:track_id], track_info[:title], track_info[:track_number], track_info[:duration_ms])
  album.tracks << track
end

# print out the summary for each album
albums.each do |album|
  puts album.summary
end
