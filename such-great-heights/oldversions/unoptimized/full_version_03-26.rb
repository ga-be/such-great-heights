# The Postal Service - Such Great Heights (Sonic Pi Version)
use_bpm 175
#------------------------------------------------------------------------------------------------------
#---------------------------------------- Panning Eighth Notes ----------------------------------------
in_thread do
  use_synth :sine
  use_synth_defaults release: 0.4, amp: 1.75
  with_fx :distortion, distort: 0.1 do
    with_fx :nhpf, cutoff: 70 do
      with_fx :panslicer, phase: 1 do
#        7.times do
#          play_pattern_timed [:F3, :C4, :F3, :F3, :C4, :F3, :F3, :C4], [0.5]
#          play_pattern_timed [:F3, :C4, :F3, :F3, :C4, :F3, :C4, :F3], [0.5]
#          play_pattern_timed [:E3, :C4, :E3, :E3, :C4, :E3, :E3, :C4], [0.5]
#          play_pattern_timed [:E3, :C4, :E3, :E3, :C4, :E3, :E3, :C4], [0.5]
#        end
#        play_pattern_timed [:F3, :C4, :F3, :F3, :C4, :F3, :F3, :C4], [0.5]
#        play_pattern_timed [:F3, :C4, :F3, :F3, :C4, :F3, :C4, :F3], [0.5]
        7.times do
          play_pattern_timed [:F4, :C5, :F4, :F4, :C5, :F4, :F4, :C5], [0.5]
          play_pattern_timed [:F4, :C5, :F4, :F4, :C5, :F4, :C5, :F4], [0.5]
          play_pattern_timed [:E4, :C5, :E4, :E4, :C5, :E4, :E4, :C5], [0.5]
          play_pattern_timed [:E4, :C5, :E4, :E4, :C5, :E4, :E4, :C5], [0.5]
        end
        play_pattern_timed [:F4, :C5, :F4, :F4, :C5, :F4, :F4, :C5], [0.5]
        play_pattern_timed [:F4, :C5, :F4, :F4, :C5, :F4, :C5, :F4], [0.5]
end end end end
#-----------------------------------------------------------------------------------------------
#---------------------------------------- Opening Synth ----------------------------------------
in_thread do
  use_synth :subpulse
  with_fx :reverb, mix: 0.2, room: 0.1, damp: 1, reps: 5 do
    2.times do
      play_pattern [:C5, :C5, :C5, :C5], sustain: 0.4, amp: 1.5, release: 0.75
      play_pattern_timed [:E5, :C5, :E5, :C5, :E5, :C5, :E5, :C5], [0.5], sustain: 0.125, release: 0.75
    end
    play_pattern [:D5, :D5, :D5, :D5, :D5, :D5, :D5], sustain: 0.4, amp: 1.5, release: 0.75
    play_pattern_timed [:E5, :G5], [0.5], sustain: 0.125, release: 0.75
end end
#-------------------------------------------------------------------------------------------
#---------------------------------------- Bass Line ----------------------------------------
in_thread do
  use_synth :tb303
  use_synth_defaults amp: 0.6, env_curve: 7, res: 0, attack: 0, sustain: 0.875, release: 0.05
  sleep 64                                                    # Measures 1-16
  with_fx :normaliser do
    with_fx :nlpf, cutoff: 80 do
      with_fx :echo, phase: 1, decay: 1.975, max_phase: 1 do
        play_pattern_timed [:F1, :A1, :G1, :F1,               # Measures 17-24
                            :A1, :G1, :G1], [8]               # Measures 25-30
        3.times do
          play_pattern_timed [:F1, :F1, :A1, :A1,             # Measures 31-34, 39-42, 47-50
                              :G1, :G1, :Bb1, :C2], [4]       # Measures 35-38, 43-46, 51-54
        end
        play_pattern_timed [:F1, :F1, :A1, :A1,               # Measures 55-58
                            :G1, :G1, :C2, :Bb1], [4]         # Measures 59-62
      end
      2.times do
        play_pattern [:F1, :F1, :F1, :F1, :F1, :F1]           # Measures 63-64, 71-72
        play_pattern [:A1, :B1]                               # Measures 63-64, 71-72
        with_fx :echo, phase: 1, decay: 1.975, max_phase: 1 do
          play_pattern_timed [:C2, :Bb1, :A1], [8]            # Measures 65-70, 73-78
end end end end end
#--------------------------------------------------------------------------------------------------------
#---------------------------------------- Vocals (Close enough!) ----------------------------------------
define :vocals do
  play_pattern_timed [:F4, :F4, :F4, :G4, :E4,   # measure 1
                      :C4, :C4,                  # measure 2
                      :E4, :E4, :E4, :F4, :D4,   # measure 3
                      :C4, :Bb3, :Bb3,           # measure 4
                      :Bb3, :Bb3, :Bb3, :Bb3,    # measure 5
                      :Bb3, :Bb3, :Bb3, :Bb3,    # measure 6
  :Bb3, :A3, :G3],                               # measures 7-8
    [1, 1, 1, 0.5, 3.5,  # measure 1
     0.5, 0.5,           # measure 2
     0.5, 1, 1, 1, 1.5,  # measure 3
     1, 1, 1,            # measure 4
     0.5, 1, 1, 1.5,     # measure 5
     0.5, 1, 1, 1.5,     # measure 6
     0.5, 1.5, 1]        # measure 7-8
end

in_thread do
  use_synth :fm
  use_synth_defaults attack: 0.1, release: 1, env_curve: 1, divisor: 1, depth: 2
  sleep 120  # Measures 1-30
  with_fx :reverb, mix: 0.3, room: 0.7, damp: 0.9 do
    with_fx :distortion do
      with_fx :nhpf, cutoff: 60 do
        play_pattern_timed [:F4, :C4], [3.5, 0.5]
        vocals
        play_pattern_timed [:F3, :F3, :F4], [1, 0, 4]
        vocals
        play_pattern_timed [:F3, :F3, :F4], [1, 0, 4]
        vocals
        play_pattern_timed [:F3, :C4, :F4, :C4], [0, 1, 3.5, 0.5]
        vocals
        play :F3
        sleep 1
end end end end
#---------------------------------------------------------------------------------------
#---------------------------------------- Drums ----------------------------------------
drum_loop = [ { # Measures 17, 19, 21, 23, 25, 27
                :bd_ada               => "X...X...X...X..." ,
                :sn_dolf              => "....X.......X..." ,
                :drum_cymbal_closed   => "..X...X...X...X." },
              { # Measures 18, 20, 22, 24, 28
                :bd_ada               => "X...X...X...X..X" ,
                :sn_dolf              => "....X.......X..." ,
                :drum_cymbal_closed   => "..X...X...X...X." },
              { # Measure 26
                :bd_ada               => "X...X...X...X..." ,
                :sn_dolf              => "....X.......X..." ,
                :drum_cymbal_closed   => "..X...X...X...X." ,
                :drum_cymbal_open     => "..X............." },
              { # Measure 29
                :bd_ada               => "X...X...X...X..." ,
                :sn_dolf              => "....X.......X..." ,
                :drum_cymbal_closed   => "..X...X.....X.X." ,
                :drum_cymbal_open     => "..........X....." },
              { # Measure 30
                :bd_ada               => "X...X...X.X.X.X." ,
                :sn_dolf              => "....X.X...X...X." ,
                :drum_cymbal_closed   => "....X.X...X...X." ,
                :drum_cymbal_open     => "..X............." ,
                :perc_snap2           => "......X...X...X." },
              { # Measures 31, 33, 35, 37, 39, 41, 43, 45, 47, 49, 51, 53, 55, 57, 59, 61
                :bd_ada               => "X.......X......." ,
                :sn_dolf              => "....X.......X..." ,
                :drum_cymbal_closed   => "..X...X...X...X." ,
                :perc_snap2           => "....X.......X..." },
              { # Measures 32, 36, 38, 40, 44, 46, 48, 52, 54, 56, 60, 62
                :bd_ada               => "X.......X......." ,
                :sn_dolf              => "....X.......X.X." ,
                :drum_cymbal_closed   => "..X...X...X...X." ,
                :perc_snap2           => "....X.......X..." },
              { # Measures 34, 42, 50, 58
                :bd_ada               => "X.......X......." ,
                :sn_dolf              => "....X.......X.X." ,
                :drum_cymbal_closed   => "..X...X.....X.X." ,
                :drum_cymbal_open     => "..........X....." ,
                :perc_snap2           => "....X.......X..." } ]
order1 = [0, 1, 0, 1, 0, 1,        # Measures 17-22
          0, 1, 0, 2, 0, 1, 3, 4]  # Measures 23-30
order2 = [5, 6, 5, 7, 5, 6, 5, 6,  # Measures 31-38
          5, 6, 5, 7, 5, 6, 5, 6,  # Measures 39-46
          5, 6, 5, 7, 5, 6, 5, 6,  # Measures 47-54
          5, 6, 5, 7, 5, 6, 5, 6]  # Measures 55-62
in_thread do
  sleep 64                              # Measures 1-16
  with_fx :ixi_techno, mix: 1, phase: 112, res: 0 do
    with_fx :compressor, amp: 2, slope_above: 0, clamp_time: 0, relax_time: 0 do
      with_fx :reverb, mix: 0.05, damp: 1, room: 0.1 do
        order1.each do |i|
          16.times do |j|
            drum_loop[i].each do |samp, patt|
              sample samp if patt[j] == "X"
            end
            sleep 0.25
  end end end end end
  with_fx :compressor, amp: 2, slope_above: 0, clamp_time: 0, relax_time: 0 do
    with_fx :reverb, mix: 0.1, damp: 1, room: 0.1 do
      order2.each do |i|
        16.times do |j|
          drum_loop[i].each do |samp, patt|
            sample samp if patt[j] == "X"
          end
          sleep 0.25
end end end end end
#-----------------------------------------------------------------------------------------------
#---------------------------------------- Crash Cymbals ----------------------------------------
define :bigCrash do |thisLong|
  sample :drum_splash_hard
  sleep thisLong
end
in_thread do
  sleep 120
  bigCrash(128)   # Measure 31
  6.times do      # Measure 63, 71, 79, 87, 95, 103
    bigCrash(32)
  end
  4.times do      # Measure 111, 117, 123, 129
    bigCrash(24)
  end
  sleep 1
  bigCrash(3)     # Measure 135.25
  4.times do
    bigCrash(32)  # Measure 136, 144, 152, 160
end end
