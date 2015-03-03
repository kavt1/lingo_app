json.array!(@songs) do |song|
  json.extract! song, :id, :title, :author, :time, :lyric_lineID, :tune
  json.url song_url(song, format: :json)
end
