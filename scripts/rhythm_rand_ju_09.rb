#https://in-thread.sonic-pi.net/t/recording-sonic-pi-output-into-wav-files-programatically/949
#https://in-thread.sonic-pi.net/t/recording-is-not-happening-with-osc-commands/4710

#file naming convension
feature = 'rhythm'
type = 'rand'
personID = 'ju'
version = '09'

#where to save
#save_file = "D:/Jupyter_Projects/Jupyter Notebooks/SEM_2/Music/#{Time.now.strftime("%H-%F")}-melody#{version}ju.wav"
save_file = "D:/Jupyter_Projects/Jupyter Notebooks/SEM_2/Music/#{feature}_#{type}_#{personID}_#{version}.wav"

#what port are we using
osc_send 'localhost',51235, '/start-recording','myGUID'

#generate some sound to record
in_thread(name: :one) do
  20.times do
    use_synth :piano
    play 47
    sleep rrand(0.2, 1.5)
    play 48
    sleep rrand(0.2, 1.5)
    play 49
    sleep rrand(0.2, 1.5)
    play 50
    sleep rrand(0.2, 1.5)
    play 53
    sleep rrand(0.2, 1.5)
    play 45
    sleep rrand(0.2, 1.5)
    play 55
    sleep rrand(0.2, 1.5)
    play 59
    sleep rrand(0.2, 1.5)
    play 57
    sleep rrand(0.2, 1.5)
    play 52
    sleep rrand(0.2, 1.5)
  end
end

#thread for saving
in_thread(name: :save) do
  #stop recording
  sleep 14 # The maximum total duration
  osc_send 'localhost',51235, '/stop-recording','myGUID'
  sleep 0.5
  #change the path in the next command to suit your system and usernames
  osc_send 'localhost',51235, '/save-recording','myGUID', save_file
end

