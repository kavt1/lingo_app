class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.all
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    audioplayer
  end


# -----------------------------------------
# Playing each line with audio

  def audioplayer
    song = JSON.parse(open('lib/assets/data/perhaps.json').read)
    @title =  song['title']
    @author = song['author']
    @media_url = song['media_url']
    @lyrics = song['lyrics']
    @media_type = song['media_type']
    @transitions = get_lines_transitions(song['lyrics'])
    p "asdasdasdasdasd" + @media_url
  end


  def get_lines_transitions(lyrics)
    result = {}
    lyrics.each do |line|
      id = line['id']
      result[id.to_sym] = { time_start:  line['time_start'], time_end: line['time_end'] }
    end
    result;
  end

# ------------------------------------------









  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      # @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:title, :author, :time, :lyric_lineID, :tune)
    end

  def get_words_transitions(lyrics)
    result = {}
    lyrics.each do |line|
      words = line['words']
      if words
        words.each do |word|
          id = word['id']
          result[id.to_sym] = { time_start:  word['time_start'], time_end: word['time_end'] }
        end
      end
    end
    result
  end

  def get_lines_transitions(lyrics)
    result = {}
    lyrics.each do |line|
      id = line['id']
      result[id.to_sym] = { time_start:  line['time_start'], time_end: line['time_end'] }
    end
    result;
  end
end
