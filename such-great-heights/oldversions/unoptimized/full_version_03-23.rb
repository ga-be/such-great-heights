# Eighth Notes Pattern No. 1
define :eighths_up do |note1, note2|
  2.times do
    play note1
    sleep 0.5
    play note2
    sleep 0.5
    play note1
    sleep 0.5
  end
  play note1
  sleep 0.5
  play note2
  sleep 0.5
end

# Eighth Notes Pattern No. 2
define :eighths_down do |note1, note2|
  2.times do
    play note1
    sleep 0.5
    play note2
    sleep 0.5
    play note1
    sleep 0.5
  end
  play note2
  sleep 0.5
  play note1
  sleep 0.5
end

# Opening Synth Pattern
define :opening_synth do
  2.times do
    4.times do
      play :C5, sustain: 0.4
      sleep 1
    end
    2.times do
      2.times do
        play :E5, sustain: 0.125
        sleep 0.5
        play :C5, sustain: 0.125
        sleep 0.5
      end
    end
  end
  7.times do
    play :D5, sustain: 0.4
    sleep 1
  end
  play :E5, sustain: 0.125
  sleep 0.5
  play :G5, sustain: 0.125
  sleep 0.5
end

# Bass Pattern
define :bass do
  # Measures 17-30
  8.times do
    play :F1
    sleep 1
  end
  8.times do
    play :A1
    sleep 1
  end
  8.times do
    play :G1
    sleep 1
  end
  8.times do
    play :F1
    sleep 1
  end
  8.times do
    play :A1
    sleep 1
  end
  16.times do
    play :G1
    sleep 1
  end
  # Measures 31-54
  3.times do
    8.times do
      play :F1
      sleep 1
    end
    8.times do
      play :A1
      sleep 1
    end
    8.times do
      play :G1
      sleep 1
    end
    4.times do
      play :Bb1
      sleep 1
    end
    4.times do
      play :C2
      sleep 1
    end
  end
  # Measures 55-62
  8.times do
    play :F1
    sleep 1
  end
  8.times do
    play :A1
    sleep 1
  end
  8.times do
    play :G1
    sleep 1
  end
  4.times do
    play :C2
    sleep 1
  end
  4.times do
    play :Bb1
    sleep 1
  end
  # Measures 63-78
  2.times do
    6.times do
      play :F1
      sleep 1
    end
    play :A1
    sleep 1
    play :B1
    sleep 1
    8.times do
      play :C2
      sleep 1
    end
    8.times do
      play :Bb1
      sleep 1
    end
    8.times do
      play :A1
      sleep 1
    end
  end
end

# Define Drum Sounds
# Snare
define :snare do
  with_fx :compressor, slope_above: 0, clamp_time: 0, relax_time: 0 do
    with_fx :distortion do
      with_fx :reverb, mix: 0.05, damp: 1, room: 0.1 do
        sample :elec_filt_snare, attack: 0, sustain: 0.04, rate: 2, amp: 2, release: 0
        sample :sn_dolf, attack: 0, sustain: 0.06, rate: 1.1, release: 0
      end
    end
  end
end

# Hi-Hat
define :hihat do
  with_fx :compressor, clamp_time: 0, relax_time: 0 do
    with_fx :reverb, mix: 0.2, damp: 1, room: 0.5 do
      sample :drum_cymbal_closed, rate: 1.25
    end
  end
end

# Kick
define :kick do
  with_fx :compressor, amp: 2, slope_above: 0, clamp_time: 0, relax_time: 0 do
    # with_fx :distortion do
    sample :bd_ada, amp: 2
    # end
  end
end

# SCORE STARTS HERE
use_bpm 175

# Panning Eighth Notes
# in_thread do
#   use_synth :sine
#   use_synth_defaults release: 0.4, amp: 1.75
#   with_fx :distortion, distort: 0.1 do
#     with_fx :nhpf, cutoff: 70 do
#       with_fx :panslicer, phase: 1 do
#         7.times do
#           eighths_up(:F3, :C4)
#           eighths_down(:F3, :C4)
#           eighths_up(:E3, :C4)
#           eighths_up(:E3, :C4)
#         end
#         eighths_up(:F3, :C4)
#         eighths_down(:F3, :C4)
#       end
#     end
#   end
# end

# Opening Synth
# in_thread do
#   use_synth :beep
#   #  use_synth_defaults amp: 0.5
#   with_fx :reverb, room: 0.1, damp: 1, reps: 5 do
#     opening_synth
#   end
# end

# Bass Line
in_thread do
  use_synth :tb303
  use_synth_defaults amp: 0.5, attack: 0.01, sustain: 0.5, release: 0.5, env_curve: 7, res: 0
  with_fx :nlpf, cutoff: 80 do
    # Measures 1-16
    # sleep 64
    bass
  end
end

# Drums
in_thread do
  # Measures 1-16
  # sleep 64
  # Measures 17-30 w/ opening filter
  with_fx :ixi_techno, mix: 1, phase: 112, res: 0 do
    with_fx :compressor, reps: 7 do
      3.times do
        kick
        sleep 0.5
        hihat
        sleep 0.5
        kick
        snare
        sleep 0.5
        hihat
        sleep 0.5
      end
      kick
      sleep 0.5
      hihat
      sleep 0.5
      kick
      snare
      sleep 0.5
      hihat
      sleep 0.25
      kick
      sleep 0.25
    end
  end
  # Measures 31+
  with_fx :compressor, amp: 1.5, reps: 192 do
    3.times do
      kick
      sleep 0.5
      hihat
      sleep 0.5
      kick
      snare
      sleep 0.5
      hihat
      sleep 0.5
    end
    kick
    sleep 0.5
    hihat
    sleep 0.5
    kick
    snare
    sleep 0.5
    hihat
    sleep 0.25
    kick
    sleep 0.25
  end
end
