class Album
  attr_reader :id, :title, :artists
  attr_accessor  :tracks

  def initialize(id, title, artists)
    @id = id
    @title = title
    @artists = artists
    @tracks = []
  end

  def duration_min
    duration = 0
    @tracks.each do |track|
      duration += duration_ms_for(track).to_i
    end
    duration /= 60000.0
    duration.round(2)
  end

  def summary
    summary = "Name: #{@title}\n"
    summary += "Artists(s): #{@artists}\n"
    summary += "Duration (min.): #{duration_min}\n"
    summary += "Tracks\n"
    @tracks.each do |track|
      summary += "- #{title_for(track)}\n"
    end
    summary += "\n"
  end

  def duration_ms_for(track)
    track.duration_ms
  end

  def title_for(track)
    track.title
  end
end

class Track
  attr_reader :album_id, :id, :title, :track_number, :duration_ms

  def initialize(album_id, id, title, track_number, duration_ms)
    @album_id = album_id
    @id = id
    @title = title
    @track_number = track_number
    @duration_ms = duration_ms
  end
end
