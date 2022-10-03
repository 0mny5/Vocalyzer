
class EffectJudge
  def chord_effect
    scale = ["C", "C#", "D♭", "D", "D#", "E♭", "E", "F", "F#", "G♭", "G", "G#", "A♭", "A", "A#", "B♭", "B"]
    c = scale.sample(2).join(" → ")

    if c == "C → G"
      puts "#{c} " + " ドミナントモーション"
    elsif c == "G → D"
      puts "#{c} " + " ドミナントモーション"
    else
      puts c
    end
  end
end

100.times do
  e = EffectJudge.new
  puts e.chord_effect
end
